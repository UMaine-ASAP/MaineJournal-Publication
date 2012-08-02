//
//  ViewController.h
//  App_layout_git
//
//  Created by Pip Kolmar on 8/1/12.
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
