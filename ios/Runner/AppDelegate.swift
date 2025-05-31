import UIKit
import Flutter
import f_unity
import UnityFramework
import openinstall_flutter_plugin
import AdSupport
import AppTrackingTransparency//适配iOS14

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate  {

      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        //InitUnityIntegrationWithOptions(argc: CommandLine.argc, argv: CommandLine.unsafeArgv, launchOptions)
        //主程要求启动页多停留几秒
          sleep(2);
//          BackgroudTaskManager.sharedManager.setup();
          

        GeneratedPluginRegistrant.register(with: self)
          
//          XTBackRunningManager.share();
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    
    override func applicationDidEnterBackground(_ application: UIApplication) {
        UnityFramework.getInstance().pause(true);
        AppBackgroundTaskManager.shared.startBackgroundTask(app: application)
    }
    
    override func applicationWillEnterForeground(_ application: UIApplication) {
        AppBackgroundTaskManager.shared.stopBackgroundTask()
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        UnityFramework.getInstance().pause(false);
        //权限申请
        if #available(iOS 14.0, *) {
            ATTrackingManager.requestTrackingAuthorization(completionHandler: {status in
                let idfaStr = ASIdentifierManager.shared().advertisingIdentifier.uuidString
                debugPrint(" = " + idfaStr)
            })
        }
    }

    //2）首次集成插件的用户，如果拉起无法获取到参数，是因为方法被其它插件覆盖导致（openinstall插件不会覆盖其它插件），可以有两种方法解决：
    override func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        //处理通过openinstall一键唤起App时传递的数据
        OpeninstallFlutterPlugin.continue(userActivity)
        return true;
    }

    //第二种方法，将所有插件的拉起代理方法的逻辑，统一在AppDelegate文件中来处理，代码如下：
    override func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        OpeninstallFlutterPlugin.handLinkURL(url)
        return true;
    }
}
