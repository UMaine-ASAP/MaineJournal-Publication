//
//  CustomMediaPlayerAppDelegate.m
//  CustomMediaPlayer
//
//  Created by sagar kothari on 26/08/11.
//  Copyright 2011 navgujarat. All rights reserved.
//

#import "CustomMediaPlayerAppDelegate.h"
#import "MainScreenVCtr.h"
#import "CustomControllsVCtr.h"

@implementation CustomMediaPlayerAppDelegate

@synthesize window = _window;

@synthesize nvCtr = _nvCtr;
@synthesize vCtr = _vCtr;
@synthesize mPlayer = _mPlayer;

// now we are going to add Some notification for MOvieplayer
bool isItPaused = true;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MainScreenVCtr *tempVariable=[[MainScreenVCtr alloc] initWithNibName:(UI_USER_INTERFACE_IDIOM())?@"MainScreeniPad":@"MainScreenVCtr" bundle:nil];
    
    self.nvCtr=[[UINavigationController alloc] initWithRootViewController:tempVariable];
    
    self.nvCtr.view.frame=CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height-20);
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
											 selector:@selector(moviePlayBackDidFinish:) 
												 name:MPMoviePlayerPlaybackDidFinishNotification 
											   object:nil];
    
    [self.window addSubview:self.nvCtr.view];
    
    self.vCtr=[[CustomControllsVCtr alloc] initWithNibName:(UI_USER_INTERFACE_IDIOM())?@"CustomControllsiPad":@"CustomControllsVCtr" bundle:nil];
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

// a method to start movie player
-(void)initAndPlayMovie:(NSURL *)movieURL andViewController:(UIViewController*)vCtr
{	
    self.mPlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:movieURL];
    // we have movie from file - Alizee :)
    [self.mPlayer.moviePlayer setMovieSourceType:MPMovieSourceTypeFile];
    
    // we don't need standard controlls as we have built our own
    [self.mPlayer.moviePlayer setControlStyle:MPMovieControlStyleNone];
    
    // aspect fit to screen  mode
    [self.mPlayer.moviePlayer setScalingMode:MPMovieScalingModeAspectFit];
    
    // full screen mode
    [self.mPlayer.moviePlayer setFullscreen:YES animated:YES];
    
    // to start movie player
    [vCtr presentMoviePlayerViewControllerAnimated:self.mPlayer];
    
    // now we will add our own view over video player
    self.vCtr.view.frame=CGRectMake(0, 20, self.window.frame.size.width, self.window.frame.size.height-20);
    
    [self.mPlayer.view addSubview:self.vCtr.view];
}

- (void)stopTapped:(id)sender{
    [self.mPlayer.moviePlayer stop];
}

-(void)pausePlay:(id)sender;{
	if (isItPaused){
		[self.mPlayer.moviePlayer pause];
		isItPaused = false;
	}
	else {
		[self.mPlayer.moviePlayer play];
		isItPaused = true;
	}
}

-(void)moviePlayBackDidFinish:(NSNotification*)notification
{
    [self.mPlayer dismissMoviePlayerViewControllerAnimated];
    [self.vCtr.view removeFromSuperview];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Thats it from my Side.
    // please visit http://sugartin.info for more tutorials.
    // 
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
