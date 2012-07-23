//
//  CustomControllsVCtr.m
//  CustomMediaPlayer
//
//  Created by sagar kothari on 26/08/11.
//  Copyright 2011 navgujarat. All rights reserved.
//

#import "CustomControllsVCtr.h"
#import "CustomMediaPlayerAppDelegate.h"

@implementation CustomControllsVCtr

@synthesize volumeView;
@synthesize btnPlayPause;
@synthesize toolBar;
@synthesize imgV;

bool paused=true;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)btnDoneTapped:(id)sender
{
    CustomMediaPlayerAppDelegate *delegate = (CustomMediaPlayerAppDelegate*)[[UIApplication sharedApplication] delegate];
    [delegate stopTapped:nil];
}

-(IBAction)btnFullScreenTapped:(id)sender
{
    
}

-(IBAction)btnPausePlayTapped:(id)sender
{	
	if (paused){
		CustomMediaPlayerAppDelegate *delegate = (CustomMediaPlayerAppDelegate*)[[UIApplication sharedApplication] delegate];
		[delegate pausePlay:nil];
		[sender setTitle:@"Play" forState:UIControlStateNormal];
		paused = false;
	}
	else {
		CustomMediaPlayerAppDelegate *delegate = (CustomMediaPlayerAppDelegate*)[[UIApplication sharedApplication] delegate];
		[delegate pausePlay:nil];
		[sender setTitle:@"Pause" forState:UIControlStateNormal];
		paused = true;
	}
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MPVolumeView *volume=[[MPVolumeView alloc] initWithFrame:self.volumeView.frame];
    [self.volumeView addSubview:volume];
    [volume sizeToFit];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
