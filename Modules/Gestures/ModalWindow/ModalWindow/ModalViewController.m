//
//  ModalViewController.m
//  ModalWindow
//
//  Created by admin on 9/21/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController

@synthesize dismissViewButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	 dismissViewButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[dismissViewButton addTarget:self action:@selector(dismissView:) forControlEvents:UIControlEventTouchDown];
	[dismissViewButton setTitle:@"Default" forState:UIControlStateNormal];
	dismissViewButton.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
	[self.view addSubview:dismissViewButton];
}

- (IBAction)dismissView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
