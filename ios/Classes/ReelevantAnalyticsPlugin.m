#import "ReelevantAnalyticsPlugin.h"
#if __has_include(<reelevant_analytics/reelevant_analytics-Swift.h>)
#import <reelevant_analytics/reelevant_analytics-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "reelevant_analytics-Swift.h"
#endif

@implementation ReelevantAnalyticsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftReelevantAnalyticsPlugin registerWithRegistrar:registrar];
}
@end
