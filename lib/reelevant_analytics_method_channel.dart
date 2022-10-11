import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'reelevant_analytics_platform_interface.dart';

/// An implementation of [ReelevantAnalyticsPlatform] that uses method channels.
class MethodChannelReelevantAnalytics extends ReelevantAnalyticsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('reelevant_analytics');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
