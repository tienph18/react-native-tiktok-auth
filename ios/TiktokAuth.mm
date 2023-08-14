#import <React/RCTBridgeModule.h>
#import "TiktokAuth-Bridging-Header.h"

@interface RCT_EXTERN_MODULE(
TiktokAuth, NSObject
)

RCT_EXTERN_METHOD(auth: (NSString *)scope
  redirectUri:(NSString *)redirectUri
  resolver:(RCTPromiseResolveBlock)resolve
  rejecter:(RCTPromiseRejectBlock)reject
)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end

