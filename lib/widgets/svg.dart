import 'package:app/tools.dart';
import 'package:app/widgets.dart';
import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/services.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:quiver/collection.dart';

typedef _Key = Tuple2<String, Color?>;

class SvgView extends StatelessWidget {
  final String asset;
  final BoxFit fit;
  final Color? color;
  final double? width, height;

  SvgView(
    this.asset, {
    Key? key,
    this.color,
    this.width,
    this.height,
    bool? permanent,
    this.fit = BoxFit.contain,
  }) : super(key: key ?? (permanent == true ? GlobalStringKey(asset) : null));

  static final _cache = LruMap<_Key, ScalableImage>(maximumSize: 30);
  static final _task = <_Key, Future<ScalableImage>>{};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: $ImageView(color),
    );
  }

  Widget $ImageView(Color? currentColor) {
    final key = Tuple2(asset, currentColor);

    final img = _cache[key];
    if (img != null) return _onImage(img);

    return FutureBuilder(
      future: _task[key] ??= _loadAsset(key),
      builder: (context, snapshot) {
        final data = snapshot.data;

        return data == null ? _onLoading(context) : _onImage(data);
      },
    );
  }

  Widget _onImage(ScalableImage data) {
    return ScalableImageWidget(
      si: data,
      fit: fit,
      clip: false,
      isComplex: true,
    );
  }

  Widget _onLoading(_) => Spacing.blank;

  static Future<ScalableImage> _loadAsset(_Key key) async {
    try {
      return _cache[key] = await ScalableImage.fromSIAsset(
        rootBundle,
        key.value1,
        currentColor: key.value2,
      );
    } finally {
      _task.remove(key);
    }
  }

  static Future<ScalableImage> preload(String svg) {
    final key = _Key(svg, null);

    return _task[key] ??= _loadAsset(key);
  }
}
