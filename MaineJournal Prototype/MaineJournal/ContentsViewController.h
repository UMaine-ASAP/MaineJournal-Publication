//
//  ContentsViewController.h
//  MaineJournal
//
//  Created by asap on 9/24/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMCircularScrollView.h"

@interface ContentsViewController : UIViewController {
    UIView *contentsView;
    UILabel *contentsViewText;
    
    DMCircularScrollView* longScrollView;
    DMCircularScrollView* threePageScrollView;
}


@end
