import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'reelevant_analytics_platform_interface.dart';

class Event {
  String name;
  Map<String, dynamic> labels;

  Event({required this.name, required this.labels});
}

class BuiltEvent {
  String key;
  String name;
  String url;
  String tmpId;
  String? clientId;
  Map<String, dynamic> data;
  String eventId;
  num v;
  num timestamp;

  BuiltEvent(
      {required this.key,
      required this.name,
      required this.url,
      required this.tmpId,
      this.clientId,
      required this.data,
      required this.eventId,
      required this.v,
      required this.timestamp});

  Map<String, dynamic> toJSON() {
    return {
      'key': key,
      'name': name,
      'url': url,
      'tmpId': tmpId,
      'clientId': clientId,
      'data': data,
      'eventId': eventId,
      'v': v,
      'timestamp': timestamp
    };
  }
}

class ReelevantAnalytics {
  String companyId, datasourceId, endpoint;
  num retry;
  String? currentUrl, userAgent;

  ReelevantAnalytics(
      {required this.companyId,
      required this.datasourceId,
      this.endpoint = '',
      this.retry = 15}) {
    if (endpoint == '') {
      endpoint = 'https://collector.reelevant.com/collect/$datasourceId/rlvt';
    }

    // Set tmpId
    () async {
      var prefs = await SharedPreferences.getInstance();
      if (prefs.getString('tmpId') == null) {
        var deviceId = await ReelevantAnalyticsPlatform.instance.getDeviceId();
        prefs.setString('tmpId', deviceId ?? randomIdentifier());
      }
    }();
    // Set user agent
    () async {
      userAgent = await ReelevantAnalyticsPlatform.instance.getUserAgent();
    }();
  }

  Event pageView({required Map<String, dynamic> labels}) {
    return Event(name: 'page_view', labels: labels);
  }

  Event addCart(
      {required List<String> ids, required Map<String, dynamic> labels}) {
    var mergedLabels = {'ids': ids, ...labels};
    return Event(name: 'add_cart', labels: mergedLabels);
  }

  Event purchase(
      {required List<String> ids,
      required num totalAmount,
      required Map<String, dynamic> labels,
      required String transId}) {
    var mergedLabels = {
      'ids': ids,
      'value': totalAmount,
      'transId': transId,
      ...labels
    };
    return Event(name: 'purchase', labels: mergedLabels);
  }

  Event productPage(
      {required String id, required Map<String, dynamic> labels}) {
    var mergedLabels = {
      'ids': [id],
      ...labels
    };
    return Event(name: 'product_page', labels: mergedLabels);
  }

  Event categoryView(
      {required String id, required Map<String, dynamic> labels}) {
    var mergedLabels = {
      'ids': [id],
      ...labels
    };
    return Event(name: 'category_view', labels: mergedLabels);
  }

  Event brandView({required String id, required Map<String, dynamic> labels}) {
    var mergedLabels = {
      'ids': [id],
      ...labels
    };
    return Event(name: 'brand_view', labels: mergedLabels);
  }

  Event productHover(
      {required String id, required Map<String, dynamic> labels}) {
    var mergedLabels = {
      'ids': [id],
      ...labels
    };
    return Event(name: 'product_hover', labels: mergedLabels);
  }

  Event custom({required String name, required Map<String, dynamic> labels}) {
    return Event(name: name, labels: labels);
  }

  send(Event event) async {
    var builtEvent = await buildEventPayload(event.name, event.labels);
    return sendRequest(builtEvent);
  }

  setUser(String userId) async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString('userId') == null) {
      prefs.setString('userId', userId);
      var builtEvent = await buildEventPayload('identify', {});
      sendRequest(builtEvent);
    }
  }

  setCurrentURL(String url) {
    currentUrl = url;
  }

  String randomIdentifier() {
    var letters =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return List<String>.filled(25, '')
        .map((_) => letters[Random().nextInt(62)])
        .join();
  }

  sendRequest(BuiltEvent body) async {
    var headers = {
      'Content-Type': 'application/json',
      'User-Agent': userAgent ?? 'unknown'
    };

    try {
      var response = await http.post(Uri.parse(endpoint),
          headers: headers, body: jsonEncode(body.toJSON()));
      if (response.statusCode >= 500) {
        developer.log(response.toString());
      }
    } catch (e) {
      developer.log(e.toString());
    }
  }

  Future<BuiltEvent> buildEventPayload(
      String name, Map<String, dynamic> payload) async {
    final prefs = await SharedPreferences.getInstance();

    var event = BuiltEvent(
        key: companyId,
        name: name,
        url: currentUrl ?? 'unknown',
        tmpId: prefs.getString('tmpId')!,
        clientId: prefs.getString('userId'),
        data: payload,
        eventId: randomIdentifier(),
        v: 1,
        timestamp: DateTime.now().millisecondsSinceEpoch);
    return event;
  }
}
