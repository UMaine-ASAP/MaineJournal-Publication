//This file is part of MyVideoPlayer.
//
//MyVideoPlayer is free software: you can redistribute it and/or modify
//it under the terms of the GNU General Public License as published by
//the Free Software Foundation, either version 3 of the License, or
//(at your option) any later version.
//
//MyVideoPlayer is distributed in the hope that it will be useful,
//but WITHOUT ANY WARRANTY; without even the implied warranty of
//MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//GNU General Public License for more details.
//
//You should have received a copy of the GNU General Public License
//along with MyVideoPlayer.  If not, see <http://www.gnu.org/licenses/>.

#import "MainViewController.h"
#import "VideoPlayerViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "QuartzCore/QuartzCore.h"

@interface MainViewController () 

// @property (nonatomic, retain) MPMoviePlayerController *playerViewController;

@property (nonatomic, retain) VideoPlayerViewController *videoPlayerViewController;
@property (nonatomic, retain) VideoPlayerViewController *myPlayerViewController;
@property (nonatomic, retain) VideoPlayerViewController *myPlayerViewControllerTwo;
@property (nonatomic, retain) UIImageView *frontGoal;
@property (nonatomic, retain) UIImageView *topGoal;

@end


@implementation MainViewController

// @synthesize playerViewController = _playerViewController;

@synthesize videoPlayerViewController = _videoPlayerViewController;
@synthesize myPlayerViewController = _myPlayerViewController;
@synthesize myPlayerViewControllerTwo = _myPlayerViewControllerTwo;
@synthesize frontGoal = _frontGoal;
@synthesize topGoal = _topGoal;

// Sets the video rotation to 90 degrees
float targetRotation = -90.0;

- (void)dealloc {
 //   self.playerViewController = nil;
	
	self.videoPlayerViewController = nil;
    self.myPlayerViewController = nil;
	self.myPlayerViewControllerTwo = nil;
	self.frontGoal = nil;
	self.topGoal = nil;
    
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
	NSURL *url = [[NSBundle mainBundle] URLForResource:@"video_1" withExtension:@"mp4"];
	
	UIImageView *frontGoal = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goalFront.png"]];
	UIImageView *topGoal = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"goalTop.png"]];
	
/**MPMoviePlayerController Stuff
    // video player
    MPMoviePlayerController *playerViewController = [[MPMoviePlayerController alloc] init];
    playerViewController.contentURL = url;
    playerViewController.view.frame = CGRectMake(0, 0, 250, 300);
    playerViewController.view.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);

    [self.view addSubview:playerViewController.view];

    self.playerViewController = playerViewController;
    [playerViewController release]; **/
	
	// Note to Self:  Make all of these ui instances into callable classes
	
    // my video player
    VideoPlayerViewController *player = [[VideoPlayerViewController alloc] init];
    player.URL = url;
    player.view.frame = CGRectMake(0, 0, 275, 300);
	player.view.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);
	
	self.myPlayerViewController = player;
    [self.view addSubview:player.view];
	
    [player release];
	
	// my video player two
    VideoPlayerViewController *playerTwo = [[VideoPlayerViewController alloc] init];
    playerTwo.URL = url;
    playerTwo.view.frame = CGRectMake(225, 0, 275, 300);
	playerTwo.view.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);
	
	self.myPlayerViewControllerTwo = playerTwo;
    [self.view addSubview:playerTwo.view];
	
    [playerTwo release];
	
	// video player
    VideoPlayerViewController *videoPlayer = [[VideoPlayerViewController alloc] init];
    videoPlayer.URL = url;
    videoPlayer.view.frame = CGRectMake(450, 0, 275, 300);
	videoPlayer.view.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);
	
	self.videoPlayerViewController = videoPlayer;
    [self.view addSubview:videoPlayer.view];
	
    [videoPlayer release];
	
	// Goal Images
	frontGoal.frame = CGRectMake(-15, 425, 400, 300);
	frontGoal.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);
	[self.view addSubview:frontGoal];
	[frontGoal release];
	
	topGoal.frame = CGRectMake(340, 425, 400, 300);
	topGoal.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);
	[self.view addSubview:topGoal];
	[topGoal release];
	
	// Camera Labels
	UILabel *cameraOne = [[UILabel alloc] initWithFrame:CGRectMake(85, 260, 100, 100)];
	cameraOne.font = [UIFont fontWithName:@"Arial" size: 22.0];
	cameraOne.backgroundColor = [UIColor clearColor];
	cameraOne.textColor = [UIColor whiteColor];
	cameraOne.text = @"Camera 1";
	cameraOne.transform = CGAffineTransformMakeRotation(targetRotation / 90.0 * M_PI);
	[self.view addSubview:cameraOne];
	[cameraOne release];
	
	UILabel *cameraTwo = [[UILabel alloc] initWithFrame:CGRectMake(310, 260, 100, 100)];
	cameraTwo.font = [UIFont fontWithName:@"Arial" size: 22.0];
	cameraTwo.backgroundColor = [UIColor clearColor];
	cameraTwo.textColor = [UIColor whiteColor];
	cameraTwo.text = @"Camera 2";
	cameraTwo.transform = CGAffineTransformMakeRotation(targetRotation / 90.0 * M_PI);
	[self.view addSubview:cameraTwo];
	[cameraTwo release];
	
	UILabel *cameraThree = [[UILabel alloc] initWithFrame:CGRectMake(540, 260, 100, 100)];
	cameraThree.font = [UIFont fontWithName:@"Arial" size: 22.0];
	cameraThree.backgroundColor = [UIColor clearColor];
	cameraThree.textColor = [UIColor whiteColor];
	cameraThree.text = @"Camera 3";
	cameraThree.transform = CGAffineTransformMakeRotation(targetRotation / 90.0 * M_PI);
	[self.view addSubview:cameraThree];
	[cameraThree release];
	
	//Left Hand Labels
	UILabel *shotTotalLabel = [[UILabel alloc] initWithFrame:CGRectMake(540, 850, 150, 40)];
	shotTotalLabel.font = [UIFont fontWithName:@"Arial" size: 16.0];
	shotTotalLabel.backgroundColor = [UIColor blueColor];
	shotTotalLabel.layer.borderColor = [UIColor whiteColor].CGColor;
	shotTotalLabel.layer.borderWidth = 2.0;
	shotTotalLabel.textColor = [UIColor whiteColor];
	shotTotalLabel.textAlignment = UITextAlignmentCenter;
	shotTotalLabel.text = @"Shot Total: 5";
	shotTotalLabel.transform = CGAffineTransformMakeRotation(targetRotation / 180.0 * M_PI);
	[self.view addSubview:shotTotalLabel];
	[shotTotalLabel release];
}

@end
