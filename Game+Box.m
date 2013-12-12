//
//  Game+Box.m
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Box.h"
#import "Fruit.h"
#import "Constants.h"
#import "LevelConfigs.h"

@implementation Game (Box)

-(void)startBox
{
    bgBlack.opacity = 70;
    timeBetweenFruits = 1.0f;
    
    gloveLeft = [CCSprite spriteWithFile:@"box_left.png"];
    gloveLeft.position = ccp(gloveLeft.contentSize.width/2,s.height*0.8/10);
    gloveLeft.scale = 0.82;
    [self addChild:gloveLeft z:100 tag:10];
    
    gloveRight = [CCSprite spriteWithFile:@"box_right.png"];
    gloveRight.position = ccp(s.width-gloveLeft.contentSize.width/2,s.height*0.8/10);
    gloveRight.scale = 0.82;
    [self addChild:gloveRight z:110 tag:11];
    
    CCSequence *sequenceAction1 = [CCSequence actions:
                                   [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.85],                  
                                   [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.95],
                                   nil];
    CCSequence *sequenceAction11 = [CCSequence actions:
                                    [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.85],                  
                                    [CCScaleTo actionWithDuration:ANIM_TIME/2  scale:0.95],
                                    nil];
    
    CCSequence *sequenceAction2 = [CCSequence actions:
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2 position:ccp(gloveLeft.position.x-5,gloveLeft.position.y-5)],                  
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2  position:ccp(gloveLeft.position.x+5,gloveLeft.position.y+5)],
                                   nil];
    
    CCSequence *sequenceAction3 = [CCSequence actions:
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2 position:ccp(gloveRight.position.x+5,gloveLeft.position.y-5)],                  
                                   [CCMoveTo actionWithDuration:ANIM_TIME/2  position:ccp(gloveRight.position.x-5,gloveLeft.position.y+5)],
                                   nil];
    
    CCSpawn *spawnAction = [CCSpawn actions:sequenceAction1,sequenceAction2, nil];
    CCSpawn *spawnAction2 = [CCSpawn actions:sequenceAction11,sequenceAction3, nil];
    CCRepeatForever *repeatAction = [CCRepeatForever actionWithAction:spawnAction];
    CCRepeatForever *repeatAction2 = [CCRepeatForever actionWithAction:spawnAction2];
    
    [gloveLeft runAction:repeatAction];
    [gloveRight runAction:repeatAction2];
}

-(void)closeBox
{
    bgBlack.opacity = 0;
    
    [gloveLeft removeFromParentAndCleanup:YES];
    [gloveRight removeFromParentAndCleanup:YES];
}

-(void)boxKick:(ccTime)dt
{
    timerBox -= dt;
    kickTimerFloat +=dt;
    
    if(kickTimerFloat <= 0.15){
        kickEnableBOOL = NO;
    }
    else {
        kickEnableBOOL = YES;
    }
    //[gloveLeft stopAllActions];
    if(timerBox > 60)
    {
        timerBox = timerBox/60;
        //indexBomb++;
        //[timerLabel setString:[NSString stringWithFormat:@"%i.0%0.2f",index,timerDisplay]];
    }
    
    [boxLabel setString:[NSString stringWithFormat:@"%0i%0.2f",indexBomb,timerBox]];
    
    if(timerBox <= 0.0)
    {
        [self showPowerUps];
        [self powerUpsMoveBack];
        [self unschedule:@selector(boxKick:)];
        [boxLabel setString:[NSString stringWithFormat:@"00.00"]];
        boxBOOL = NO;
        //bombSprite.opacity = 0;
        
        timerBox = 330;
        [self closeBox];
        boxLabel.opacity = 0;
    }
    
    // gloveLeft =
    for(Fruit *fruit in fruitsArray) 
    {
        if(CGRectContainsPoint([fruit boundingBox], boxPosition))
        {
            if([fruit getIndex]>=0 && [fruit getIndex]<=5)
                boxScoreInt = boxScoreInt + 1;
            
            if([fruit getIndex] == 0){vesaFloat = vesaFloat - vesMalina;}
            else if([fruit getIndex] == 1){vesaFloat = vesaFloat - vesYagoda;}
            else if([fruit getIndex] == 2){vesaFloat = vesaFloat - vesVishenka;}
            else if([fruit getIndex] == 3){vesaFloat = vesaFloat - vesLemon;}
            else if([fruit getIndex] == 4){vesaFloat = vesaFloat - vesPomidor;}
            else if([fruit getIndex] == 5){vesaFloat = vesaFloat - vesAnanas;}
            
            if(vesaFloat < 0){
                vesaFloat=0;
            }
            
            
            CCLOG(@"!!!! KICK KICK !!!!");
            [fruit wasPowerUpTapped];
            
            //[fruit setLife:0];
            [self didScore];
            //[[SimpleAudioEngine sharedEngine] playEffect:hitSound];
            [fruit explosionEffect];
            [fruitsArray removeObject:fruit];
            
            boxPosition = ccp(-10,-10);
            
            //[bombSprite removeFromParentAndCleanup:YES];
        }
    }
}



@end
