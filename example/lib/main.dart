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
      companyId: '', // Ask your customer success team
      datasourceId: ''); // Ask your customer success team

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Reelevant analytics example app'),
        ),
        body: Center(
            child: Column(
          children: [
            const Text(
                'Try to send a page_view event by clicking on the button'),
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
