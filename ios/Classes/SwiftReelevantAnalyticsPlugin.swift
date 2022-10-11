import Flutter
import UIKit
import WebKit

public class SwiftReelevantAnalyticsPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "reelevant_analytics", binaryMessenger: registrar.messenger())
    let instance = SwiftReelevantAnalyticsPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
      case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
      case "getUserAgent":
        result(WKWebView().value(forKey: "userAgent") as? String ?? "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36")
      default:
        result(FlutterMethodNotImplemented)
    }
  }
}
