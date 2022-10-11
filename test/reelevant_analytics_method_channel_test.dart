import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reelevant_analytics/reelevant_analytics_method_channel.dart';

void main() {
  MethodChannelReelevantAnalytics platform = MethodChannelReelevantAnalytics();
  const MethodChannel channel = MethodChannel('reelevant_analytics');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
