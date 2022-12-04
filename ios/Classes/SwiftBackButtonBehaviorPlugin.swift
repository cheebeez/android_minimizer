/*
 *  SwiftRadioPlayerPlugin.swift
 *
 *  Created by Ilya Chirkunov <xc@yar.net> on 05.12.2022.
 */

import Flutter
import UIKit

public class SwiftBackButtonBehaviorPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "back_button_behavior", binaryMessenger: registrar.messenger())
        let instance = SwiftBackButtonBehaviorPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
            case "minimize":
                break
            default:
                result(FlutterMethodNotImplemented)
        }

        result(1)

    }
}
