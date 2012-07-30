//
//  AppDelegate.h
//  CustomMoviePlayer
//
//  Created by admin on 5/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *nvCtr;

@property (strong, nonatomic) UIViewController *vCtr;

@property (strong, nonatomic) MPMoviePlayerViewController *mPlayer;

-(void)initAndPlayMovie:(NSURL *)movieURL andViewController:(UIViewController*)vCtr;

-(void)stopTapped:(id)sender;

@end
