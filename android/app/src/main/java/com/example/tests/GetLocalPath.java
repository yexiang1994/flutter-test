package com.example.tests;

import android.app.Activity;
import android.content.Context;
import android.os.Environment;

import java.io.File;

import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;
import io.flutter.view.FlutterView;

public class GetLocalPath implements MethodChannel.MethodCallHandler {
    public static String CHANNEL = "com.test.plugin";
    static MethodChannel channel;
    private Activity activity;
    private GetLocalPath(Activity activity, MethodChannel channel){
        this.activity =activity;
        this.channel = channel;
    }
    public static GetLocalPath registerWith(FlutterView flutterView){
            MethodChannel channel = new MethodChannel(flutterView, "GetLocalPath");
            GetLocalPath getLocalPath = new GetLocalPath((Activity)flutterView.getContext(), channel);
            channel.setMethodCallHandler(getLocalPath);
            return getLocalPath;
//        channels = new MethodChannel(registrar.messenger(), CHANNEL);
//        GetLocalPath instance = new GetLocalPath(registrar.activity());
//        channels.setMethodCallHandler(instance);
    }
    // 调用flutter端方法，无返回值
    public void invokeMethod(String method, Object o){
        channel.invokeMethod(method, o);
    }
    // 调用flutter端方法，有返回值
    public void invokeMethod(String method, Object o, MethodChannel.Result result){
        channel.invokeMethod(method, o, result);
    }
    @Override
    public void onMethodCall(MethodCall call, MethodChannel.Result result){
        if(call.method.equals("path")){
            File file = Environment.getExternalStorageDirectory();
            String path = file.toString();
//            this.activity.getExternalStorageDirectory();
//            MainActivity.mainActivity.getExternal
            result.success(path);
        } else {
            result.notImplemented();
        }
    }
}
