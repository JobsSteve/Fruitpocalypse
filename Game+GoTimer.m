//
//  Game+GoTimer.m
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+GoTimer.h"

@implementation Game (GoTimer)


-(void)goTimer:(ccTime)dt
{
    timerGo += dt;
    
    if(timerGo >= 0.0*2/3 && threeInBOOL == NO)
    {  
        [self enableTouch];
        CCLOG(@" >>>> 0.0 <<<<<<<");
        threeInBOOL = YES;
        //[goThreeSprite runAction:[CCFadeIn actionWithDuration:0.9]];
        
        id actionToEase = [CCFadeIn actionWithDuration:0.9];
        [goThreeSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 0.9*2/3 && threeOutBOOL == NO)
    {   CCLOG(@" >>>> 0.9 <<<<<<<");
        
        threeOutBOOL = YES;
        //[goThreeSprite runAction:[CCFadeOut actionWithDuration:0.6]];
        
        id actionToEase = [CCFadeOut actionWithDuration:0.6];
        [goThreeSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 1.0*2/3 && twoInBOOL == NO)
    {   CCLOG(@" >>>> 1.0 <<<<<<<");
        twoInBOOL = YES;
        //[goTwoSprite runAction:[CCFadeIn actionWithDuration:0.9]];
        id actionToEase = [CCFadeIn actionWithDuration:0.9];
        [goTwoSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 1.9*2/3 && twoOutBOOL == NO)
    {   CCLOG(@" >>>> 1.9 <<<<<<<");
        twoOutBOOL = YES;
        //[goTwoSprite runAction:[CCFadeOut actionWithDuration:0.6]];
        id actionToEase = [CCFadeOut actionWithDuration:0.6];
        [goTwoSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 2.0*2/3 && oneInBOOL == NO)
    {   CCLOG(@" >>>> 2.0 <<<<<<<");
        oneInBOOL = YES;
        //[goOneSprite runAction:[CCFadeIn actionWithDuration:0.9]];
        id actionToEase = [CCFadeIn actionWithDuration:0.9];
        [goOneSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 2.9*2/3 && oneOutBOOL == NO)
    {   CCLOG(@" >>>> 2.9 <<<<<<<");
        oneOutBOOL = YES;
        //[goOneSprite runAction:[CCFadeOut actionWithDuration:0.6]];
        id actionToEase = [CCFadeOut actionWithDuration:0.6];
        [goOneSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 3.0*2/3 && goInBOOL == NO)
    {  CCLOG(@" >>>> 3.0 <<<<<<<");
        goInBOOL = YES;
        //[goStartSprite runAction:[CCFadeIn actionWithDuration:0.9]];
        id actionToEase = [CCFadeIn actionWithDuration:0.9];
        [goStartSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
    }
    
    if(timerGo >= 3.9*2/3 && goOutBOOL == NO)
    {CCLOG(@" >>>> 3.9 <<<<<<<");
        goOutBOOL = YES;
        //[goStartSprite runAction:[CCFadeOut actionWithDuration:0.6]];
        id actionToEase = [CCFadeOut actionWithDuration:0.6];
        [goStartSprite runAction:[CCEaseExponentialOut actionWithAction:actionToEase]];
        [self schedule:@selector(Timer:)];
        [self disableTouch];
    }
    
    if(timerGo >= 5 && goDoneBOOL == NO)
    {
        goDoneBOOL = YES;
        [self unschedule:@selector(goTimer:)];
        [self removeChildByTag:31 cleanup:YES];
        [self removeChildByTag:32 cleanup:YES];
        [self removeChildByTag:33 cleanup:YES];
        [self removeChildByTag:34 cleanup:YES];
        
        CCLOG(@"DELETE");
    }
    
}

-(void)startGo
{
    oneInBOOL = NO, oneOutBOOL = NO, twoInBOOL = NO, twoOutBOOL = NO,threeInBOOL = NO, threeOutBOOL = NO, goInBOOL = NO, goOutBOOL = NO;
    goDoneBOOL = NO;
    
    goThreeSprite = [CCSprite spriteWithFile:@"go_3.png"];
    goThreeSprite.position = ccp(s.width/2,s.height/2);
    goThreeSprite.opacity = 0;
    [self addChild:goThreeSprite z:100 tag:31];
    
    goTwoSprite = [CCSprite spriteWithFile:@"go_2.png"];
    goTwoSprite.position = ccp(s.width/2,s.height/2);
    goTwoSprite.opacity = 0;
    [self addChild:goTwoSprite z:100 tag:32];
    
    goOneSprite = [CCSprite spriteWithFile:@"go_1.png"];
    goOneSprite.position = ccp(s.width/2,s.height/2);
    goOneSprite.opacity = 0;
    [self addChild:goOneSprite z:100 tag:33];
    
    goStartSprite = [CCSprite spriteWithFile:@"go.png"];
    goStartSprite.position = ccp(s.width/2,s.height/2);
    goStartSprite.opacity = 0;
    [self addChild:goStartSprite z:100 tag:34];
}

@end
