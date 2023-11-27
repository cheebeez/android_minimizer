/*
 *  SwiftRadioPlayerPlugin.swift
 *
 *  Created by Ilia Chirkunov <xc@yar.net> on 27.11.2023.
 */

import Flutter
import UIKit

public class AndroidMinimizerPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "android_minimizer", binaryMessenger: registrar.messenger())
    let instance = AndroidMinimizerPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "minimize":
      result(1)
      break
    default:
      result(FlutterMethodNotImplemented)
    }  
  }
}
