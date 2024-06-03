package com.sand.pay_plugin_example;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {

    @Override //支付宝取消支付和支付成功都会进来，快捷支付不走这里
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);

        Uri uri = intent.getData();

        if(uri != null) {
            System.out.println("call Android action startSandPay onNewIntent -> " + "uri: " + uri.getScheme());
            if("sandh5payres".equals(uri.getScheme())) {
                //调用服务端接口查询支付结果
            }
        }
    }
}
