//
//  CCSprite+DisableTouch.m
//  Touch_Project
//
//  Created by Артур on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCSprite+DisableTouch.h"

@implementation CCSprite (DisableTouch)

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    return YES;
}

-(void)disableTouch
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1000 swallowsTouches:YES];
}

-(void)enableTouch
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
}

@end
