//
//  StoreScrollLayer.h
//  Touch_Project
//
//  Created by Артур on 22.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface StoreScrollLayer : CCLayer <CCTargetedTouchDelegate>
{
	int pageSize;
	int currentPage;
	NSMutableArray* arrayPages;
	CCLayer* world;
	CGPoint touchStartedPoint;
	CGPoint touchStartedWorldPosition;
	BOOL isTouching;
}

@property (nonatomic, assign) int pageSize;
@property (nonatomic, assign) int currentPage;
@property (nonatomic, retain) NSMutableArray* arrayPages;

-(void)makePages;

@end