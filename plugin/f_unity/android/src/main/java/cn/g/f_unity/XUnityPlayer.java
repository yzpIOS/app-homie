package cn.g.f_unity;

import android.content.Context;
import android.util.Log;
import android.view.InputDevice;
import android.view.MotionEvent;

import com.unity3d.player.IUnityPlayerLifecycleEvents;
import com.unity3d.player.UnityPlayer;

public class XUnityPlayer extends UnityPlayer {
    public XUnityPlayer(Context context) {
        super(context, new IUnityPlayerLifecycleEvents() {
            @Override
            public void onUnityPlayerUnloaded() {
                Log.d(getClass().getSimpleName(), "onUnityPlayerUnloaded");
            }

            @Override
            public void onUnityPlayerQuitted() {
                Log.d(getClass().getSimpleName(), "onUnityPlayerQuitted");
            }
        });
    }

    @Override
    protected void kill() {
        //
    }

    @Override
    public boolean dispatchTouchEvent(MotionEvent ev) {
        ev.setSource(InputDevice.SOURCE_TOUCHSCREEN);

        return super.dispatchTouchEvent(ev);
    }
}
