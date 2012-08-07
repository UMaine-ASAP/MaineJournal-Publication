//
//  subImage.m
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "subImage.h"

@implementation subImage

// makes and setups the class
- (void) instantiate:(UIImage *)pictemp{
    pic = pictemp;
}

// draws the indvidual image
- (void) drawInView:(UIView *)view:(int)xx:(int)yy{
    
    x = xx;
    y = yy;
    width = 50;
    height = 50;
    picture = [[UIImageView alloc]init];
    picture.frame = CGRectMake(x,y,width,height);
    [picture setImage:pic];
    [view addSubview:picture];
    
}

// checks to see if the xx and yy are inside it's box
- (Boolean) inBox:(int)xx:(int)yy{
    if (xx>x && xx<x+width && yy>y && yy<y+height){
        return TRUE;
    }
    else {
        return FALSE;
    }
        
}

//returns its image
- (UIImage *) getPicture{
    return pic;
}

// makes the image bigger
- (void) drawBig:(UIView *)view{
    width = 60;
    height = 60;
    picture.frame = CGRectMake(x-5,y-5,width,height);
}

// makes te image smaller
- (void) drawSmall:(UIView *)view{
    width = 50;
    height = 50;
    picture.frame = CGRectMake(x,y,width,height);
}

@end
