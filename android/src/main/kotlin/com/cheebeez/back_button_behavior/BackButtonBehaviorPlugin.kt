/*
 *  BackButtonBehaviorPlugin.kt
 *
 *  Created by Ilya Chirkunov <xc@yar.net> on 05.12.2022.
 */

package com.cheebeez.back_button_behavior

import androidx.annotation.NonNull
import android.app.Activity;
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;

/** BackButtonBehaviorPlugin */
class BackButtonBehaviorPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel
    private lateinit var activity: Activity;

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "back_button_behavior")
        channel.setMethodCallHandler(this)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "minimize" -> {
                activity.moveTaskToBack(true)
            }
            else -> {
                result.notImplemented()
            }
        }

        result.success(1)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
         this.activity = binding.activity
    }

    override fun onDetachedFromActivity() {}

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {}
}
