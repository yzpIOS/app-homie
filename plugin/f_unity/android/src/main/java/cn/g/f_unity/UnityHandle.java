package cn.g.f_unity;

import android.content.Context;
import android.graphics.PixelFormat;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;

import androidx.annotation.NonNull;

public class UnityHandle {
    private final XUnityPlayer unity;

    public UnityHandle(Context context) {
        unity = new XUnityPlayer(context);

        final SurfaceView view = (SurfaceView) unity.getChildAt(0);
        view.setZOrderOnTop(false);

        final SurfaceHolder holder = view.getHolder();

        holder.setFormat(PixelFormat.TRANSPARENT);
    }

    public void addTo(@NonNull ViewGroup viewGroup) {
        final ViewParent parent = unity.getParent();

        if (parent != viewGroup) {
            if (parent != null) {
                ((ViewGroup) parent).removeView(unity);
            }

            viewGroup.addView(unity);
            resume();
        }
    }

    public void pause() {
        unity.pause();
    }

    public void resume() {
        unity.windowFocusChanged(unity.requestFocus());
        unity.resume();
    }

    public void freeze() {
        pause();

        unity.setVisibility(View.GONE);
    }

    public void unfreeze() {
        resume();

        unity.setVisibility(View.VISIBLE);
    }

    public void destroy() {
        unity.destroy();
    }
}
