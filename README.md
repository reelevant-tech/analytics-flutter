[![Tests](https://github.com/reelevant-tech/analytics-flutter/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/reelevant-tech/analytics-flutter/actions/workflows/tests.yml)
![iOS](https://img.shields.io/badge/Platform-iOS-blueviolet)
![Android](https://img.shields.io/badge/Platform-Android-brightgreen)
[![Pub Version](https://img.shields.io/pub/v/reelevant_analytics)](https://pub.dev/packages/reelevant_analytics)
[![Pub Likes](https://img.shields.io/pub/likes/reelevant_analytics)](https://pub.dev/packages/reelevant_analytics/score)
[![Pub Points](https://img.shields.io/pub/points/reelevant_analytics)](https://pub.dev/packages/reelevant_analytics/score)
[![Pub Popularity](https://img.shields.io/pub/popularity/reelevant_analytics)](https://pub.dev/packages/reelevant_analytics/score)
[![Pub Publisher](https://img.shields.io/pub/publisher/reelevant_analytics)](https://pub.dev/publishers/reelevant.com/packages)

# Reelevant Analytics SDK for flutter (iOS and Android)

This Flutter package could be used to send tracking events to Reelevant datasources.

## Install

Run this command:

```
flutter pub add reelevant_analytics
```
See [pub.dev](https://pub.dev/packages/reelevant_analytics/install) for more informations.

## How to use

You need to have a `datasourceId` and a `companyId` to be able to init the SDK and start sending events:

```dart
final reelevantAnalytics = ReelevantAnalytics(companyId: '<company id>', datasourceId: '<datasource id>');

// Generate an event
var event = reelevantAnalytics.pageView(labels: {});
// Send it
reelevantAnalytics.send(event);
```

### Current URL

When a user is browsing a page you should call the `sdk.setCurrentURL` method if you want to be able to filter on it in Reelevant.

### User infos

To identify a user, you should call the `sdk.setUser('<user id>')` method which will store the user id in the device and send it to Reelevant.

### Labels

Each event type allow you to pass additional infos via `labels` (`Map<String, String>`) on which you'll be able to filter in Reelevant.

```dart
var event = reelevantAnalytics.addCart(ids: ['my-product-id'], labels: {'lang': 'en_US'});
```

## Contribute

This project is a Flutter [plug-in package](https://flutter.dev/developing-packages/), a specialized package that includes platform-specific implementation code for Android and iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials, samples, guidance on mobile development, and a full API reference.
