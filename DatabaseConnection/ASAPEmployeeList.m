//
//  ASAPEmployeeList.m
//  DatabaseConnection
//
//  Created by admin on 7/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ASAPEmployeeList.h"
// Import the EmployeeList class
#import "EmployeeList.h"

@implementation ASAPEmployeeList

// Let's fill the array!
-(NSMutableArray *) getEmployees{
	NSMutableArray *asapArray = [[NSMutableArray alloc] init];
	// Make sure we can access the database (called ASAP.sqlite in the Bundle)
	// NOTE: I used a Firefox Plugin (SQLite Manager) to make a test database really fast
	@try {
		// Checks to make sure the database is where we said it should be
		NSFileManager *fileMgr = [NSFileManager defaultManager];
		NSString *dbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"ASAP.sqlite"];
		BOOL success = [fileMgr fileExistsAtPath:dbPath];
		// If it's not...
		if(!success)
		{
			NSLog(@"Cannot locate database file name '%@'.", dbPath);
		}
		// If the database can't be opened...
		if(!(sqlite3_open([dbPath UTF8String], &db) == SQLITE_OK))
		   {
			   NSLog(@"An error has occured.");
		   }
		
		// Setup a statement to pull data from the database
		const char *sql = "SELECT id, name, position, image FROM employees";
		sqlite3_stmt *sqlStatement;
		
		// If there's an issue with that statement...
		if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
		   {
			   NSLog(@"Problem with prepare statement.");
		   }
		   
		// Populate the array!
		while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
			   EmployeeList *ASAPList = [[EmployeeList alloc] init];
			
			// There are four selections (0-3), one for each of the elements attributed to each employee
			   ASAPList.employeeId = sqlite3_column_int(sqlStatement, 0);
			   ASAPList.employeeName = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 1)];
			   ASAPList.employeePosition = [NSString stringWithUTF8String:(char *) sqlite3_column_text(sqlStatement, 2)];
			   const char *raw = sqlite3_column_blob(sqlStatement, 3);
			   int rawLen = sqlite3_column_bytes(sqlStatement, 3);
			   NSData *data = [NSData dataWithBytes:raw length:rawLen];
			   ASAPList.image = [[UIImage alloc] initWithData:data];
			   [asapArray addObject:ASAPList];
		   }
		}
	@catch (NSException *exception) {
		NSLog(@"An exception occured: %@", [exception reason]);
	}
	@finally {
		// Now we have an array of employees (in this case, Sam, Time, Ben, etc.)
		// Each employee is an array (id, name, position, image)
		return asapArray;
	}
}

@end
