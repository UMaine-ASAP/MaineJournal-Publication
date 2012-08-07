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
    
    NSTimer *Main;
    NSMutableArray *gallery;
    NSMutableArray *ImageViews;
    NSMutableArray *subtitles;
    
    CGPoint center;
    CGPoint touchPos;
    
    UIImage *image;
    
    IBOutlet UIImageView *large;
    
    
    picGroup *images;
    subImage *holder;
    largeDisplay *main;
}

@end
