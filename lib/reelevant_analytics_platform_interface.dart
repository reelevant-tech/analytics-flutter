import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'reelevant_analytics_method_channel.dart';

abstract class ReelevantAnalyticsPlatform extends PlatformInterface {
  /// Constructs a ReelevantAnalyticsPlatform.
  ReelevantAnalyticsPlatform() : super(token: _token);

  static final Object _token = Object();

  static ReelevantAnalyticsPlatform _instance =
      MethodChannelReelevantAnalytics();

  /// The default instance of [ReelevantAnalyticsPlatform] to use.
  ///
  /// Defaults to [MethodChannelReelevantAnalytics].
  static ReelevantAnalyticsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ReelevantAnalyticsPlatform] when
  /// they register themselves.
  static set instance(ReelevantAnalyticsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Invoke native code to return the device user agent.
  /// Throw an error if getUserAgent is not implemented for a platform.
  Future<String?> getUserAgent() {
    throw UnimplementedError('getUserAgent() has not been implemented.');
  }

  /// Invoke native code to return a device id for iOS and an unique identifer for Android.
  /// Throw an error if getDeviceId is not implemented for a platform.
  Future<String?> getDeviceId() {
    throw UnimplementedError('getDeviceId() has not been implemented.');
  }
}
