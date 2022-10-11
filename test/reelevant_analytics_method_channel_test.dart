import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reelevant_analytics/reelevant_analytics_method_channel.dart';

void main() {
  MethodChannelReelevantAnalytics platform = MethodChannelReelevantAnalytics();
  const MethodChannel channel = MethodChannel('reelevant_analytics');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      switch (methodCall.method) {
        case 'getUserAgent':
          return 'foo agent';
        case 'getDeviceId':
          return '42';
        default:
          return null;
      }
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getUserAgent', () async {
    expect(await platform.getUserAgent(), 'foo agent');
  });

  test('getDeviceId', () async {
    expect(await platform.getUserAgent(), '42');
  });
}
