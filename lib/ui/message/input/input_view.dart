import 'package:app/tools.dart';
import 'package:app/types.dart';
import 'package:app/ui/message/input/ext/export.dart';
import 'package:app/ui/message/input/ext/input_panel_emoji.dart';
import 'package:app/ui/message/input/ext/input_top_more.dart';
import 'package:app/ui/message/input/input_ctrl.dart';
import 'package:app/widgets.dart';

class InputConfig {
  final InputCtrl ctrl;
  final TopMixin voice, input, emoji, more;

  InputConfig._({required this.ctrl, required List<ActionMixin> moreActions})
      : voice = InputTop$Voice(inputCtrl: ctrl),
        input = InputTop$Input(inputCtrl: ctrl),
        emoji = InputTop$Emoji(inputCtrl: ctrl),
        more = InputTop$More(inputCtrl: ctrl, actions: moreActions);

  factory InputConfig.userChat(UID uid, InputCtrl ctrl) {
    return InputConfig._(
      ctrl: ctrl,
      moreActions: [
        // InputAction$Call(ctrl),
        InputAction$Image(ctrl),
        // InputAction$Shop(ctrl),
        InputAction$Gift(ctrl),
        InputAction$Report(uid, ctrl),
      ],
    );
  }
}

class InputView extends StatefulWidget {
  final InputConfig _inputCfg;

  InputView(this._inputCfg) : super(key: ValueKey(_inputCfg));

  @override
  State<InputView> createState() => _InputViewState();
}

class _InputViewState extends State<InputView> {
  final _key = GlobalKey();

  late final _inputCfg = widget._inputCfg;
  late final _inputCtrl = _inputCfg.ctrl;

  @override
  void dispose() {
    //TODO 在这释放可能有问题
    _inputCtrl.onDelete();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputCtrl>(
      key: _key,
      global: false,
      init: _inputCtrl,
      builder: (it) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TxtInputView(_inputCfg),
            _PanelView(it.panelRx),
          ],
        );
      },
    );
  }
}

class _PanelView extends StatelessWidget {
  final Rx<PanelMixin?> panelRx;

  const _PanelView(this.panelRx);

  @override
  Widget build(BuildContext context) {
    return ObxValue<Rx<PanelMixin?>>(
      (it) {
        final panel = it();

        return panel == null //
            ? $KeyboardBlank()
            : $KeyboardHolder(child: panel.genPanel);
      },
      panelRx,
    );
  }
}

class _TxtInputView extends StatelessWidget {
  final InputConfig config;

  const _TxtInputView(this.config);

  static const double _minHeight = 50;

  @override
  Widget build(BuildContext context) {
    const spacing = Spacing.w6;

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: _minHeight, maxHeight: _minHeight * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          spacing,
          _icon(config.voice.toTopView),
          spacing,
          Expanded(
            child: Padding(
              padding: const Pad(vertical: 10),
              child: config.input.toTopView,
            ),
          ),
          spacing,
          _icon(config.emoji.toTopView),
          _icon(config.more.toTopView),
          spacing,
        ],
      ),
    );
  }

  Widget _icon(Widget child) => SizedBox(height: _minHeight, child: child);
}
