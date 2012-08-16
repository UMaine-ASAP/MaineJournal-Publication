//
//  File.h
//  ArticleLayout
//
//  Created by admin on 8/15/12.
//  Copyright (c) 2012 asap. All rights reserved.
//

#import <Foundation/Foundation.h>

// Defines what a File is
@interface File : NSObject {
	NSInteger xPos;
	NSInteger yPos;
	NSInteger width;
	NSInteger height;
	NSInteger type;
	NSString *project;
	NSString *author;
	NSInteger isInLayout; // Temporarily an integer (0=False, 1=True) until I can figure out how to reference booleans from a SQLite DB
}

// Sets File Properties
@property (nonatomic, assign) NSInteger xPos;
@property (nonatomic, assign) NSInteger yPos;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, assign) NSInteger	type;
@property (nonatomic, retain) NSString *project;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, assign) NSInteger isInLayout;

@end
