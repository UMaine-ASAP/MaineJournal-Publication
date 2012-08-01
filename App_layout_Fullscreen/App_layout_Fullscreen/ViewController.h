//
//  ViewController.h
//  App_layout_Fullscreen
//
//  Created by Pip Kolmar on 7/30/12.
//  Copyright (c) 2012 University of Maine . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController{
    
    UIInterfaceOrientation shouldAutorotateToInterfaceOrientation;
    
}

-(IBAction)playMovie;
-(IBAction)exitMovie;
-(IBAction)link;

@end
