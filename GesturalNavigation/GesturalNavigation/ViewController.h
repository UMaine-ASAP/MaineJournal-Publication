//
//  ViewController.h
//  GesturalNavigation
//
//  Created by admin on 8/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	UIView *contents;
	UILabel *contentsTab;
	UIView *articlesLayer;
	UIView	*contentsLayer;
}

@property (nonatomic, retain) UIView *contents;
@property (nonatomic, retain) UILabel *contentsTab;
@property (nonatomic, retain) UIView *articlesLayer;
@property (nonatomic, retain) UIView *contentsLayer;

@end
