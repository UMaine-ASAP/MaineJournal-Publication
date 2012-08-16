//
//  imageMover.m
//  ImageGallery
//
//  Created by Will Hofacker on 8/14/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "imageMover.h"

@implementation imageMover


// a method that simlifies the large display class
- (CGRect)getSize:(CGPoint)WidthHeight:(int)width:(int)height:(int)start{
    if (width>height){
        float ratio = (WidthHeight.x/width);
        myRect = CGRectMake(start, (WidthHeight.y/2)-((height*ratio)/2), WidthHeight.x,height*ratio);
    }
    else {
        float ratio = ((WidthHeight.y)/height);
        myRect = CGRectMake( (WidthHeight.x/2)-((width*ratio)/2)+start, 0, width*ratio, WidthHeight.y);
    }
    return myRect;
}

@end
