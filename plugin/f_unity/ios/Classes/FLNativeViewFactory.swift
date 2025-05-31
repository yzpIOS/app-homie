import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
    private let unity = UnityHandle()
    private let messenger: FlutterBinaryMessenger

    init(messenger: FlutterBinaryMessenger) {
        self.messenger = messenger
        super.init()
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        let view = UIView(frame: frame)

        let channel = FlutterMethodChannel(name: String(format: "f_unity/unity_view_%lld", viewId), binaryMessenger: messenger)

        func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
            switch call.method {
            case "dispose":
                channel.setMethodCallHandler(nil)

                unity.dispose(viewId: viewId)

                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        }

        channel.setMethodCallHandler(handle)

        unity.addTo(viewId: viewId, view: view)

        return FLNativeView(_view: view)
    }
}

private class FLNativeView: NSObject, FlutterPlatformView {
    private let _view: UIView

    init(_view: UIView) {
        self._view = _view
    }

    func view() -> UIView { return _view }
}
