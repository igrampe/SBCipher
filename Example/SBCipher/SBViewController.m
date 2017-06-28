//
//  SBViewController.m
//  SBCipher
//
//  Created by igrampe on 06/29/2017.
//  Copyright (c) 2017 igrampe. All rights reserved.
//

#import "SBViewController.h"
#import <SBCipher/SBCipher.h>
#import <SBProgressHUD/SVProgressHUD.h>

@interface SBViewController ()

@end

@implementation SBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [SBCipher hexSha512:@"0420" isHex:NO];
    [SVProgressHUD show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
