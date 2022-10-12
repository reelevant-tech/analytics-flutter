# Reelevant Analytics SDK for flutter (iOS and Android)

This Flutter package could be used to send tracking events to Reelevant datasources.

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