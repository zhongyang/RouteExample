//
//  ViewController.m
//  TestRoute
//
//  Created by zy on 6/10/14.
//  Copyright (c) 2014 ShangEE. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)showAlertMsg:(NSString *)msg {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self setupUI];

    [JLRoutes addRoute:[[AppURLDefine sharedInstance] getAvatarRoutePattern:kAvatarModelDetail] handler:^BOOL(NSDictionary *parameters) {
        NSString *avatarID = parameters[[[AppURLDefine sharedInstance] getAvatarParamKey:kAvatarModelDetail]];
        [self showAlertMsg:[NSString stringWithFormat:@"HAHA get detail: %@", avatarID]];
        return YES;
    }];
}

- (void)setupUI {

    CGFloat topPosition = 60.0f;
    CGFloat hDistance = 30.0f;

    CGFloat btnWidth = self.view.frame.size.width - 2*hDistance;
    CGFloat btnHeight= 40.0f;

    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(hDistance, topPosition, btnWidth, btnHeight)];
    [self.view addSubview:btn];
    [btn setTitle:@"Call Model Detail (external)" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(callAvatarModelDetailAction) forControlEvents:UIControlEventTouchUpInside];

    topPosition += hDistance + btnHeight;
    btn = [[UIButton alloc] initWithFrame:CGRectMake(hDistance, topPosition, btnWidth, btnHeight)];
    [self.view addSubview:btn];
    [btn setTitle:@"Call Model List (external) " forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(callAvatarModelListAction) forControlEvents:UIControlEventTouchUpInside];

    topPosition += hDistance + btnHeight;
    btn = [[UIButton alloc] initWithFrame:CGRectMake(hDistance, topPosition, btnWidth, btnHeight)];
    [self.view addSubview:btn];
    [btn setTitle:@"Call Model Detail (internal) " forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(callAvatarModelDetailInternalAction) forControlEvents:UIControlEventTouchUpInside];

    topPosition += hDistance + btnHeight;
    btn = [[UIButton alloc] initWithFrame:CGRectMake(hDistance, topPosition, btnWidth, btnHeight)];
    [self.view addSubview:btn];
    [btn setTitle:@"Call Model List (internal) " forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [btn addTarget:self action:@selector(callAvatarModelListInternalAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)callAvatarModelDetailAction {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", [[AppURLDefine sharedInstance] getAbsoluteAvatarRoute:kAvatarModelDetail], @"tuntun"];
    NSURL *viewAvatarURL = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:viewAvatarURL];
}

- (void)callAvatarModelListAction {
    NSString *urlString = [NSString stringWithFormat:@"%@%@", [[AppURLDefine sharedInstance] getAbsoluteAvatarRoute:kAvatarModelList], @"new"];
    NSURL *viewUserURL = [NSURL URLWithString:urlString];
    [[UIApplication sharedApplication] openURL:viewUserURL];
}

- (void)callAvatarModelDetailInternalAction {
    NSString *viewAvatarURL = [NSString stringWithFormat:@"%@%@", [[AppURLDefine sharedInstance] getAvatarPatternKey:kAvatarModelDetail], @"tuntun"];
    UIViewController *viewController = [[HHRouter shared] matchController:viewAvatarURL];
    [self presentViewController:viewController animated:YES completion:nil];

    [self callAvatarModelDetailAction];
}

- (void)callAvatarModelListInternalAction {
    NSString *viewAvatarURL = [NSString stringWithFormat:@"%@%@", [[AppURLDefine sharedInstance] getAvatarPatternKey:kAvatarModelList], @"new"];
    UIViewController *viewController = [[HHRouter shared] matchController:viewAvatarURL];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
