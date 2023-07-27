#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(TiktokAuth, NSObject)

RCT_EXTERN_METHOD(auth: (RCTResponseSenderBlock)callback)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
