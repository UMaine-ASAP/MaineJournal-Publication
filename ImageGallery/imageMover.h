//
//  imageMover.h
//  ImageGallery
//
//  Created by Will Hofacker on 8/14/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface imageMover : NSObject{
    
    CGRect myRect;
    CGPoint widthHeight;
    int pictureWidth;
    int PictureHeight;
}

- (CGRect)getSize:(CGPoint)WidthHeight:(int)width:(int)height;
@end
