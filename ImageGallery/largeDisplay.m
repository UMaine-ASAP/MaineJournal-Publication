//
//  largeDisplay.m
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "largeDisplay.h"

@implementation largeDisplay

// makes and setups the class
- (void) instantiate:(UIImage *)pic:(CGPoint)center:(CGPoint)WidthHeight{
    picture = pic;
    Center = center;
    widthHeight = WidthHeight;
    // makes the main picture
    main = [[UIImageView alloc]init];
    if (pic.size.width>pic.size.height){
        float ratio = (widthHeight.x/pic.size.width);
        main.frame = CGRectMake( Center.x-(widthHeight.x/2), Center.y-((pic.size.height*ratio)/2)-150, widthHeight.x,pic.size.height*ratio);
    }
    else {
        float ratio = ((widthHeight.y-200)/pic.size.height);
        main.frame = CGRectMake( Center.x-((pic.size.width*ratio)/2), Center.y-((widthHeight.y-200)/2)-150, pic.size.width*ratio, widthHeight.y-200);
    }
    [main setImage:pic];
}

// draws the display on the screem
- (void) drawOnScreen:(UIView *)view{
    [view addSubview:main];
}

// changes the image displayed
- (void) changeImage:(UIImage *)pic{
    picture = pic;
    if (pic.size.width>pic.size.height){
        float ratio = (widthHeight.x/pic.size.width);
        main.frame = CGRectMake( Center.x-(widthHeight.x/2), Center.y-((pic.size.height*ratio)/2)-150, widthHeight.x,pic.size.height*ratio);
    }
    else {
        float ratio = ((widthHeight.y-200)/pic.size.height);
        main.frame = CGRectMake( Center.x-((pic.size.width*ratio)/2), Center.y-((widthHeight.y-200)/2)-150, pic.size.width*ratio, widthHeight.y-200);
    }
    [main setImage:pic];
}
@end
