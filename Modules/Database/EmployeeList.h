//
//  EmployeeList.h
//  DatabaseConnection
//
//  Created by admin on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// Defines what an Employee is made up of
@interface EmployeeList : NSObject {
	NSInteger employeeId;
	NSString *employeeName;
	NSString *employeePosition;
	UIImage *image;
}

// Sets Employee Properties
@property (nonatomic, assign) NSInteger employeeId;
@property (nonatomic, retain) NSString *employeeName;
@property (nonatomic, retain) NSString *employeePosition;
@property (nonatomic, retain) UIImage *image;

@end
