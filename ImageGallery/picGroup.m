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
- (void) instantiate:(NSMutableArray *)pictures:(CGPoint)WidthHeight{
    widthHeight = WidthHeight;
    
    // these varibles can be changed really easily to adjust the way the page is setup
    NumAcross = 3;
    picSize = 60;
    
    gallerySub = [[NSMutableArray alloc]init];
    for (int i=0; i<pictures.count; i++) {
        subImage *temp = [[subImage alloc]init];
        [temp instantiate:[pictures objectAtIndex:i]];
        [gallerySub addObject:temp];
    }
}

// draws each of the images in the subview
- (void) drawOnView:(UIView *)view{
    int temp = 0;
    double rows = ceil(((double)gallerySub.count)/((double)NumAcross));
    for (int a=0; a<rows; a++){
        int imagesLeft = gallerySub.count-temp;
        if (imagesLeft<NumAcross){
            for (int i=0; i<imagesLeft; i++){
                int x = ((widthHeight.x/2)-((picSize*1.25*NumAcross)/2))+(picSize*1.25*i);
                int y = widthHeight.y+(picSize*1.25*(a+1));
                [[gallerySub objectAtIndex:temp] drawInView:view:x:y:picSize];
                temp += 1;
            }
        }
        else {
            for (int i=0; i<NumAcross; i++){
                int x = ((widthHeight.x/2)-((picSize*1.25*NumAcross)/2))+(picSize*1.25*i);
                int y = widthHeight.y+(picSize*1.25*(a+1));
                [[gallerySub objectAtIndex:temp] drawInView:view:x:y:picSize];
                temp += 1;
            }
        }
    }
}

// returns the array of subImages
- (NSMutableArray *) getArray{
    return gallerySub;
}

@end
