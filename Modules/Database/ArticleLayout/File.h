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
}

// Sets File Properties
@property (nonatomic, assign) NSInteger xPos;
@property (nonatomic, assign) NSInteger yPos;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;

@end
