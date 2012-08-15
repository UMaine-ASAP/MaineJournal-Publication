//
//  ViewController.h
//  MaineJournal Test
//
//  Created by Ben Carlson on 8/14/12.
//  Copyright (c) 2012 ASAP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PullableView.h"

@interface ArticleViewController : UIViewController{
    PullableView *pullDownView;
    CGFloat width;
}

@end
