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
}
- (void) instantiate:(NSMutableArray *)pictures;
- (void) drawOnView:(UIView *)view;
- (NSMutableArray *) getArray;
@end
