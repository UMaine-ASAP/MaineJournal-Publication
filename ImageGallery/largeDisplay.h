//
//  largeDisplay.h
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface largeDisplay : NSObject
{
    IBOutlet UIImageView *main;
    UIImage *picture;
    CGPoint Center;
    CGPoint widthHeight;
}
- (void) instantiate:(UIImage *)pic:(CGPoint)center:(CGPoint)WidthHeight;
- (void) drawOnScreen:(UIView *)view;
- (void) changeImage:(UIImage *)pic;

@end
