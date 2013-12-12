//
//  PopUp.m
//  Touch_Project
//
//  Created by Артур on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PopUp.h"
#import "CCMenuPopup.h"
//#import "CCSprite+DisableTouch.h"

#define ANIM_SPEED 1.19f

@implementation PopUp

enum tags
{
    tBG = 1,
    bBG = 2
};


+(id)popUpWithSprite:(CCNode *)sprite andWindow:(CCNode*)sprite2
{
    return [[[self alloc] initWithSprite:sprite andWindow:sprite2] autorelease];
}

- (id)initWithSprite:(CCNode *)sprite andWindow:(CCNode*)sprite2
{
    self = [super init];
    if (self) 
    {
        CGSize s = [[CCDirector sharedDirector] winSize];
        container = sprite;
        
        window = sprite2;
        window.position = ccp(s.width/2,s.height/2);
        
        
        bg = [CCSprite node];
        bg.color = ccBLACK;
        bg.opacity = 150;
        [bg setTextureRect:CGRectMake(0, 0, s.width, s.height)];
        bg.anchorPoint = ccp(0.5,0.5);
        bg.position = ccp(s.width/2,s.height/2);
        container.anchorPoint = ccp(0,0);
        //container.position = ccp(s.width/2,s.height/2);
        [bg disableTouch];   //БЛОКИРУЕТ ТАЧ на СЦЕНЕ и АКТИВИРУЕТ НА bg(МЕНЮ)
        
        [self addChild:bg z:-1 tag:tBG];
        [self addChild:window z:1];
        
        [self addChild:container z:2 tag:bBG];
        
        [bg runAction:[CCFadeTo actionWithDuration:ANIM_SPEED/2 opacity:150]];
        [container runAction:[CCFadeTo actionWithDuration:ANIM_SPEED/2 opacity:250]];
        [window runAction:[CCFadeTo actionWithDuration:ANIM_SPEED*0.6 opacity:250]];
        
        [container runAction:[CCSequence actions:
                              //[CCScaleTo actionWithDuration:ANIM_SPEED /2 scale:0.9],
                              [CCScaleTo actionWithDuration:ANIM_SPEED /10 scale:0.9],
                              [CCScaleTo actionWithDuration:ANIM_SPEED/2  scale:1.0],
                              //[CCScaleTo actionWithDuration:ANIM_SPEED/5  scale:0.95],
                              nil]];
        [window runAction:[CCSequence actions:
                           //[CCScaleTo actionWithDuration:ANIM_SPEED /2 scale:0.9],
                           [CCScaleTo actionWithDuration:ANIM_SPEED /10 scale:0.9],
                           [CCScaleTo actionWithDuration:ANIM_SPEED/2  scale:1.0],
                           //[CCScaleTo actionWithDuration:ANIM_SPEED/5  scale:0.95],
                           nil]];
        
    }
    return self;
}

-(void)closePopUp
{
    [(CCSprite *)[self getChildByTag:tBG] enableTouch];
    [container runAction:[CCFadeTo actionWithDuration:ANIM_SPEED/2 opacity:100]];
    [window runAction:[CCFadeTo actionWithDuration:ANIM_SPEED/2 opacity:100]];

    [bg runAction:[CCFadeTo actionWithDuration:ANIM_SPEED/2 opacity:100]];
    [container runAction:[CCSequence actions:
                          [CCScaleTo actionWithDuration:ANIM_SPEED /2 scale:0.9],
                          //[CCDelayTime actionWithDuration:ANIM_SPEED/5],
                          [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                          nil]];
    
}

-(void)allDone
{
    [self removeFromParentAndCleanup:YES];
}



@end
