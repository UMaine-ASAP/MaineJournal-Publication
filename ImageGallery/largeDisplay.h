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
    UIImage *picture;
    CGPoint widthHeight;
    imageMover *shaper;
}
- (void) instantiate:(UIImage *)pic:(CGPoint)WidthHeight;
- (void) drawOnScreen:(UIView *)view;
- (void) changeImage:(UIImage *)pic;
- (void) SetForRotate:(CGPoint)WidthHeight;

@end
