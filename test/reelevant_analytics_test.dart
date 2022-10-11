import 'package:flutter_test/flutter_test.dart';
import 'package:reelevant_analytics/reelevant_analytics.dart';
import 'package:reelevant_analytics/reelevant_analytics_platform_interface.dart';
import 'package:reelevant_analytics/reelevant_analytics_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockReelevantAnalyticsPlatform
    with MockPlatformInterfaceMixin
    implements ReelevantAnalyticsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ReelevantAnalyticsPlatform initialPlatform =
      ReelevantAnalyticsPlatform.instance;

  test('$MethodChannelReelevantAnalytics is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelReelevantAnalytics>());
  });

  test('getPlatformVersion', () async {
    ReelevantAnalytics reelevantAnalyticsPlugin =
        ReelevantAnalytics(companyId: 'foo', datasourceId: 'bar');
    MockReelevantAnalyticsPlatform fakePlatform =
        MockReelevantAnalyticsPlatform();
    ReelevantAnalyticsPlatform.instance = fakePlatform;

    expect(await reelevantAnalyticsPlugin.getPlatformVersion(), '42');
  });
}
