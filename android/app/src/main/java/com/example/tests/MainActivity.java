package com.example.tests;

import android.app.Activity;
import android.content.Context;
import android.os.Bundle;
import android.os.Environment;

import java.io.File;

import androidx.annotation.NonNull;
import io.flutter.app.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  public static MainActivity mainActivity;
  private static final String CHANNEL = "com.test.plugin";
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    mainActivity = this;

    // 直接 new MethodChannel，然后设置一个Callback来处理Flutter端调用
    new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
        new MethodChannel.MethodCallHandler() {
          @Override
          public void onMethodCall(MethodCall call, MethodChannel.Result result) {
            // 在这个回调里处理从Flutter来的调用
            if (call.method.equals("path")) {
              File file = Environment.getExternalStorageDirectory();
              String path = file.toString();
              result.success(path);
            } else {
              result.notImplemented();
            }
          }
        });
  }
}
