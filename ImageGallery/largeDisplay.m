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
- (void) instantiate:(UIImage *)pic:(CGPoint)WidthHeight{
    picture = pic;
    widthHeight = WidthHeight;
    main = [[UIImageView alloc]init];
    shaper = [[imageMover alloc]init];
    // makes the main picture
    main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height];
    [main setImage:picture];
}

// draws the display on the screem
- (void) drawOnScreen:(UIView *)view{
    [view addSubview:main];
}

// setups up what the picture should look like rotated
- (void) SetForRotate:(CGPoint)WidthHeight{
    main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height];
}

// changes the image displayed
- (void) changeImage:(UIImage *)pic{
    picture = pic;
    main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height];
    [main setImage:picture];
}
@end
