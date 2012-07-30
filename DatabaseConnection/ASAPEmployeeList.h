//
//  ASAPEmployeeList.h
//  DatabaseConnection
//
//  Created by admin on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
// SQLite Library, pretty important nomsayin'?
#import <sqlite3.h>

@interface ASAPEmployeeList : NSObject {
	// Declare the database
	sqlite3 *db;
}

// Declare and array of employees
- (NSMutableArray *) getEmployees;

@end
