//
//  Game+Grenade.m
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Grenade.h"
#import "Fruit.h"
#import "Constants.h"
#import "LevelConfigs.h"

@implementation Game (Grenade)


-(void)grenadeActionUpdate:(ccTime)dt
{
    grenadeBOOL = NO;
    timerBomb += dt;
    
    if(timerBomb >= 0.15)
    {
        [self unschedule:@selector(grenadeActionUpdate:)];
        //bombSprite.opacity = 0;
        timerBomb = 0;
        [self closeGrenade];
        [self showPowerUps];
    }
    for(Fruit *fruit in fruitsArray) 
    {
        if(CGRectIntersectsRect([fruit boundingBox], [bombSprite boundingBox]))
        {   
            if([fruit getIndex]>=0 && [fruit getIndex]<=5)
            grenadeScoreInt = grenadeScoreInt+1;
            
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
            //[fruit setLife:0];
            [self didScore];
            //[[SimpleAudioEngine sharedEngine] playEffect:hitSound];
            [fruit explosionEffect];
            [fruitsArray removeObject:fruit];
            //[bombSprite removeFromParentAndCleanup:YES];
        }
    }
}

-(void)startGrenade
{
    bgBlack.opacity = 70;
    
    grenade = [CCSprite spriteWithFile:@"grenade.png"];
    grenade.position = ccp(s.width/2,s.height*2.0/10);
    [self addChild:grenade z:150];
    
    CCSequence *sequenceAction = [CCSequence actions:
                                  [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:1.15],                  
                                  [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:1.0],
                                  nil];
    CCRepeatForever *repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
    
    [grenade runAction:repeatAction];
    
    //// ЗАМЕДЛЕНИЕ ////////////////////
    timeBetweenFruits = 1.1f;
    
}

-(void)closeGrenade
{
    bgBlack.opacity = 0;
    //[bgBlack removeFromParentAndCleanup:YES];
    [grenade removeFromParentAndCleanup:YES];
    
    timeBetweenFruits = 0.5;
}


-(void)grenadeExplosion
{
    //------------------- EXPLOTION EFFECT ---------------------
    CCParticleExplosion *explosion = [CCParticleExplosion node];
    explosion.position = explosionPosition;
    explosion.texture = 
    [[CCTextureCache sharedTextureCache]addImage:@"bomb_particle.png"];
    //explosion.color = ccBLACK;
    //[explosion setStartColor:ccc3(255, 255, 255)];
    [explosion setDuration:0.05];
    [explosion setTotalParticles:400];
    [explosion setStartSize:1];
    [explosion setEndSize:0.5];
    ccColor4F startColor;
    startColor.r = 255.f;
    startColor.g = 255.f;
    startColor.b = 255.f;
    startColor.a = 1.f;
    
    ccColor4F endColor;
    endColor.r = 0.f;
    endColor.g = 0.f;
    endColor.b = 0.f;
    endColor.a = 1.f;
    
    [explosion setScale:1.1];
    
    [explosion setStartColor:startColor];
    [explosion setEndColor:endColor];
    
    [explosion setGravity:ccp(0,-50)];
    
    [explosion setSpeed:220];
    [explosion setLife:0.01];
    
    [self addChild:explosion z:100 tag:1];
    
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:1.0],
                     [CCCallFunc actionWithTarget:self selector:@selector(explosionDone)],
                     nil]];
}

-(void)explosionDone
{
    [self removeChildByTag:1 cleanup:YES];
    [self removeChildByTag:2 cleanup:YES];
    //[self removeFromParentAndCleanup:YES];
}

@end
