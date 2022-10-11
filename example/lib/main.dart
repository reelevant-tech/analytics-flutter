import 'package:flutter/material.dart';

import 'package:reelevant_analytics/reelevant_analytics.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _reelevantAnalyticsPlugin = ReelevantAnalytics(
      companyId: '57a32a503ac78e0f003e6713',
      datasourceId: '63442674385b000300a4d532');

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          children: [
            const Text('Holà !'),
            ElevatedButton(
              onPressed: () {
                var event = _reelevantAnalyticsPlugin.pageView(labels: {});
                _reelevantAnalyticsPlugin.send(event);
              },
              child: const Text('Send event 📤'),
            )
          ],
        )),
      ),
    );
  }
}
