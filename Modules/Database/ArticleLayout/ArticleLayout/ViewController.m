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
#import "MediaPlayer/MediaPlayer.h"
#import "AVFoundation/AVFoundation.h"

@implementation ViewController

@synthesize files;
@synthesize aFile;
@synthesize imgView;
@synthesize player;
@synthesize audio;
@synthesize projectName;
@synthesize authorName;

// URL's used for audio and video location
NSURL *videoURL;
NSURL *audioURL;
NSError *error;

- (void)viewDidLoad
{
    // When the view loads it is populated with the first database table item
	// Initialize the list of employees
	FileList *fileList = [[FileList alloc]init];
	
	// Grabs the data in the table
	self.files = [fileList getFiles];
	
	// Make the Article Title
	aFile = (File *) [self.files objectAtIndex:0];
	
	projectName = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 400, 40)];
	projectName.text = aFile.project;
	projectName.textColor = [UIColor blackColor]; 
	[self.view addSubview:projectName];
	
	authorName = [[UILabel alloc] initWithFrame:CGRectMake(25, 40, 400, 40)];
	authorName.text = aFile.author;
	authorName.textColor = [UIColor blackColor];
	[self.view addSubview:authorName];
	
	for (int i =0; i < [self.files count]; i++)
	{
		aFile = (File *) [self.files objectAtIndex:i];
		
		// Check to see if file is in layout
		if (aFile.isInLayout == 1) {
			CGRect rect = CGRectMake(aFile.xPos, aFile.yPos, aFile.width, aFile.height);
		
			UIView *square = [[UIView alloc] initWithFrame:rect];
			UILabel *typeLabel = [[UILabel alloc] initWithFrame:rect];
			videoURL = [[NSBundle mainBundle] URLForResource:@"video_1" withExtension:@"mp4"];
			audioURL = [[NSBundle mainBundle] URLForResource:@"GuitarChords2" withExtension:@"mp3"];
		
			// This is where the system could determine which viewer to use
			switch (aFile.type) {
				case 0:
					// 0 = Image
					imgView = [[UIImageView alloc] initWithFrame:rect];
					imgView.image = [UIImage imageNamed:@"LoaM_Icon.png"];
					[self.view addSubview:imgView];
					break;
				case 1:
					// 1 = Video
					player = [[MPMoviePlayerController alloc] initWithContentURL: videoURL]; // This will be the URL w/ the file name
					[player prepareToPlay];
					[player.view setFrame: rect];  // Player's frame must match parent's
					[self.view addSubview: player.view];
					player.shouldAutoplay = NO;
					break;
				case 2:
					// 2 = Text
					// Pip's Document Viewer will get called here, most likely
					square.backgroundColor = [self getRandomColor];
					[self.view addSubview:square];
					typeLabel = [[UILabel alloc] initWithFrame:rect];
					typeLabel.text = (@"Text");
					typeLabel.backgroundColor = [UIColor clearColor];
					typeLabel.textAlignment = UITextAlignmentCenter;
					[self.view addSubview:typeLabel];
					break;
				case 3:
					// 3 = Audio works, it just autoplays now because it has no controls.
					// I'll make a rough Audio Player at some point
					/**
					 audio = [[AVAudioPlayer alloc] initWithContentsOfURL:audioURL error:&error];
					 audio.numberOfLoops = -1;
					 
					 if (audio == nil)
						NSLog([error description]);
					 else
						[audio play];
					 **/
				default:
					break;
			}
		}
		else {
			NSLog(@"Not part of layout");
		}
	}
	
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)dealloc {
	imgView = nil;
	audio = nil;
	aFile = nil;
	[super dealloc];
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
