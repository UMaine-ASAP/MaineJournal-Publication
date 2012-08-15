//
//  AppDelegate.m
//  InfinitePagingView
//
//  Created by SHIGETA Takuji
//  Copyright (c) 2012 qnote,Inc. All rights reserved.
//

#import "AppDelegate.h"

#import "HPaddingPageViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[HPaddingPageViewController alloc] init];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:self.viewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
