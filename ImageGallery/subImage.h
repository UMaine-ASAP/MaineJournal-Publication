//
//  subImage.h
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface subImage : NSObject
{
    IBOutlet UIImage *pic;
    IBOutlet UIImageView *picture;
    
    int x;
    int y;
    int width;
    int height;
}
- (void) instantiate:(UIImage *)pictemp;
- (void) drawInView:(UIView *)view:(int)xx:(int)yy;
- (Boolean) inBox:(int)xx:(int)yy;
- (UIImage *) getPicture;
- (void) drawBig:(UIView *)view;
- (void) drawSmall:(UIView *)view;
@end
