#import "AppDelegate.h"

#import <React/RCTBundleURLProvider.h>
//  #import <TikTokOpenSDKCore/TikTokOpenSDKCore-umbrella.h>
@import TikTokOpenSDKCore;
// #import "TiktokAuthExample-Bridging-Header.h"
// #import "TiktokAuth-Bridging-Header.h"
// #import <TiktokAuthExample/TiktokAuthExample-Bridging-Header.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.moduleName = @"TiktokAuthExample";
  // You can add your custom initial props in the dictionary below.
  // They will be passed down to the ViewController used by React Native.
  self.initialProps = @{};

  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options {
    if ([TTKSDKURLHandler handleOpenURL:url]) {
        return YES;
    }
    return NO;
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> *_Nullable))restorationHandler {
    if ([TTKSDKURLHandler handleOpenURL:userActivity.webpageURL]) {
        return YES;
    }
    return NO;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index"];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
