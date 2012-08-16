//
//  image_swipeViewController.h
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "picGroup.h"
#import "subImage.h"
#import "largeDisplay.h"

@interface image_swipeViewController : UIViewController{
    
    NSTimer *Timer;
    NSMutableArray *gallery;
    NSMutableArray *ImageViews;
    NSMutableArray *subtitles;
    
    int xVel;
    CGPoint touchPos;
    CGPoint temptouchPos;
    Boolean moving;
    
    CGPoint WidthHeight;
    CGPoint touchPosSub;
    
    UIImage *image;
    
    IBOutlet UIImageView *large;
    IBOutlet UILabel *descriptiion;
    
    
    picGroup *images;
    subImage *holder;
    largeDisplay *main;
}

@end
