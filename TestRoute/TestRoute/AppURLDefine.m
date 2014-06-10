//
//  AppURLDefine.m
//  TestRoute
//
//  Created by zy on 6/10/14.
//  Copyright (c) 2014 ShangEE. All rights reserved.
//

#import "AppURLDefine.h"

@implementation AppURLDefine

static id _AppURLDefine = nil;

+ (instancetype)sharedInstance {
    if (!_AppURLDefine) {
        _AppURLDefine = [[self alloc] init];
    }
    return _AppURLDefine;
}

#pragma mark -

- (NSString *)getAppScheme:(APP_MODEL)model {
    NSString *modelAppScheme = nil;
    switch (model) {
        case kAppModelAvatar: modelAppScheme = @"paavatar:/"; break;
        case kAppModelFriend: modelAppScheme = @"pafriend:/"; break;
        default:
            break;
    }
    return modelAppScheme;
}

#pragma mark -

- (NSString *)getAvatarParamKey:(AVATAR_MODEL)avatarMode {
    NSString *avatarParam = nil;
    switch (avatarMode) {
        case kAvatarModelDetail: avatarParam = @"avatarID"; break;
        case kAvatarModelList:   avatarParam = @"avatarList"; break;
        default:break;
    }
    return avatarParam;
}

- (NSString *)getAvatarPatternKey:(AVATAR_MODEL)avatarMode {
    NSString *avatarParam = nil;
    switch (avatarMode) {
        case kAvatarModelDetail: avatarParam = @"/view/avatar/detail/"; break;
        case kAvatarModelList:   avatarParam = @"/view/avatar/list/"; break;
        default:break;
    }
    return avatarParam;
}


- (NSString *)getAvatarRoutePattern:(AVATAR_MODEL)avatarMode {
    NSString *routePattern = [NSString stringWithFormat:@"%@:%@", [self getAvatarPatternKey:avatarMode], [self getAvatarParamKey:avatarMode]];
    return routePattern;
}

- (NSString *)getAbsoluteAvatarRoute:(AVATAR_MODEL)avatarMode {
    NSString *modelScheme = [self getAppScheme:kAppModelAvatar];
    NSString *routePattern = [self getAvatarPatternKey:avatarMode];
    return [modelScheme stringByAppendingString:routePattern];
}

@end
