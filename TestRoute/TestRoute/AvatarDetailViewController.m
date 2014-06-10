//
//  AvatarDetailViewController.m
//  TestRoute
//
//  Created by zy on 6/10/14.
//  Copyright (c) 2014 ShangEE. All rights reserved.
//

#import "AvatarDetailViewController.h"

@interface AvatarDetailViewController ()

@end

@implementation AvatarDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithRouterParams:(NSDictionary *)params {
    if ((self = [self initWithNibName:nil bundle:nil])) {
        self.title = [params objectForKey:[[AppURLDefine sharedInstance] getAvatarParamKey:kAvatarModelDetail]];
    }
    return self;
}

- (void)setupUI {
    [self.view setBackgroundColor:[UIColor whiteColor]];

    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:lable];
    [lable setTextAlignment:NSTextAlignmentCenter];
    [lable setTextColor:[UIColor redColor]];
    [lable setText:self.params[[[AppURLDefine sharedInstance] getAvatarParamKey:kAvatarModelDetail]]];
    [lable setUserInteractionEnabled:YES];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAction)];
    [lable addGestureRecognizer:tap];
}

- (void)closeAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
