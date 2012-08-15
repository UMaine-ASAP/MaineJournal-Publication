//
//  ViewController.h
//  ArticleLayout
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	// Create an array to hold data
	NSMutableArray *files;
}

// Define dem properties (everything besides NSMutableArray is obvious from the MainStoryboard
@property (nonatomic, retain) NSMutableArray *files;

@end
