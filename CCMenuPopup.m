//
//  CCMenuPopup.m
//  Touch_Project
//
//  Created by Артур on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCMenuPopup.h"
#import "PopUp.h"

@implementation CCMenuPopup

-(void)registerWithTouchDispatcher
{
    [[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:-1001 swallowsTouches:YES];
}

-(BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (![super itemForTouch:touch])
    {
        return NO;
    }
    
    NSArray *ancestors = [NSArray arrayWithObjects:self.parent,self.parent.parent,self.parent.parent.parent, nil];
    for (CCNode *n in ancestors) 
    {
        if ([n isKindOfClass:[PopUp class]]) 
        {
            [(PopUp *)n closePopUp];
        }
    }
    
    return [super ccTouchBegan:touch withEvent:event];
}

@end
