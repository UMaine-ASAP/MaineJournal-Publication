//
//  ViewController.h
//  ArticleLayout
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "File.h"
#import "FileList.h"
#import "MediaPlayer/MediaPlayer.h"
#import "AVFoundation/AVFoundation.h"

@interface ViewController : UIViewController {
	// Create an array to hold data
	NSMutableArray *files;
	File *aFile;
	UIImageView *imgView;
	MPMoviePlayerController *player;
	AVAudioPlayer *audio;
	UILabel *projectName;
	UILabel *authorName;
	
	UIButton *playButton;
	UIButton *pauseButton;
}

// Define dem properties (everything besides NSMutableArray is obvious from the MainStoryboard
@property (nonatomic, retain) NSMutableArray *files;
@property (nonatomic, retain) File *aFile;
@property (nonatomic, retain) UIImageView *imgView;
@property (nonatomic, retain) MPMoviePlayerController *player;
@property (nonatomic, retain) AVAudioPlayer *audio;
@property (nonatomic, retain) UILabel *projectName;
@property (nonatomic, retain) UILabel *authorName;

@property (nonatomic, retain) UIButton *playButton;
@property (nonatomic, retain)  UIButton *pauseButton;


@end
