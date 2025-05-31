package cn.g.f_unity;

import android.content.Context;
import android.graphics.Color;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.util.ArrayMap;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.annotation.RequiresApi;
import androidx.lifecycle.Lifecycle;
import androidx.lifecycle.LifecycleEventObserver;
import androidx.lifecycle.LifecycleOwner;

import java.util.HashMap;
import java.util.Map;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.embedding.engine.plugins.lifecycle.FlutterLifecycleAdapter;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

@RequiresApi(api = Build.VERSION_CODES.KITKAT)
public class FUnityPlugin implements FlutterPlugin, MethodCallHandler, ActivityAware {
    static private final Handler handler = new Handler(Looper.getMainLooper());
    static private MethodChannel channel;

    private UnityHandle unity;
    private Lifecycle lifecycle;
    private LifecycleEventObserver lifecycleObserver;

    static public void onUnityMessage(String message) {
        if (channel != null) {
            invokeMethod("onUnityMessage", message);
        }
    }

    static public void onUnitySceneLoaded(String name, int buildIndex, boolean isLoaded, boolean isValid) {
        if (channel != null) {
            final Map<String, Object> arguments = new HashMap<>();

            arguments.put("name", name);
            arguments.put("buildIndex", buildIndex);
            arguments.put("isLoaded", isLoaded);
            arguments.put("isValid", isValid);

            invokeMethod("onUnitySceneLoaded", arguments);
        }
    }

    static private void invokeMethod(@NonNull String method, @Nullable Object arguments) {
        handler.post(() -> channel.invokeMethod(method, arguments));
    }

    @Override
    public void onAttachedToEngine(@NonNull FlutterPluginBinding binding) {
        System.out.print("FUnityPlugin onAttachedToEngine 1...");
        final Context context = binding.getApplicationContext();

        channel = new MethodChannel(binding.getBinaryMessenger(), "f_unity");
        System.out.print("FUnityPlugin onAttachedToEngine 2...");
        channel.setMethodCallHandler(this);

        unity = new UnityHandle(context);

        lifecycleObserver = new LifecycleEventObserver() {
            @Override
            public void onStateChanged(@NonNull LifecycleOwner source, @NonNull Lifecycle.Event event) {
                Log.d(getClass().getSimpleName(), "onStateChanged -> " + event);

                switch (event) {
                    case ON_PAUSE:
                        unity.freeze();
                        break;
                    case ON_RESUME:
                        unity.unfreeze();
                        break;
                }
            }
        };

        final PlatformViewFactory factory = new PlatformViewFactory(StandardMessageCodec.INSTANCE) {
            private final ArrayMap<Integer, ViewGroup> views = new ArrayMap<>();
            private int showId = -1;

            @NonNull
            @Override
            public PlatformView create(Context context, final int viewId, @Nullable Object args) {
                final ViewGroup view = new FrameLayout(context);

                view.setBackgroundColor(Color.TRANSPARENT);

                unity.addTo(view);

                views.put(showId = viewId, view);

                return new PlatformView() {
                    @NonNull
                    @Override
                    public View getView() {
                        return view;
                    }

                    @Override
                    public void dispose() {
                        views.remove(viewId);

                        final int size = views.size();

                        if (showId == viewId && size > 0) {
                            final int last = size - 1;

                            showId = views.keyAt(last);
                            unity.addTo(views.valueAt(last));
                        }
                    }
                };
            }
        };

        binding
                .getPlatformViewRegistry()
                .registerViewFactory("f_unity/unity_view", factory);
        System.out.print("FUnityPlugin onAttachedToEngine 3...");
    }

    @Override
    public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
        channel.setMethodCallHandler(null);
        channel = null;

        Log.d(getClass().getSimpleName(), "onDetachedFromEngine");
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        try {
            switch (call.method) {
                case "postMessage":
                    XUnityPlayer.UnitySendMessage(
                            call.argument("gameObject"),
                            call.argument("methodName"),
                            call.argument("message")
                    );

                    result.success(null);
                    break;
                case "resume":
                    unity.resume();

                    result.success(null);
                    break;
                case "pause":
                    unity.pause();

                    result.success(null);
                    break;
                default:
                    result.notImplemented();
            }
        } catch (Exception e) {
            result.error("-1", e.getMessage(), e);
        }
    }

    //<editor-fold desc="ActivityAware">
    @Override
    public void onAttachedToActivity(@NonNull ActivityPluginBinding binding) {
        System.out.print("FUnityPlugin onAttachedToActivity 1...");
        lifecycle = FlutterLifecycleAdapter.getActivityLifecycle(binding);
        lifecycle.addObserver(lifecycleObserver);
    }

    @Override
    public void onReattachedToActivityForConfigChanges(@NonNull ActivityPluginBinding binding) {
        onAttachedToActivity(binding);
    }

    @Override
    public void onDetachedFromActivityForConfigChanges() {
        onDetachedFromActivity();
    }

    @Override
    public void onDetachedFromActivity() {
        final Lifecycle tmp = lifecycle;

        lifecycle = null;
        tmp.removeObserver(lifecycleObserver);
    }
    //</editor-fold>
}
