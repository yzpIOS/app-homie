import Flutter
import UIKit
import AdSupport
import AppTrackingTransparency//适配iOS14
import AdServices

public class OaidPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "oaid", binaryMessenger: registrar.messenger())
        let instance = OaidPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        //debugPrint("ios获取IDFA开始...")
        switch call.method {
        case "getPlatformVersion":
          result("iOS " + UIDevice.current.systemVersion)
        case "getIDFA":
            
            //权限申请
            if #available(iOS 14.0, *) {
                // 获取ASA广告归因
                //debugPrint("ios获取IDFA开始11111.22...")
                ATTrackingManager.requestTrackingAuthorization(completionHandler: {status in
                    self.opInit(result: result);//不管用户是否授权，都要初始化
                })
            }else{
                //debugPrint("ios获取IDFA开始22222...")
                opInit(result: result);
            }
            break
        default:
          result(FlutterMethodNotImplemented)
        }
    }
    
    func opInit(result: @escaping FlutterResult){
        var dictionary = Dictionary<String, Any>()
        // 获取ASA归因
        if #available(iOS 14.3, *) {
            do {
                let token = try AAAttribution.attributionToken();
                dictionary["OP_ASA_Token"] = token
            } catch {}
        }
        
        // 获取IDFA
        let idfaStr = ASIdentifierManager.shared().advertisingIdentifier.uuidString
        dictionary["IDFA"] = idfaStr
        result(dictionary)
    }
}
