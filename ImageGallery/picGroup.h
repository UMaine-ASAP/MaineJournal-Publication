//
//  picGroup.h
//  ImageGallery
//
//  Created by Will Hofacker on 7/24/12.
//  Copyright (c) 2012 UMO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface picGroup : NSObject
{
    NSMutableArray *gallerySub;
    int NumAcross;
    CGPoint widthHeight;
    int picSize;
}
- (void) instantiate:(NSMutableArray *)pictures:(CGPoint)WidthHeight;
- (void) drawOnView:(UIView *)view;
- (NSMutableArray *) getArray;
@end
