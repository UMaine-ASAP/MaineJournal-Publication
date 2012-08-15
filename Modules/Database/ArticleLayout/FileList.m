//
//  FileList.m
//  ArticleLayout
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import "FileList.h"
// Import the EmployeeList class
#import "File.h"

@implementation FileList

// Let's fill the array!
-(NSMutableArray *) getFiles{
	NSMutableArray *fileArray = [[NSMutableArray alloc] init];
	// Make sure we can access the database (called ASAP.sqlite in the Bundle)
	// NOTE: I used a Firefox Plugin (SQLite Manager) to make a test database really fast
	@try {
		// Checks to make sure the database is where we said it should be
		NSFileManager *fileMgr = [NSFileManager defaultManager];
		NSString *dbPath = [[[NSBundle mainBundle] resourcePath]stringByAppendingPathComponent:@"ArticleFiles.sqlite"];
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
		const char *sql = "SELECT xPos, yPos, width, height FROM Files";
		sqlite3_stmt *sqlStatement;
		
		// If there's an issue with that statement...
		if(sqlite3_prepare(db, sql, -1, &sqlStatement, NULL) != SQLITE_OK)
		{
			NSLog(@"Problem with prepare statement.");
		}
		
		// Populate the array!
		while (sqlite3_step(sqlStatement)==SQLITE_ROW) {
			File *fileList = [[File alloc] init];
			
			// There are four selections (0-3), one for each of the elements attributed to each employee
			fileList.xPos = sqlite3_column_int(sqlStatement, 0);
			fileList.yPos = sqlite3_column_int(sqlStatement, 1);
			fileList.width = sqlite3_column_int(sqlStatement, 2);
			fileList.height = sqlite3_column_int(sqlStatement, 3);
			[fileArray addObject:fileList];
		}
	}
	@catch (NSException *exception) {
		NSLog(@"An exception occured: %@", [exception reason]);
	}
	@finally {
		// Now we have an array of employees (in this case, Sam, Time, Ben, etc.)
		// Each employee is an array (id, name, position, image)
		return fileArray;
	}
}

@end