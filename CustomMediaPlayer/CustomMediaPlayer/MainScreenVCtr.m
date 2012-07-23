//
//  MainScreenVCtr.m
//  CustomMediaPlayer
//
//  Created by sagar kothari on 26/08/11.
//  Copyright 2011 navgujarat. All rights reserved.
//

#import "MainScreenVCtr.h"
#import "CustomMediaPlayerAppDelegate.h"

@implementation MainScreenVCtr

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(IBAction)btnStartTapped:(id)sender
{
    CustomMediaPlayerAppDelegate *delegate = (CustomMediaPlayerAppDelegate*)[[UIApplication sharedApplication] delegate];
    // i couldn't rename that file :)
    NSString *movieName=[[NSBundle mainBundle] pathForResource:@"Thomas_Leeuw_MJ" ofType:@"MP4"];
    NSURL *movieURL=[[NSURL alloc] initFileURLWithPath:movieName];
    [delegate initAndPlayMovie:movieURL andViewController:self];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
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
