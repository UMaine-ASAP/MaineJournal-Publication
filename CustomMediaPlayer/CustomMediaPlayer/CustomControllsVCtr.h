//
//  CustomControllsVCtr.h
//  CustomMediaPlayer
//
//  Created by sagar kothari on 26/08/11.
//  Copyright 2011 navgujarat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface CustomControllsVCtr : UIViewController

@property (nonatomic, strong) IBOutlet UIView *volumeView;
@property (nonatomic, strong) IBOutlet UIButton *btnPlayPause;
@property (nonatomic, strong) IBOutlet UIToolbar *toolBar;
@property (nonatomic, strong) IBOutlet UIImageView *imgV;

-(IBAction)btnDoneTapped:(id)sender;
-(IBAction)btnFullScreenTapped:(id)sender;
-(IBAction)btnPausePlayTapped:(id)sender;

@end
