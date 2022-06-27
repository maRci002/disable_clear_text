package com.example.disable_clear_text;

import android.os.Build;
import android.security.NetworkSecurityPolicy;
import android.util.Log;

import io.flutter.embedding.android.FlutterActivity;

public class MainActivity extends FlutterActivity {
    public MainActivity() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            boolean isCleartextTrafficPermitted = NetworkSecurityPolicy.getInstance().isCleartextTrafficPermitted();
            Log.w(MainActivity.class.toString(), "isCleartextTrafficPermitted: " + isCleartextTrafficPermitted);
        }
    }
}
