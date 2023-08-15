import UIKit
import Flutter
import f_unity
import UnityFramework
import openinstall_flutter_plugin

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate  {

      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        //InitUnityIntegrationWithOptions(argc: CommandLine.argc, argv: CommandLine.unsafeArgv, launchOptions)

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    
    override func applicationDidEnterBackground(_ application: UIApplication) {
        UnityFramework.getInstance().pause(true);
    }
    
    override func applicationDidBecomeActive(_ application: UIApplication) {
        UnityFramework.getInstance().pause(false);
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
