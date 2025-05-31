import Foundation
import UnityFramework

public class UnityHandle {
    var keys = [Int64]()
    var views = [UIView]()
    
    var showId: Int64 = -1
    
    private static let unity: UnityFramework = _init()
    
    private static func _init() -> UnityFramework {
        let bundlePath = Bundle.main.bundlePath.appending("/Frameworks/UnityFramework.framework")
        
        let unityBundle = Bundle(path: bundlePath)!
        
        let instance = unityBundle.principalClass!.getInstance()!
        
        instance.setDataBundleId("com.unity3d.framework")
        instance.runEmbedded(withArgc: CommandLine.argc, argv: CommandLine.unsafeArgv, appLaunchOpts: [:])
        instance.showUnityWindow()
        
        return instance
    }
    
    static func sendMessage(gameObject: String, methodName: String, message: String) {
        unity.sendMessageToGO(withName: gameObject, functionName: methodName, message: message)
    }
    
    static func onUnityMessage(handler: ((_ message: String) -> Void)?) {
        let ctrl = unity.appController()!
        
        if handler == nil {
            ctrl.unityMessageHandler = nil
        } else {
            func _onUnityMessage(message: UnsafePointer<Int8>?) {
                handler!(
                    String(utf8String: message!)!
                )
            }
            
            ctrl.unityMessageHandler = _onUnityMessage
        }
    }
    
    static func onUnitySceneLoaded(handler: ((_ name: String, _ buildIndex: Int, _ isLoaded: Bool, _ isValid: Bool) -> Void)?) {
        let ctrl = unity.appController()!
        
        if handler == nil {
            ctrl.unitySceneLoadedHandler = nil
        } else {
            func _onUnitySceneLoaded(name: UnsafePointer<Int8>?, buildIndex: UnsafePointer<Int32>?, isLoaded: UnsafePointer<Bool>?, isValid: UnsafePointer<Bool>?) {
                handler!(
                    String(utf8String: name!)!,
                    Int(bitPattern: buildIndex),
                    Bool(Int(bitPattern: isLoaded) != 0),
                    Bool(Int(bitPattern: isValid) != 0)
                )
            }
            
            ctrl.unitySceneLoadedHandler = _onUnitySceneLoaded
        }
    }
    
    private func _addTo(view: UIView) {
        let ctrl = UnityHandle.unity.appController()!
        
        let unityView = ctrl.rootView!
        
        if let superView = unityView.superview {
            unityView.removeFromSuperview()
            superView.layoutIfNeeded()
        }
        
        unityView.frame = view.bounds
        
        view.addSubview(unityView)
    }

    func addTo(viewId: Int64, view: UIView) {
        if(view == nil) {
            return
        }
        _addTo(view: view)
        
        showId = viewId
        
        keys.append(viewId)
        views.append(view)
    }
    
    func dispose(viewId: Int64) {
        if let i = keys.firstIndex(of: viewId) {
            keys.remove(at: i)
            views.remove(at: i)
            
            if showId == viewId, !keys.isEmpty {
                showId = keys.last!
                _addTo(view: views.last!)
            }
        }
    }
}
