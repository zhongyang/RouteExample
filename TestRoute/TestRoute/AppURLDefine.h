//
//  AppURLDefine.h
//  TestRoute
//
//  Created by zy on 6/10/14.
//  Copyright (c) 2014 ShangEE. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM (NSInteger, APP_MODEL) {
    kAppModelAvatar = 0,
    kAppModelFriend = 1,
};

typedef NS_ENUM(NSInteger, AVATAR_MODEL) {
    kAvatarModelDetail = 0,
    kAvatarModelList   = 1,
};

typedef NS_ENUM(NSInteger, FRIEND_MODEL) {
    kFriendModelDetail = 0,
    kFriendModelList   = 1,
};


@interface AppURLDefine : NSObject

+(instancetype)sharedInstance;

- (NSString *)getAvatarParamKey:(AVATAR_MODEL)avatarMode;
- (NSString *)getAvatarPatternKey:(AVATAR_MODEL)avatarMode;
- (NSString *)getAvatarRoutePattern:(AVATAR_MODEL)avatarMode;
- (NSString *)getAbsoluteAvatarRoute:(AVATAR_MODEL)avatarMode;
@end
