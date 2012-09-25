//
//  ViewController.m
//  ModalWindow
//
//  Created by admin on 9/21/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.m"
#import "ModalViewController.h"

@implementation ViewController

@synthesize showCurlButton, showDefaultButton, showDissolveButton, showFlipButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIButton *defaultButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[defaultButton addTarget:self action:@selector(showDefault:) forControlEvents:UIControlEventTouchDown];
	[defaultButton setTitle:@"Default" forState:UIControlStateNormal];
	defaultButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
	[self.view addSubview:defaultButton];
	
	UIButton *flipButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[flipButton addTarget:self action:@selector(showFlip:) forControlEvents:UIControlEventTouchDown];
	[flipButton setTitle:@"Flip" forState:UIControlStateNormal];
	flipButton.frame = CGRectMake(80.0, 260.0, 160.0, 40.0);
	[self.view addSubview:flipButton];
	
	UIButton *dissolveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[dissolveButton addTarget:self action:@selector(showDissolve:) forControlEvents:UIControlEventTouchDown];
	[dissolveButton setTitle:@"Dissolve" forState:UIControlStateNormal];
	dissolveButton.frame = CGRectMake(80.0, 310.0, 160.0, 40.0);
	[self.view addSubview:dissolveButton];
	
	UIButton *curlButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[curlButton addTarget:self action:@selector(showCurl:) forControlEvents:UIControlEventTouchDown];
	[curlButton setTitle:@"Curl" forState:UIControlStateNormal];
	curlButton.frame = CGRectMake(80.0, 360.0, 160.0, 40.0);
	[self.view addSubview:curlButton];
}

- (void)dealloc {
    [showDefaultButton release];
    [showFlipButton release];
    [showDissolveButton release];
    [showCurlButton release];
    [super dealloc];
}

- (IBAction)showDefault:(id)sender {
	NSLog(@"Default");
	ModalViewController *modalView = [[[ModalViewController alloc] init] autorelease];
    [self presentModalViewController:modalView animated:YES];
}

- (IBAction)showFlip:(id)sender {
    ModalViewController *modalView = [[[ModalViewController alloc] init] autorelease];
    [modalView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:modalView animated:YES];
}

- (IBAction)showDissolve:(id)sender {
	NSLog(@"Dissolve");
	ModalViewController *modalView = [[[ModalViewController alloc] init] autorelease];
    [modalView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    [self presentModalViewController:modalView animated:YES];
}

- (IBAction)showCurl:(id)sender {
	NSLog(@"Curl");
	ModalViewController *modalView = [[[ModalViewController alloc] init] autorelease];
    [modalView setModalTransitionStyle:UIModalTransitionStylePartialCurl];
    [self presentModalViewController:modalView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
