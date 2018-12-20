#import "FoursquareOauthPlugin.h"
#import <foursquare_oauth/foursquare_oauth-Swift.h>

@implementation FoursquareOauthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFoursquareOauthPlugin registerWithRegistrar:registrar];
}
@end
