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
    UILabel *description;
}
- (void) instantiate:(UIImage *)pic:(CGPoint)center:(NSString *)str;
- (void) drawOnScreen:(UIView *)view;
- (void) changeImage:(UIImage *)pic;

@end
