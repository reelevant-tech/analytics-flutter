import 'package:flutter_test/flutter_test.dart';

import 'package:reelevant_analytics/reelevant_analytics.dart';

void main() {
  test('adds one to input values', () {
    final reelevantSDK = ReelevantAnalytics(
        companyId: '57a32a503ac78e0f003e6713',
        datasourceId: '63442674385b000300a4d532');

    var event = reelevantSDK.pageView(labels: {});
    reelevantSDK.send(event);

    expect(reelevantSDK.endpoint,
        'https://collector.reelevant.com/collect/bar/rlvt');
  });
}
