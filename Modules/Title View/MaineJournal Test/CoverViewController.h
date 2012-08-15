//
//  CoverViewController.h
//  MaineJournal Test
//
//  Created by ben on 8/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfinitePagingView.h"


@interface CoverViewController : UIViewController {
    UITextView *titleView;
    
    InfinitePagingView *pagingView;
    UIView *sliderObject;
    UIImage *sliderImage;
    UILabel *sliderButton;
}



@end
