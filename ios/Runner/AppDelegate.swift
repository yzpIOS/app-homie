import UIKit
import Flutter
import f_unity

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate  {
    

      override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
      ) -> Bool {
        //InitUnityIntegrationWithOptions(argc: CommandLine.argc, argv: CommandLine.unsafeArgv, launchOptions)
        
          setDefaultHandler()
    
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
      }
    
    public func setDefaultHandler() {
            NSSetUncaughtExceptionHandler { (exception) in
                let arr:NSArray = exception.callStackSymbols as NSArray
                let reason:String = exception.reason!
                let name:String = exception.name.rawValue
                let date:NSDate = NSDate()
                let timeFormatter = DateFormatter()
                timeFormatter.dateFormat = "YYYY/MM/dd hh:mm:ss SS"
                let strNowTime = timeFormatter.string(from: date as Date) as String
                let url:String = String.init(format: "========异常错误报告========\ntime:%@\nname:%@\nreason:\n%@\ncallStackSymbols:\n%@",strNowTime,name,reason,arr.componentsJoined(by: "\n"))
                debugPrint(url)
                let documentpath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true).last!
                let path = documentpath.appending("Exception.txt")
                do{
                try
                url.write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
                }catch{}
            }
      }
}

//import UIKit
//import Flutter
//import f_unity
//
//@UIApplicationMain
//@objc class AppDelegate: FlutterAppDelegate {
//
//
//    override func application(_ application: UIApplication,
//                              didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        //InitUnityIntegrationWithOptions(argc: CommandLine.argc, argv: CommandLine.unsafeArgv, launchOptions)
//        GeneratedPluginRegistrant.register(with: self)
//
//        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
//    }
//}
