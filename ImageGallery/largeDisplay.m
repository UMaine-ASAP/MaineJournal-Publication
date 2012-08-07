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
- (void) instantiate:(UIImage *)pic:(CGPoint)center:(NSString *)str{
    picture = pic;
    Center = center;
    // makes the main picture
    main = [[UIImageView alloc]init];
    main.frame = CGRectMake( Center.x-((pic.size.width/5)/2), Center.y-((pic.size.height/5)/2), pic.size.width/5, pic.size.height/5);
    [main setImage:pic];
    // makes it's label
    description = [[UILabel alloc] initWithFrame:CGRectMake(center.x, center.y, 200, 50)];
    description.text = str;
    description.textColor = [UIColor whiteColor];
    
}

// draws the display on the screem
- (void) drawOnScreen:(UIView *)view{
    [view addSubview:main];
    [view addSubview:description];
}

// changes the image displayed
- (void) changeImage:(UIImage *)pic{
    picture = pic;
    main.frame = CGRectMake( Center.x-((pic.size.width/5)/2), Center.y-((pic.size.height/5)/2), pic.size.width/5, pic.size.height/5);
    [main setImage:pic];
}
@end
