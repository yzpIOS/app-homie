package com.sand.pay_plugin;

import android.app.Activity;

import androidx.annotation.NonNull;

import com.sand.qzf.paytypesdk.base.CallBack;
import com.sand.qzf.paytypesdk.base.PayTypeSdk;
import com.sand.qzf.paytypesdk.base.Resp;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;

/** PayPlugin */
public class PayPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private MethodChannel channel;
  private Activity activity;

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    channel = new MethodChannel(flutterPluginBinding.getBinaryMessenger(), "pay_plugin");
    channel.setMethodCallHandler(this);
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding binding) {
    activity = binding.getActivity();
  }
  @Override
  public void onDetachedFromActivityForConfigChanges() {
    this.onDetachedFromActivity();
  }
  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding binding) {
    this.onAttachedToActivity(binding);
  }
  @Override
  public void onDetachedFromActivity() {
    activity = null;
  }

  @Override
  public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
    if (call.method.equals("getPlatformVersion")) {
      result.success("Android " + android.os.Build.VERSION.RELEASE);
    } else if (call.method.equals("startSandPay")) {
      String cashierUrl = call.argument("cashierUrl");
      PayTypeSdk.getInstance().cashierPay(activity,cashierUrl,new CallBack() {
        @Override
        public void onResult(Resp resp) {
          switch (resp.status){
            case Resp.FINISH:
              System.out.println("call Android action startSandPay finish -> " + "funcCode: "+resp.funcCode + "errCode: " +resp.errCode + "errMsg: " +resp.errMsg + "exceptionMsg: " +resp.exceptionMsg);
              System.out.println("需调用服务端接口查询支付结果");
              result.success("call Android action startSandPay finish -> " + "funcCode: "+resp.funcCode + "errCode: " +resp.errCode + "errMsg: " +resp.errMsg + "exceptionMsg: " +resp.exceptionMsg);
              break;
            case Resp.SUCCESS:
              //多个里的银联和杉德宝，支付成功走这里
              //单个的银联走handleUnionPayResult，不走这里
              //微信走WXEntryActivity onResp，不走这里
              //支付宝、H5快捷、一键快捷、快捷充值，支付成功跳frontUrl网页，不走这里
              System.out.println("call Android action startSandPay success -> " + "funcCode: "+resp.funcCode + "errCode: " +resp.errCode + "errMsg: " +resp.errMsg + "exceptionMsg: " +resp.exceptionMsg);
              result.success("call Android action startSandPay success -> " + "funcCode: "+resp.funcCode + "errCode: " +resp.errCode + "errMsg: " +resp.errMsg + "exceptionMsg: " +resp.exceptionMsg);
              break;
            case Resp.ERROR:
              System.out.println("call Android action startSandPay error -> " + "funcCode: "+resp.funcCode + "errCode: " +resp.errCode + "errMsg: " +resp.errMsg + "exceptionMsg: " +resp.exceptionMsg);
              result.success("call Android action startSandPay error -> " + "funcCode: "+resp.funcCode + "errCode: " +resp.errCode + "errMsg: " +resp.errMsg + "exceptionMsg: " +resp.exceptionMsg);
              break;
          }
        }
      });
    } else {
      result.notImplemented();
    }
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
    channel.setMethodCallHandler(null);
  }
}
