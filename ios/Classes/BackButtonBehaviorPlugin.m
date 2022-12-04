#import "BackButtonBehaviorPlugin.h"
#if __has_include(<back_button_behavior/back_button_behavior-Swift.h>)
#import <back_button_behavior/back_button_behavior-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "back_button_behavior-Swift.h"
#endif

@implementation BackButtonBehaviorPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBackButtonBehaviorPlugin registerWithRegistrar:registrar];
}
@end
