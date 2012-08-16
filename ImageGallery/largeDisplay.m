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
    imageIndex = 0;
    picture = pic;
    widthHeight = WidthHeight;
    main = [[UIImageView alloc]init];
    shaper = [[imageMover alloc]init];
    // makes the main picture
    main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height:0];
    [main setImage:picture];
}

// draws the display on the screem
- (void) drawOnScreen:(UIView *)view{
    [view addSubview:main];
}

// setups up what the picture should look like rotated
- (void) reShape:(CGPoint)WidthHeight{
    main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height:0];
}

// changes the image displayed
- (void) changeImage:(UIImage *)pic:(int)index{
    picture = pic;
    main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height:0];
    [main setImage:picture];
    imageIndex = index;
}

// setup the image when swiped for movement
- (void) SwipeMoveSetup:(UIImage *)nextpic:(int)xVel:(UIView *)view:(int)index:(Boolean)right{
    temp = [[UIImageView alloc]init];
    if (right)
        temp.frame = [shaper getSize:widthHeight :nextpic.size.width :nextpic.size.height :-widthHeight.x];
    else 
        temp.frame = [shaper getSize:widthHeight :nextpic.size.width :nextpic.size.height :widthHeight.x];
    [temp setImage:nextpic];
    [view addSubview:temp];
    imageIndex = index;
    Xvel = xVel;
    xAccel = 0.575;
}

// moves the image
- (Boolean) Move{
    if (Xvel>0.25)
        Xvel = (Xvel-xAccel);
    if (Xvel<-0.25)
        Xvel = (Xvel+xAccel);
    if ((Xvel<=0.25) && (Xvel>=-0.25)){
        [temp removeFromSuperview];
        picture = temp.image;
        [main setImage:picture];
        main.frame = [shaper getSize:widthHeight :picture.size.width :picture.size.height :0];
        return FALSE;
    }
    else{
        temp.center = CGPointMake(temp.center.x+Xvel,temp.center.y);
        main.center = CGPointMake(main.center.x+Xvel, main.center.y);
        return TRUE;
    }
}

// gets the current image index
- (int) getIndex{
    return imageIndex;
}

@end
