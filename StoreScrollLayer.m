//
//  StoreScrollLayer.m
//  Touch_Project
//
//  Created by Артур on 22.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoreScrollLayer.h"

@interface StoreScrollLayer()
@property (nonatomic,retain) CCLayer* world;
- (BOOL)containsTouchLocation:(UITouch *)touch;
- (void) moveToPagePosition;
@end


@implementation StoreScrollLayer
@synthesize pageSize;
@synthesize arrayPages;

@synthesize world;
-(id) init {
	if ((self=[super init])) {
		self.isTouchEnabled = YES;
		isTouching = NO;
	}
	return self;
}
- (void)onEnter {
    //	CCLOG(@"onEnter");
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:10 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit {
    //	CCLOG(@"onEnter");
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}	

-(void)makePages {
	CGSize s = self.contentSize;
    //	CCLOG(@"[%f][%f]",s.width,s.height);
    //	CCLOG(@"anchorpoint[%f][%f]",self.anchorPoint.x,self.anchorPoint.y);
	self.world = [CCLayer node];
	//world.contentSize = CGSizeMake(s.width * pageSize, s.height);
    world.contentSize = CGSizeMake(s.width, s.height*pageSize );
	for (int i=0; i < [arrayPages count]; i++) {
		CCNode* n = [arrayPages objectAtIndex:i];
		//n.position = ccp(s.width / 2 + i * s.width, s.height / 2);
        n.position = ccp(s.width/2, s.height/2+i*s.height);
		[world addChild:n];
	}
	//world.anchorPoint = ccp(0,0);
	//world.position = ccp(-s.width /2 -s.width * currentPage, -s.height/2);
    world.position = ccp(-s.width/2,-s.height/2-s.height*currentPage);
	[self addChild:world];
	
}

- (BOOL)containsTouchLocation:(UITouch *)touch
{
	CGPoint p = [self convertTouchToNodeSpaceAR:touch];
	//CGRect r = CGRectMake(-self.contentSize.width, -self.contentSize.height / 2, self.contentSize.width * 2, self.contentSize.height);
    CGRect r = CGRectMake(-self.contentSize.width/2, -self.contentSize.height*3, self.contentSize.width, self.contentSize.height*5);
	return CGRectContainsPoint(r, p);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
	if (isTouching) return NO;
	if ( ![self containsTouchLocation:touch] ) return NO;
	isTouching = YES;
	touchStartedPoint = [self convertTouchToNodeSpaceAR:touch];
	touchStartedWorldPosition = world.position;
	CCLOG(@"touch handle");
	return YES;
	
}
- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint n = [self convertTouchToNodeSpaceAR:touch];
	//world.position = ccp(touchStartedWorldPosition.x + n.x - touchStartedPoint.x, touchStartedWorldPosition.y);
    world.position = ccp(touchStartedWorldPosition.x,touchStartedWorldPosition.y+n.y-touchStartedPoint.y);
	
}
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint n = [self convertTouchToNodeSpaceAR:touch];
    
	//if (n.x - touchStartedPoint.x > 50 && currentPage > 0) 
    //if(n.y - touchStartedPoint.y > 50 && currentPage > 0)
    
    if(n.y - touchStartedPoint.y > 185 && currentPage > 0)
    {
		self.currentPage = self.currentPage - 4;
	}
    else if(n.y - touchStartedPoint.y > 135 && currentPage > 0)
    {
		self.currentPage = self.currentPage - 3;
	}
    else if(n.y - touchStartedPoint.y > 75 && currentPage > 0)
    {
		self.currentPage = self.currentPage - 2;
	}
    else if(n.y - touchStartedPoint.y > 25 && currentPage >0)
    {
		self.currentPage = self.currentPage - 1;
	}
    
    //if (n.x - touchStartedPoint.x < -50 && currentPage < ([arrayPages count] - 1))
    //if (n.y - touchStartedPoint.y < -50 && currentPage < ([arrayPages count] - 1))
    
    if (n.y - touchStartedPoint.y < -185 && currentPage < ([arrayPages count] - 1))
    {
		self.currentPage = self.currentPage + 4;
	}
    else if (n.y - touchStartedPoint.y < -135 && currentPage < ([arrayPages count] - 1))
    {
		self.currentPage = self.currentPage + 3;
	}
    else if (n.y - touchStartedPoint.y < -75 && currentPage < ([arrayPages count] - 1))
    {
		self.currentPage = self.currentPage + 2;
	}
    else if (n.y - touchStartedPoint.y < -25 && currentPage < ([arrayPages count] - 1))
    {
		self.currentPage = self.currentPage + 1;
	}
    
    
	[self moveToPagePosition];
	isTouching = NO;
}
- (void)ccTouchCancelled:(UITouch *)touch withEvent:(UIEvent *)event {
	isTouching = NO;
	[self moveToPagePosition];
}

-(int) currentPage {
	return currentPage;
}

-(void) setCurrentPage:(int)a {
	if (a >= 0 && a < pageSize) {
		currentPage = a;
	}else {
		NSAssert(YES,@"ERROR! not valid page number");
		return;
	}
	if (world) {
		[self moveToPagePosition];
	}
	
}
- (void) moveToPagePosition {
	CGPoint positionNow = world.position;
	CGSize s = self.contentSize;
	//float diffX = fabs( (positionNow.x) - (-s.width /2 -s.width * currentPage));
    float diffX = fabs( (positionNow.y) - (-s.height /2 -s.height * currentPage));
    //	CCLOG(@"diff[%f]",diffX);
	
	if (diffX > 0) {
		//id moveTo = [CCMoveTo actionWithDuration:(0.5 * diffX / s.width)  position:ccp(-s.width /2 -s.width * currentPage, -s.height/2)];
        id moveTo = [CCMoveTo actionWithDuration:(0.5 * diffX / s.height)  position:ccp(-s.width/2,-s.height/2 - s.height*currentPage)];
		[world runAction:moveTo];
	}
	
}


@end