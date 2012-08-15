//
//  ViewController.m
//  ArticleLayout
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import "ViewController.h"
// Need to import the classes that defined and filled the array with data
#import "File.h"
#import "FileList.h"

@implementation ViewController

@synthesize files;

- (void)viewDidLoad
{
    // When the view loads it is populated with the first database table item
	// Initialize the list of employees
	FileList *fileList = [[FileList alloc]init];
	
	//Grabs the data in the table
	self.files = [fileList getFiles];
	
	for (int i =0; i < [self.files count]; i++)
	{
		File *aFile = (File *) [self.files objectAtIndex:i];
		// This is where the system could determine which viewer to use
		// ex.  if (aFile.type == "png" OR "image")
		// Initialize a UIImageView
		
		// As an example, this creates a UIView based on the parameters from the database
		UIView *square = [[UIView alloc] initWithFrame:CGRectMake(aFile.xPos, aFile.yPos, aFile.width, aFile.height)];
		square.backgroundColor = [self getRandomColor];
		[self.view addSubview:square];
	}
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
