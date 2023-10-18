import 'package:app/3rd/sentry/sentry.dart';
import 'package:app/common/theme.dart';
import 'package:app/tools.dart';
import 'package:app/tools/special_text.dart';
import 'package:app/ui/app.dart';
import 'package:app/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:slugid/slugid.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loggerInit(Slugid.nice().toString());

  await asyncTrack(
    'App 初始化',
    action: () async {
      FlutterNativeSplash.preserve(widgetsBinding: WidgetsBinding.instance);
      asyncTrack('Executor 初始化', action: executorInit);

      await Future.wait(
        [
          asyncTrack('KvBox 初始化', action: KvBox.init),
          asyncTrack('Tools 初始化', action: toolsInit),
        ],
        eagerError: true,
      );
      // test
      await SentryHelp.initApp(
        MultiProvider(
          providers: await _providers,
          child: const ExcludeSemantics(
            child: OKToast(
              movingOnWindowChange: false,
              child: App(),
            ),
          ),
        ),
      );
    },
  );

  loadDebugConfig();
}

Future<List<SingleChildWidget>> get _providers async {
  final emj = await emojis;
  final px1 = AppSize.px1;

  //默认数据
  return [
    Provider.value(
      value: TableCfg(
        itemExtent: 52,
        itemColor: Colors.transparent,
        itemDivider: PreferredSize(
          preferredSize: Size.fromHeight(px1),
          child: Divider(color: AppPalette.divider, height: px1, thickness: px1),
        ),
      ),
    ),
    Provider<SpecialTextSpanBuilder>.value(
      value: DefaultSpecialTextSpanBuilder(emj: emj.value2),
    ),
    BaseConfig.defaultProvider,
    ...ViewState.providers,
  ];
}
