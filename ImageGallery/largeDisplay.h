//
//  largeDisplay.h
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "imageMover.h"

@interface largeDisplay : NSObject
{
    IBOutlet UIImageView *main;
    IBOutlet UIImageView *temp;
    UIImage *picture;
    CGPoint widthHeight;
    imageMover *shaper;
    float Xvel;
    float xAccel;
    int imageIndex;
}
- (void) instantiate:(UIImage *)pic:(CGPoint)WidthHeight;
- (void) drawOnScreen:(UIView *)view;
- (void) changeImage:(UIImage *)pic:(int)index;
- (void) ReShape:(CGPoint)WidthHeight;
- (void) SwipeMoveSetup:(UIImage *)nextpic:(int)xVel:(UIView *)view:(int)index:(Boolean)right;
- (Boolean) Move;
- (int) getIndex;

@end
