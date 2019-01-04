#import "FoursquareOAuthPlugin.h"
#import <foursquare_oauth/foursquare_oauth-Swift.h>

@implementation FoursquareOAuthPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFoursquareOAuthPlugin registerWithRegistrar:registrar];
}
@end
