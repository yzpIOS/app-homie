package com.xraph.plugin.flutter_unity_widget;

import android.os.Build;

import androidx.annotation.Keep;
import androidx.annotation.RequiresApi;

import cn.g.f_unity.FUnityPlugin;

@RequiresApi(api = Build.VERSION_CODES.KITKAT)
public class UnityPlayerUtils {
    @Keep
    static public void onUnitySceneLoaded(String name, int buildIndex, boolean isLoaded, boolean isValid) {
        FUnityPlugin.onUnitySceneLoaded(name, buildIndex, isLoaded, isValid);
    }

    @Keep
    static public void onUnityMessage(String message) {
        FUnityPlugin.onUnityMessage(message);
    }
}
