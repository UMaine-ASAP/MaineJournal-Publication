//
//  ViewController.m
//  GesturalNavigation
//
//  Created by admin on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
//  This ViewController.m contains everything that will remain on the screen regardless of which article
//  is being displayed.  This includes (AS OF 8/7) the ViewController itself and the Contents Dropdown
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
UIButton *articleThumbs[12];
UIView *articles[12];

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
	
	UIView *scrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	scrollView.backgroundColor = [self getRandomColor];
	[self.view addSubview:scrollView];
	
	// Creates two buttons that allow the user to scroll through the articles.  These will be removed
	// once Drag Gestures are established
	UIButton *nextArticle = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/1.5, self.view.frame.size.height/2, 150, 50)];
	nextArticle.backgroundColor = [self getRandomColor];
	[nextArticle addTarget:self action:@selector(loadURL) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:nextArticle];
	
	UIButton *previousArticle = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width/4, self.view.frame.size.height/2, 150, 50)];
	previousArticle.backgroundColor = [self getRandomColor];
	[previousArticle addTarget:self action:@selector(loadURL) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:previousArticle];
	
	// Initialize the Contents View and add it to the Main View
	_contents = [[UIView alloc] initWithFrame:CGRectMake(xOffset, yPos, contentsWidth, contentsHeight)];
	_contents.backgroundColor =[self getRandomColor];
	[self.view addSubview:_contents];
	
	int xInc = _contents.frame.size.width/3.55;
	int yInc = 40;
	
	// This for loop populates the Contents View with the article images/links.
	// The algorithm that does this needs to be reworked, it's pretty hacky right now.
	for (int j = 0; j < 4; j++)
	{
		// Places the images in rows of three
		for (int i = 0; i < 3; i++)
			{
				// Create the article images that will bring the user to the specified article
				articleThumbs[i] = [[UIButton alloc] initWithFrame:CGRectMake((xInc * i)+40, yInc, 150, 100)];
				articleThumbs[i].backgroundColor = [self getRandomColor];
				// Adds the target of the specific button (i.e. the article)
				[articleThumbs[i] addTarget:self action:@selector(loadURL) forControlEvents:UIControlEventTouchUpInside];
				[_contents addSubview:articleThumbs[i]];
			}
		
		// Establish x and y increment values
		yInc = yInc + 140;
		xInc = _contents.frame.size.width/3.55;
	}
	
	// Create the Contents Tab which will control opening and closing the Contents View
	_contentsTab = [[UILabel alloc] initWithFrame:CGRectMake(xOffset, yPos+600, 100, 50)];
	_contentsTab.backgroundColor = [self getRandomColor];
	_contentsTab.textColor = [self getRandomColor];
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

//The method that designates the target of the button.  This will be deleted/modified once the views are set up.
-(void)loadURL {
	 [[UIApplication sharedApplication] openURL:[NSURL URLWithString: @"http://www.google.com"]];
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
        [UIView animateWithDuration:0.5
                              delay:0
                            options:UIViewAnimationCurveLinear
                         animations:^{
                             _contents.frame = startFrame;
                         }
                         completion:nil];
		
		[UILabel animateWithDuration:0.5
							   delay:0
							 options:UIViewAnimationCurveLinear
						  animations:^{
							  _contentsTab.frame=tabFrame;
						  }
						  completion:nil];
	};
	
	// Call existing animation with the new block
	[UIView animateWithDuration:0.5
						  delay:0
						options:UIViewAnimationCurveLinear
					 animations:^{
						 _contents.frame = CGRectMake(xOffset, 0, contentsWidth, contentsHeight);
					 }
					 completion:^(BOOL finished) {
						 completion();
					 }];
	
	[UILabel animateWithDuration:0.5
						  delay:0
						options:UIViewAnimationCurveLinear
					 animations:^{
						 _contentsTab.frame = CGRectMake(xOffset, 600, 100, 50);
					 }
					 completion:^(BOOL finished) {
						 completion();
					 }];
}

// Creates a Random Color.  Currently used to color the article buttons.
// Will be replaced when article images are pulled from database.
- (UIColor *) getRandomColor {
	CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
	CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
	CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;
	return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
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
