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

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<String?> getUserAgent() {
    throw UnimplementedError('getUserAgent() has not been implemented.');
  }
}
