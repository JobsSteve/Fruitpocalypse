//
//  TouchTrailLayer.m
//  Touch_Project
//
//  Created by Артур on 19.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "TouchTrailLayer.h"

void releaseBlade(CFAllocatorRef allocator, const void *value)
{
    [(CCBlade*)value finish];
}

CFDictionaryValueCallBacks valueCallbacks = {
    0,
    NULL,
    releaseBlade,
    NULL,
    NULL
};

@implementation TouchTrailLayer

- (id) init{
	self = [super init];
	isTouchEnabled_ = 1;
    map = CFDictionaryCreateMutable(NULL,0,NULL,&valueCallbacks);
	return self;
}

- (void) ccTouchesBegan:(NSSet *) touches withEvent:(UIEvent *) event{
	for (UITouch *touch in touches) {
		CCBlade *w = [CCBlade bladeWithMaximumPoint:50];
        w.autoDim = YES;
        int rand = arc4random() % 4 + 1;
		w.texture = [[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"streak%d.png",rand]];
        
        CFDictionaryAddValue(map,touch,w);
        
		[self addChild:w];
		CGPoint pos = [touch locationInView:touch.view];
		pos = [[CCDirector sharedDirector] convertToGL:pos];
		[w push:pos];
	}
}

- (void) ccTouchesMoved:(NSSet *) touches withEvent:(UIEvent *) event{
	for (UITouch *touch in touches) {
		CCBlade *w = (CCBlade *)CFDictionaryGetValue(map, touch);
		CGPoint pos = [touch locationInView:touch.view];
		pos = [[CCDirector sharedDirector] convertToGL:pos];
		[w push:pos];
	}
}

- (void) ccTouchesEnded:(NSSet *) touches withEvent:(UIEvent *) event{
	for (UITouch *touch in touches) {
		CCBlade *w = (CCBlade *)CFDictionaryGetValue(map, touch);
		[w dim:YES];
        CFDictionaryRemoveValue(map,touch);
	}
}

- (void) dealloc{
    CFRelease(map);
    [super dealloc];
}
@end