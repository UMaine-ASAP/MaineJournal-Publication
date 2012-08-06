//
//  ViewController.m
//  GesturalNavigation
//
//  Created by admin on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <foundation/Foundation.h>

@implementation ViewController

@synthesize contents = _contents;
@synthesize contentsTab = _contentsTab;

// This BOOL monitors the status of the Contents View
BOOL isClosed = YES;

// These values control the positioning of the Contents View
int xOffset, yPos = -600;
// These values define the height and width of the Contents View
int contentsHeight = 600, contentsWidth = 568;

// This defines the array of articles displayed in the Contents View
UIImageView *articleImages[12];

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

-(void) dealloc {
	self.contents = nil;
	self.contentsTab = nil;
	[super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Initialize the Contents View and add it to the Main View
	_contents = [[UIView alloc] initWithFrame:CGRectMake(xOffset, yPos, contentsWidth, contentsHeight)];
	_contents.backgroundColor =[UIColor greenColor];
	[self.view addSubview:_contents];
	
	int xInc = _contents.frame.size.width/3.25;
	int yInc = 40;
	
	// This for loop populates the Contents View with the article images/links.
	// The algorithm that does this needs to be reworked, it's pretty hacky right now.
	for (int j = 0; j < 4; j++)
	{
		// Places the images in rows of three
		for (int i = 0; i < 3; i++)
			{
				// Create the article images that will bring the user to the specified article
				articleImages[i] = [[UIImageView alloc] initWithFrame:CGRectMake((xInc * i)+40, yInc, 150, 100)];
				articleImages[i].backgroundColor = [UIColor yellowColor];
				[_contents addSubview:articleImages[i]];
			}
		
		yInc = yInc + 140;
		xInc = _contents.frame.size.width/3.25;
	}
	
	// Create the Contents Tab which will control opening and closing the Contents View
	_contentsTab = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, yPos+600, 100, 50)];
	_contentsTab.backgroundColor = [UIColor blueColor];
	_contentsTab.textColor = [UIColor whiteColor];
	_contentsTab.font = [UIFont fontWithName:@"Myriad Pro" size:14.0];
	_contentsTab.textAlignment = UITextAlignmentCenter;
	_contentsTab.text = @"Contents";
	[self.view addSubview:_contentsTab];
	
	// Enable interations
	_contentsTab.userInteractionEnabled = YES;
	
	// Create a Tap Recognizer (should probably be made into a Swipe) and add it to the Contents Tab
	UITapGestureRecognizer *TapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapDetected:)];
    TapRecognizer.numberOfTouchesRequired = 1;
    [_contentsTab addGestureRecognizer:TapRecognizer];
}

// This function is called when a user taps the Contents Tab
- (void)TapDetected:(UITapGestureRecognizer *)TapRecognizer
{	
	// Check to see if the Contents View is closed or not and set Y Position accordingly
	if (isClosed) {
		yPos = 0;
		isClosed = NO;
	}
	else {
		yPos = -600;
		isClosed = YES;
	}
	
	// Set the start frame of the animation
	CGRect startFrame = CGRectMake(xOffset, yPos, contentsWidth, contentsHeight);
	CGRect tabFrame = CGRectMake(xOffset, yPos+600, 100, 50);
	
	// Create animation block
    void (^completion)(void) = ^{
        [UIView animateWithDuration:1.0
                              delay:0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             _contents.frame = startFrame;
                         }
                         completion:nil];
		
		[UILabel animateWithDuration:1.0
							   delay:0
							 options:UIViewAnimationCurveLinear
						  animations:^{
							  _contentsTab.frame=tabFrame;
						  }
						  completion:nil];
	};
	
	// Call existing animation with the new block
	[UIView animateWithDuration:1.0
						  delay:0
						options:UIViewAnimationCurveLinear
					 animations:^{
						 _contents.frame = CGRectMake(xOffset, 0, contentsWidth, contentsHeight);
					 }
					 completion:^(BOOL finished) {
						 completion();
					 }];
	
	[UILabel animateWithDuration:1.0
						  delay:0
						options:UIViewAnimationCurveLinear
					 animations:^{
						 _contentsTab.frame = CGRectMake(xOffset, 600, 100, 50);
					 }
					 completion:^(BOOL finished) {
						 completion();
					 }];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

// This function adjusts the position of the Contents View based on device orientation
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if (interfaceOrientation == UIDeviceOrientationPortrait || interfaceOrientation == UIDeviceOrientationPortraitUpsideDown) {
		xOffset = 100;
	// The Contents View needs to be adjusted when the device rotates to prevent weirdness
		_contents.frame = CGRectMake(xOffset, yPos, contentsWidth, contentsHeight);
		_contentsTab.frame = CGRectMake(xOffset, yPos+600, 100, 50);
		//NSLog(@"Portrait");
	}
	else {
		xOffset = 228;
		_contents.frame = CGRectMake(xOffset, yPos, contentsWidth, contentsHeight);
		_contentsTab.frame = CGRectMake(xOffset, yPos+600, 100, 50);
		//NSLog(@"Landscape");
	}
	
    // Return YES for supported orientations
	return YES;
}

@end