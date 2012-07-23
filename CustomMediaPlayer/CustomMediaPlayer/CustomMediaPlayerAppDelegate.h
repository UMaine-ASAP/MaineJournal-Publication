//
//  CustomMediaPlayerAppDelegate.h
//  CustomMediaPlayer
//
//  Created by sagar kothari on 26/08/11.
//  Copyright 2011 navgujarat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CustomMediaPlayerAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *nvCtr;

@property (strong, nonatomic) UIViewController *vCtr;

@property (strong, nonatomic) MPMoviePlayerViewController *mPlayer;

-(void)initAndPlayMovie:(NSURL *)movieURL andViewController:(UIViewController*)vCtr;

- (void)stopTapped:(id)sender;

-(void)pausePlay:(id)sender;

@end
