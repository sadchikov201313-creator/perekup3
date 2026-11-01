#!/usr/bin/env bash
# Собирает Android-приложение (WebView) вокруг index.html и строит APK.
set -e

test -f index.html || { echo "index.html не найден в корне репозитория"; exit 1; }

mkdir -p app/src/main/assets app/src/main/java/com/perekup/three \
  app/src/main/res/values app/src/main/res/drawable app/src/main/res/mipmap-anydpi-v26
cp index.html app/src/main/assets/index.html
echo "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" | base64 -d > app/release.jks

cat > settings.gradle <<'EOF'
pluginManagement {
    repositories { google(); mavenCentral(); gradlePluginPortal() }
}
dependencyResolutionManagement {
    repositories { google(); mavenCentral() }
}
rootProject.name = 'Perekup3'
include ':app'
EOF

cat > build.gradle <<'EOF'
plugins { id 'com.android.application' version '8.5.2' apply false }
EOF

echo "org.gradle.jvmargs=-Xmx2g" > gradle.properties

cat > app/build.gradle <<'EOF'
plugins { id 'com.android.application' }
android {
    namespace 'com.perekup.three'
    compileSdk 34
    defaultConfig {
        applicationId 'com.perekup.three'
        minSdk 26
        targetSdk 34
        versionCode 1
        versionName '3.0'
    }
    signingConfigs {
        main {
            storeFile file('release.jks')
            storePassword 'android'
            keyAlias 'androiddebugkey'
            keyPassword 'android'
        }
    }
    buildTypes {
        release {
            minifyEnabled false
            signingConfig signingConfigs.main
        }
    }
    lint {
        abortOnError false
        checkReleaseBuilds false
    }
}
EOF

cat > app/src/main/AndroidManifest.xml <<'EOF'
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application
        android:label="@string/app_name"
        android:icon="@mipmap/ic_launcher"
        android:theme="@style/AppTheme"
        android:allowBackup="true">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:screenOrientation="portrait"
            android:windowSoftInputMode="adjustResize"
            android:configChanges="orientation|screenSize|keyboardHidden|screenLayout|smallestScreenSize|uiMode">
            <intent-filter>
                <action android:name="android.intent.action.MAIN" />
                <category android:name="android.intent.category.LAUNCHER" />
            </intent-filter>
        </activity>
    </application>
</manifest>
EOF

cat > app/src/main/java/com/perekup/three/MainActivity.java <<'EOF'
package com.perekup.three;

import android.app.Activity;
import android.os.Bundle;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;

public class MainActivity extends Activity {
    private WebView web;

    @Override
    protected void onCreate(Bundle state) {
        super.onCreate(state);
        web = new WebView(this);
        setContentView(web);
        WebSettings s = web.getSettings();
        s.setJavaScriptEnabled(true);
        s.setDomStorageEnabled(true);
        s.setAllowFileAccess(true);
        web.setWebViewClient(new WebViewClient());
        web.loadUrl("file:///android_asset/index.html");
    }

    @Override
    protected void onPause() {
        super.onPause();
        web.onPause();
    }

    @Override
    protected void onResume() {
        super.onResume();
        web.onResume();
    }
}
EOF

cat > app/src/main/res/values/strings.xml <<'EOF'
<resources>
    <string name="app_name">Перекуп 3</string>
</resources>
EOF

cat > app/src/main/res/values/styles.xml <<'EOF'
<resources>
    <style name="AppTheme" parent="android:Theme.DeviceDefault.NoActionBar">
        <item name="android:statusBarColor">#101A30</item>
        <item name="android:windowBackground">#101A30</item>
    </style>
</resources>
EOF

cat > app/src/main/res/values/colors.xml <<'EOF'
<resources>
    <color name="ic_bg">#0A6FE0</color>
</resources>
EOF

cat > app/src/main/res/drawable/ic_fg.xml <<'EOF'
<vector xmlns:android="http://schemas.android.com/apk/res/android"
    android:width="108dp" android:height="108dp"
    android:viewportWidth="108" android:viewportHeight="108">
    <path android:fillColor="#FFFFFF"
        android:pathData="M38,30h32a4,4 0 0,1 4,4v40a4,4 0 0,1 -4,4h-32a4,4 0 0,1 -4,-4v-40a4,4 0 0,1 4,-4z"/>
    <path android:fillColor="#101A30" android:pathData="M40,36h28v32h-28z"/>
    <path android:fillColor="#FFFFFF" android:pathData="M49,73h10v2h-10z"/>
</vector>
EOF

cat > app/src/main/res/mipmap-anydpi-v26/ic_launcher.xml <<'EOF'
<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
    <background android:drawable="@color/ic_bg"/>
    <foreground android:drawable="@drawable/ic_fg"/>
</adaptive-icon>
EOF

gradle assembleRelease --no-daemon --stacktrace
cp app/build/outputs/apk/release/app-release.apk Perekup3.apk
echo "Готово: Perekup3.apk"
