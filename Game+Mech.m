//
//  Game+Mech.m
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Mech.h"
#import "Constants.h"
#import "TouchTrailLayer.h"

@implementation Game (Mech)

#pragma mark < MECH METHODS >
-(void)setMoveSprite 
{
    moveSprite = [CCSprite node];
    moveSprite.textureRect = CGRectMake(0, 0, 7, 7);
    moveSprite.color = ccYELLOW;
    moveSprite.position = ccp(s.width+100,s.height+100);
    moveSprite.opacity = 0;
    [self addChild:moveSprite];
}

-(void)mechUpdate:(ccTime)dt
{
    timerMech -= dt;
    if(timerMech > 60)
    {
        timerMech = timerMech/60;
    }
    [mechLabel setString:[NSString stringWithFormat:@"%0.2f",timerMech]];
    if(timerMech <= 0.0)
    {
        [mechLabel setString:[NSString stringWithFormat:@"00.00"]];
        mechBOOL = NO;
        timerMech = 270;
        mechLabel.opacity = 0;
        
        [self closeMech];
        [self showPowerUps];
        [self powerUpsMoveBack];
    }
}

-(void)startMech
{
    bgBlack.opacity = 70;
    TouchTrailLayer *layer = [TouchTrailLayer node];
    [self addChild:layer z:100 tag:111];
    
    mechLeft = [CCSprite spriteWithFile:@"mech_left.png"];
    mechLeft.position = ccp(mechLeft.contentSize.width*3.0/10,s.height*1.5/10);
    mechLeft.scale = 0.9;
    [self addChild:mechLeft z:100 tag:10];
    
    mechRight = [CCSprite spriteWithFile:@"mech_right.png"];
    mechRight.position = ccp(s.width-mechLeft.contentSize.width*3/10,s.height*1.5/10);
    mechRight.scale = 0.9;
    [self addChild:mechRight z:110 tag:11];
    
    CCSequence *sequenceAction1 = [CCSequence actions:
                                   [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.9],                  
                                   [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.95],
                                   nil];
    CCSequence *sequenceAction11 = [CCSequence actions:
                                    [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.9],                  
                                    [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.95],
                                    nil];
    
    /*CCSequence *sequenceAction2 = [CCSequence actions:
     [CCMoveTo actionWithDuration:ANIM_TIME/2 position:ccp(35,65)],                  
     [CCMoveTo actionWithDuration:ANIM_TIME/2  position:ccp(25,55)],
     nil];*/
    
    CCSequence *sequenceAction2 = [CCSequence actions:
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2 position:ccp(mechLeft.position.x-5,mechLeft.position.y-5)],                  
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2  position:ccp(mechLeft.position.x+5,mechLeft.position.y+5)],
                                   nil];
    
    CCSequence *sequenceAction3 = [CCSequence actions:
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2 position:ccp(mechRight.position.x+5,mechLeft.position.y-5)],                  
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2  position:ccp(mechRight.position.x-5,mechLeft.position.y+5)],
                                   nil];
    
    CCSpawn *spawnAction = [CCSpawn actions:sequenceAction1,sequenceAction2, nil];
    CCSpawn *spawnAction2 = [CCSpawn actions:sequenceAction11,sequenceAction3, nil];
    CCRepeatForever *repeatAction = [CCRepeatForever actionWithAction:spawnAction];
    CCRepeatForever *repeatAction2 = [CCRepeatForever actionWithAction:spawnAction2];
    
    [mechLeft runAction:repeatAction];
    [mechRight runAction:repeatAction2];
}

-(void)closeMech
{
    bgBlack.opacity = 0;
    
    [mechLeft removeFromParentAndCleanup:YES];
    [mechRight removeFromParentAndCleanup:YES];
    [self removeChildByTag:111 cleanup:YES];
    
    [self unschedule:@selector(mechUpdate:)];
}


@end
