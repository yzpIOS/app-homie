import Flutter
import UIKit
import UnityFramework

public class FUnityPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "f_unity", binaryMessenger: registrar.messenger())
        let instance = FUnityPlugin()
        
        let factory = FLNativeViewFactory(messenger: registrar.messenger())
    
        registrar.register(factory, withId: "f_unity/unity_view")
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        UnityHandle.onUnityMessage { message in
            channel.invokeMethod("onUnityMessage", arguments: message)
        }
        
        UnityHandle.onUnitySceneLoaded { name, buildIndex, isLoaded, isValid in
            let message: [String: Any] = [
                "name": name,
                "buildIndex": buildIndex,
                "isLoaded": isLoaded,
                "isValid": isValid,
            ]
            
            channel.invokeMethod("onUnitySceneLoaded", arguments: message)
        }
    }
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "postMessage":
            let args = call.arguments as! [String: String]
            
            UnityHandle.sendMessage(
                gameObject: args["gameObject"]!,
                methodName: args["methodName"]!,
                message: args["message"]!
            )
            
            if(args["message"]!.contains("flutter_tell_ios_stop_render_event")) {
                UnityFramework.getInstance().pause(true);
            } else if(args["message"]!.contains("flutter_tell_ios_resumt_render_event")) {
                UnityFramework.getInstance().pause(false);
            }
        
            result(nil)
        default:
            result(FlutterMethodNotImplemented)
        }
    }
}
