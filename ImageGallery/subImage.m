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
- (void) drawInView:(UIView *)view:(int)xx:(int)yy:(int)PicSize{
    
    x = xx;
    y = yy;
    width = PicSize;
    height = PicSize;
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
    picture.frame = CGRectMake(x-(((width*1.2)-width)/2),y-(((height*1.2)-height)/2),width*1.2,height*1.2);
}

// makes te image smaller
- (void) drawSmall:(UIView *)view{
    picture.frame = CGRectMake(x,y,width,height);
}

@end
