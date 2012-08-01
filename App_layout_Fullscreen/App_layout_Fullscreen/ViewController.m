//
//  ViewController.m
//  App_layout_Fullscreen
//
//  Created by Pip Kolmar on 7/30/12.
//  Copyright (c) 2012 University of Maine . All rights reserved.
//

#import "ViewController.h"
#import "UIKit/UIKit.h"

@interface ViewController ()

@end



@interface ViewController ()
@property (nonatomic, retain) MPMoviePlayerController *playerViewController;
@property (nonatomic, retain) UIButton *buttonPress;

@end

@implementation ViewController;

@synthesize playerViewController = _playerViewController;
@synthesize buttonPress = _buttonPress;


- (void)dealloc {
    self.playerViewController = nil;\
    
realloc: {
    self.buttonPress = nil;\
    
}
}

//void moviePlayer (id vidName, id type);

//void moviePlayer (id vidName, id type){

    
    -(IBAction)playMovie{
    
    
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]pathForResource:@"We_Cant_Elope" ofType:@"mov"]];
    
        MPMoviePlayerController *playerViewController = [[MPMoviePlayerController alloc] init];
        playerViewController.contentURL = url;
        if (self.interfaceOrientation == UIInterfaceOrientationLandscapeLeft || self.interfaceOrientation == UIInterfaceOrientationLandscapeRight){
            playerViewController.view.frame = CGRectMake(0, 0, 1030, 768);
        }
        else{
            playerViewController.view.frame = CGRectMake(0,0, 768, 1004);
        }
        [playerViewController setControlStyle: MPMovieControlStyleFullscreen];
        [playerViewController setScalingMode:MPMovieScalingModeAspectFit];
        playerViewController.view.AutoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:playerViewController.view];
        [playerViewController play];
        MPMoviePlaybackState playbackState = playerViewController.playbackState;
        if(playbackState == MPMoviePlaybackStateStopped)
        {
            [playerViewController.view removeFromSuperview];
        } 
        self.playerViewController = playerViewController;
    
    
    }
//}

//void moviePlayer(id We_Cant_Elope, id mov);
    


-(IBAction)link{
    
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString: @"http://mainejournal.umaine.edu"]];
}





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
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}


@end
