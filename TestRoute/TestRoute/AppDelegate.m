//
//  AppDelegate.m
//  TestRoute
//
//  Created by zy on 6/10/14.
//  Copyright (c) 2014 ShangEE. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)showAlertMsg:(NSString *)msg {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)handleRoute {
    [JLRoutes addRoute:[[AppURLDefine sharedInstance] getAvatarRoutePattern:kAvatarModelDetail] handler:^BOOL(NSDictionary *parameters) {
        NSString *avatarID = parameters[[[AppURLDefine sharedInstance] getAvatarParamKey:kAvatarModelDetail]];
        [self showAlertMsg:[NSString stringWithFormat:@"get detail: %@", avatarID]];
        return YES;
    }];

    [JLRoutes addRoute:[[AppURLDefine sharedInstance] getAvatarRoutePattern:kAvatarModelList] handler:^BOOL(NSDictionary *parameters) {
        NSString *listID = parameters[[[AppURLDefine sharedInstance] getAvatarParamKey:kAvatarModelList]];
        [self showAlertMsg:[NSString stringWithFormat:@"get list: %@", listID]];
        return YES;
    }];
}

- (void)registerViewControllerMaps {
    [[HHRouter shared] map:[[AppURLDefine sharedInstance] getAvatarRoutePattern:kAvatarModelDetail] toControllerClass:[AvatarDetailViewController class]];
    [[HHRouter shared] map:[[AppURLDefine sharedInstance] getAvatarRoutePattern:kAvatarModelList] toControllerClass:[AvatarListViewController class]];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self handleRoute];
    [self registerViewControllerMaps];
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [JLRoutes routeURL:url];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
