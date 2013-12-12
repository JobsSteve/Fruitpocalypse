//
//  Game+Boomerang.m
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Boomerang.h"
#import "Constants.h"
#import "Fruit.h"
#import "LevelConfigs.h"

@implementation Game (Boomerang)

#pragma mark < BOOMERANG METHODS >
-(void)startBoomerang
{
    bgBlack.opacity = 70;
    
    boomerang = [CCSprite spriteWithFile:@"boomerang.png"];
    boomerang.anchorPoint = ccp(0.5,0.6);
    boomerang.position = ccp(s.width/2,s.height*1.0/10);
    boomerang.scale = 0.9;
    [self addChild:boomerang z:100 tag:10];
    
    CCSequence *sequenceAction1 = [CCSequence actions:
                                   [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:1.0],                  
                                   [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:1.0],
                                   nil];
    
    CCSequence *sequenceAction11 = [CCSequence actions:
                                    [CCRotateBy actionWithDuration:ANIM_TIME/2 angle:160],                  
                                    [CCRotateBy actionWithDuration:ANIM_TIME/2 angle:160],  
                                    nil]; 
    
    CCSpawn *spawnAction = [CCSpawn actions:sequenceAction11, nil];
    CCRepeatForever *repeatAction = [CCRepeatForever actionWithAction:spawnAction];
    
    [boomerang runAction:repeatAction];
    
}

-(void)closeBoomerang
{
    //[boomerang stopAllActions];
    bgBlack.opacity = 0;
    
    [self unschedule:@selector(boomerangUpdate:)];
    
    //[boomerang removeFromParentAndCleanup:YES];
    [self removeChildByTag:10 cleanup:YES];
    
    [self showPowerUps];
    [self powerUpsMoveBack];
}

-(void)boomerangKick
{
    boomerangBOOL = NO;
    [self disableTouch];
    bgBlack.opacity=0;
    
    //CCSprite boomeran = [];    
    boomerang.scale = 0.8;
    [boomerang stopAllActions];
    
    [boomerang runAction:[CCSequence actions:
                          //[CCRotateTo actionWithDuration:3 angle:180],
                          [CCCallFunc actionWithTarget:self selector:@selector(bezierAction2)],
                          [CCDelayTime actionWithDuration:2.3],
                          //[CCCallFunc actionWithTarget:self selector:@selector(stopBoomerangAction)],
                          [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                          [CCCallFunc actionWithTarget:self selector:@selector(closeBoomerang)],
                          nil]];
    
    [boomerang runAction:[CCRepeatForever actionWithAction:
                          [CCRotateBy actionWithDuration:0.3 angle:360]]];
    
    [self schedule:@selector(boomerangUpdate:)];
}

-(void)bezierAction2
{
    ccBezierConfig bezier2;
    bezier2.controlPoint_1 = ccp(-350,560);
    bezier2.controlPoint_2 = ccp(+350,560);
    
    bezier2.endPosition = ccp(0,10);
    
    id bezierForward = [CCBezierBy actionWithDuration:2.2 bezier:bezier2];
    
    [boomerang runAction:bezierForward];
    
}

-(void)stopBoomerangAction
{
    [self unschedule:@selector(boomerangUpdate:)];
    //boomerang.opacity = 0;
    [boomerang stopAllActions];
    //[self unschedule:@selector(step:)];
    //[breadcrumbs removeFromParentAndCleanup:YES];
    [boomerang removeFromParentAndCleanup:YES];
}

-(void)boomerangUpdate:(ccTime)dt
{
    timerBoomerang -= dt;
    
    if(timerBoomerang > 60)
    {
        timerBoomerang = timerBoomerang/60;
        //indexBomb++;
        //[timerLabel setString:[NSString stringWithFormat:@"%i.0%0.2f",index,timerDisplay]];
    }
    //[boomerangLabel setString:[NSString stringWithFormat:@"%0i%0.2f",indexBoomerang,timerBoomerang]];
    
    if(timerBoomerang <= 0.0)
    {
        timerBoomerang = 200;
        //boomerangLabel.opacity = 0;
    }
    
    for(Fruit *fruit in fruitsArray) 
    {
        if(CGRectIntersectsRect([boomerang boundingBox], [fruit boundingBox]))
        {
            CCLOG(@"!!!!!BOOOOOOM!!!!!");
            CCLOG(@"!!!! KICK KICK !!!!");
            if([fruit getIndex]>=0 && [fruit getIndex]<=5)
                boomerangScoreInt = boomerangScoreInt +1;
            
            if([fruit getIndex] == 0){vesaFloat = vesaFloat - vesMalina;}
            else if([fruit getIndex] == 1){vesaFloat = vesaFloat - vesYagoda;}
            else if([fruit getIndex] == 2){vesaFloat = vesaFloat - vesVishenka;}
            else if([fruit getIndex] == 3){vesaFloat = vesaFloat - vesLemon;}
            else if([fruit getIndex] == 4){vesaFloat = vesaFloat - vesPomidor;}
            else if([fruit getIndex] == 5){vesaFloat = vesaFloat - vesAnanas;}
            
            if(vesaFloat < 0){
                vesaFloat=0;
            }
            
            [fruit wasPowerUpTapped];
            [self didScore];
            //[[SimpleAudioEngine sharedEngine] playEffect:hitSound];
            [fruit explosionEffect];
            [fruitsArray removeObject:fruit];
        }
    }
}


@end
