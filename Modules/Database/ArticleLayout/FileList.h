//
//  FileList.h
//  ArticleLayout
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface FileList : NSObject {
	// Declare the database
	sqlite3 *db;
}

//Declare an array of files
- (NSMutableArray *) getFiles;

@end
