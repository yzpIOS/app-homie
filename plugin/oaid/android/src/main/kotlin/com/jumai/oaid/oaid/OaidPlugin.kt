package com.jumai.oaid.oaid

import android.content.Context
import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull
import com.bun.miitmdid.core.ErrorCode
import com.bun.miitmdid.core.MdidSdkHelper
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.concurrent.atomic.AtomicBoolean


/** OaidPlugin */
class OaidPlugin: FlutterPlugin, MethodCallHandler {


  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private var channel: MethodChannel? = null
  private var applicationContext: Context? = null
  private var mainHandler: Handler? = null

  // --- FlutterPlugin

  // --- FlutterPlugin
  override fun onAttachedToEngine(binding: FlutterPluginBinding) {
    channel = MethodChannel(binding.binaryMessenger, "oaid")
    channel?.setMethodCallHandler(this)
    applicationContext = binding.applicationContext
    mainHandler = Handler(Looper.getMainLooper())
  }

  override fun onDetachedFromEngine(binding: FlutterPluginBinding) {
    channel?.setMethodCallHandler(null)
    channel = null
    applicationContext = null
    mainHandler?.removeCallbacksAndMessages(null)
    mainHandler = null
  }

  // --- MethodCallHandler

  // --- MethodCallHandler
  override fun onMethodCall(call: MethodCall, result: Result) {
    System.out.println("flutter调用代码: ${call.method}")
    if ("getOaid" == call.method) {
      val completed = AtomicBoolean(false)
      try {
        val code = MdidSdkHelper.InitSdk(applicationContext, true) { _, supplier ->
          val action = Runnable {
            if (completed.compareAndSet(false, true)) {
              result.success(HashMap<String?, Any?>().apply {
                put("is_supported", supplier.isSupported)
                put("oaid", supplier.oaid)
                put("vaid", supplier.vaid)
                put("aaid", supplier.aaid)
              })
            }
          }
          if (Looper.myLooper() == Looper.getMainLooper()) {
            action.run()
          } else {
            if (mainHandler != null) {
              mainHandler?.post(action)
            }
          }
        }
        when (code) {
          ErrorCode.INIT_ERROR_BEGIN -> {}
          ErrorCode.INIT_ERROR_MANUFACTURER_NOSUPPORT -> if (completed.compareAndSet(false, true)) {
            result.error(ErrorCode.INIT_ERROR_MANUFACTURER_NOSUPPORT.toString(), "厂商不支持", null)
          }

          ErrorCode.INIT_ERROR_DEVICE_NOSUPPORT -> if (completed.compareAndSet(false, true)) {
            result.error(ErrorCode.INIT_ERROR_DEVICE_NOSUPPORT.toString(), "设备不支持", null)
          }

          ErrorCode.INIT_ERROR_LOAD_CONFIGFILE -> if (completed.compareAndSet(false, true)) {
            result.error(ErrorCode.INIT_ERROR_LOAD_CONFIGFILE.toString(), "配置文件加载失败", null)
          }

          ErrorCode.INIT_ERROR_RESULT_DELAY -> {}
          ErrorCode.INIT_HELPER_CALL_ERROR -> if (completed.compareAndSet(false, true)) {
            result.error(ErrorCode.INIT_HELPER_CALL_ERROR.toString(), "反射调用失败", null)
          }

          1008616 -> if (completed.compareAndSet(false, true)) {
            result.error(1008616.toString(), "配置文件不匹配", null)
          }

          else -> {}
        }
      } catch (e: Throwable) {
        if (completed.compareAndSet(false, true)) {
          result.error("FAILED", e.message, null)
        }
      }
    } else if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }
}
