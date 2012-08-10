//
//  picGroup.m
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import "PicGroup.h"
#import "subImage.h"

@implementation picGroup

// makes and setups the class
- (void) instantiate:(NSMutableArray *)pictures{
    gallerySub = [[NSMutableArray alloc]init];
    for (int i=0; i<pictures.count; i++) {
        subImage *temp = [[subImage alloc]init];
        [temp instantiate:[pictures objectAtIndex:i]];
        [gallerySub addObject:temp];
    }
}

// draws each of the images in the subview
- (void) drawOnView:(UIView *)view{
    for (int i=0; i<gallerySub.count; i++){
        int x = 244+(70*i);
        int y = 820;
        if (i >= (gallerySub.count/2)){
            x = 244+(70*(i-(gallerySub.count/2)));
            y = 890;
        }
        [[gallerySub objectAtIndex:i] drawInView:view:x:y];
    }
}

// returns the array of subImages
- (NSMutableArray *) getArray{
    return gallerySub;
}

@end
