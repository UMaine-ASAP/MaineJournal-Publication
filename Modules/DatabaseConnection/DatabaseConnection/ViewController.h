//
//  ViewController.h
//  DatabaseConnection
//
//  Created by admin on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
	// Create an array that will hold the Employee data
	NSMutableArray *employees;
}

// Define dem properties (everything besides NSMutableArray is obvious from the MainStoryboard
@property (nonatomic, retain) NSMutableArray *employees;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *employeeName;
@property (weak, nonatomic) IBOutlet UILabel *employeePosition;

// Action associated with the "Next Employee" button
- (IBAction)GetEmployeeList:(id)sender;

@end
