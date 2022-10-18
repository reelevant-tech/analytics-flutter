import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'reelevant_analytics_platform_interface.dart';

/// An implementation of [ReelevantAnalyticsPlatform] that uses method channels.
class MethodChannelReelevantAnalytics extends ReelevantAnalyticsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('reelevant_analytics');

  /// Invoke native code to return the device user agent.
  /// Throw an error if getUserAgent is not implemented for a platform.
  @override
  Future<String?> getUserAgent() async {
    final userAgent = await methodChannel.invokeMethod<String>('getUserAgent');
    return userAgent;
  }

  /// Invoke native code to return a device id for iOS and an unique identifer for Android.
  /// Throw an error if getDeviceId is not implemented for a platform.
  @override
  Future<String?> getDeviceId() async {
    final deviceId = await methodChannel.invokeMethod<String>('getDeviceId');
    return deviceId;
  }
}
