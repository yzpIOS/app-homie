package android.src.main.java.com.sand.pay_plugin.wxapi;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;

import com.tencent.mm.opensdk.constants.ConstantsAPI;
import com.tencent.mm.opensdk.modelbase.BaseReq;
import com.tencent.mm.opensdk.modelbase.BaseResp;
import com.tencent.mm.opensdk.modelbiz.WXLaunchMiniProgram;
import com.tencent.mm.opensdk.modelmsg.ShowMessageFromWX;
import com.tencent.mm.opensdk.openapi.IWXAPI;
import com.tencent.mm.opensdk.openapi.IWXAPIEventHandler;
import com.tencent.mm.opensdk.openapi.WXAPIFactory;
import com.tencent.mm.opensdk.utils.Log;

public class WXEntryActivity extends Activity implements IWXAPIEventHandler {
	private static final String TAG = WXEntryActivity.class.getSimpleName();

	private IWXAPI api;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		api = WXAPIFactory.createWXAPI(this, "wxed5f4b391e3356ed", false);

		try {
			Intent intent = getIntent();
			api.handleIntent(intent, this);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void onNewIntent(Intent intent) {
		super.onNewIntent(intent);

		setIntent(intent);
		api.handleIntent(intent, this);
	}

	@Override
	public void onReq(BaseReq baseReq) {
		Log.d(TAG, "onReq: " + baseReq.getType());
		switch (baseReq.getType()) {
			case ConstantsAPI.COMMAND_GETMESSAGE_FROM_WX:
				break;
			case ConstantsAPI.COMMAND_SHOWMESSAGE_FROM_WX:
				goToShowMsg((ShowMessageFromWX.Req) baseReq);
				break;
			default:
				break;
		}

		finish();
	}

	private void goToShowMsg(ShowMessageFromWX.Req baseReq) {
		Log.d(TAG, "goToShowMsg:"+baseReq.message);
	}

	@Override
	public void onResp(BaseResp resp) {
		Log.d(TAG, "onResp: " + resp.getType());
		if (resp.getType() == ConstantsAPI.COMMAND_LAUNCH_WX_MINIPROGRAM) {
			WXLaunchMiniProgram.Resp launchMiniProResp = (WXLaunchMiniProgram.Resp) resp;
			String extraData = launchMiniProResp.extMsg; //对应小程序组件 <button open-type="launchApp"> 中的 app-parameter 属性
			//extraData: 0000支付成功，9999支付失败
		}
		finish();
	}

	@Override
	protected void onDestroy() {
		super.onDestroy();
		Log.d(TAG, "onDestroy");
	}
}
	
