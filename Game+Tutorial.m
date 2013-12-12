//
//  Game+Tutorial.m
//  Touch_Project
//
//  Created by Артур on 01.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Tutorial.h"
#import "Fruit.h"
#import "Game.h"

#pragma mark < TUTORIAL LEVEL >

@implementation Game (Tutorial)

-(void)setTutorLevel
{
    levelTimerFloat = 300602; 
    
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:0.9f],
                     //[CCCallFunc actionWithTarget:self selector:@selector(setLevelDifficulty)],
                     [CCCallFunc actionWithTarget:self  selector:@selector(chooseTutorFruit)],                 
                     nil]];
    
}

/*-(void)startTutorLevel
{
    CCAction *sequenceAction = [CCSequence actions:
                                //[CCDelayTime actionWithDuration:timeBetweenFruits],
                                [CCCallFunc actionWithTarget:self selector:@selector(chooseTutorFruit)],
                                nil];
    //CCAction *repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
    //repeatAction.tag = 301;
    [self runAction: sequenceAction];
}*/

-(void)tutorTimer:(ccTime)dt
{
    if(STEP == 1 && STEP1BOOL == YES && [fruitsArray count] == 0)
    {
        [self removeTapTheFruits];
        STEP1BOOL = NO;
        STEP = 2;
        [self chooseTutorFruit];
    }
    if(STEP == 2 && STEP2BOOL == YES && [fruitsArray count] == 0)
    {
        STEP2BOOL = NO;
        STEP = 3;
        [self chooseTutorFruit];
    }
    if(STEP == 3 && STEP3BOOL == YES && [fruitsArray count] == 0)
    {
        STEP3BOOL = NO;
        [self remove123Life];
        STEP = 4;
        [self chooseTutorFruit];
    }
    if(STEP == 4 && STEP4BOOL == YES && [fruitsArray count] == 0)
    {
        STEP4BOOL = NO;
        //[self remove123Life];
        [self removeCollectCoins];
        STEP = 5;
        [self chooseTutorFruit];
    }
    if(STEP == 5 && STEP5BOOL == YES && [fruitsArray count] == 0)
    {
        STEP5BOOL = NO;
        STEP = 6;
        [self chooseTutorFruit];
    }
    if(STEP == 6 && STEP6BOOL == YES && [fruitsArray count] == 0)
    {
        STEP6BOOL = NO;
        STEP = 7;
        [self chooseTutorFruit];
    }
    if(STEP == 7 && STEP7BOOL == YES && [fruitsArray count] == 0)
    {
        STEP7BOOL = NO;
        STEP = 8;
        [self chooseTutorFruit];
    }
    if(STEP == 8 && STEP8BOOL == YES && [fruitsArray count] == 0)
    {
        STEP8BOOL = NO;
        STEP = 9;
        [self chooseTutorFruit];
    }
    
    if(STEP == 12 && STEP12BOOL == YES && [fruitsArray count] == 0)
    {
        STEP12BOOL = NO;
        STEP = 12;
        [self chooseTutorFruit];
        STEP = 13;
    }
    if(STEP == 13 && STEP13BOOL == YES && [fruitsArray count] == 0)
    {
        STEP13BOOL = NO;
        STEP = 13;
        [self chooseTutorFruit];
        STEP9BOOL = NO;
        STEP10BOOL = NO;
        STEP11BOOL = NO;
    }
    
    
}

-(void)chooseTutorFruit
{
    if(STEP == 1)
    {
        // i = 0;
        //int index = 1; //yagoda.png
        timeBetweenFruits = 0.6;
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setIndex_0)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setIndex_1)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setIndex_2)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setTapTheFruits)],
                         //[CCDelayTime actionWithDuration:timeBetweenFruits*3],
                         //[CCCallFunc actionWithTarget:self selector:@selector(removeTapTheFruits)],
                         nil]];
    }
    else if(STEP == 2)
    {
        timeBetweenFruits = 0.6;
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         /*[CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                          [CCDelayTime actionWithDuration:timeBetweenFruits],
                          [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                          [CCDelayTime actionWithDuration:timeBetweenFruits],
                          [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                          [CCDelayTime actionWithDuration:timeBetweenFruits],
                          [CCCallFunc actionWithTarget:self selector:@selector(chooseStepFruit)],
                          [CCDelayTime actionWithDuration:timeBetweenFruits],*/
                         //[CCCallFunc actionWithTarget:self selector:@selector(stepIteration)],
                         //[CCCallFunc actionWithTarget:self selector:@selector(startIteration)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep2Bool)],
                         nil]];
        
    }
    else if(STEP == 3)
    {
        CCLOG(@"STEP3!!! STEP3!!! STEP3!!! STEP3!!!");
        timeBetweenFruits = 0.6;
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setVishnya)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setPomidor)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setAnanas)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(set1Life)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(set2Life)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(set3Life)],
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep3Bool)],
                         //[CCCallFunc actionWithTarget:self selector:@selector(remove123Life)],
                         nil]];
    }
    else if(STEP == 4)
    {
        timeBetweenFruits = 0.4;
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setMoneta_1)],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopFruitAllActions)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setMoneta_2)],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopFruitAllActions)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setMoneta_3)],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopFruitAllActions)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         //[CCCallFunc actionWithTarget:self selector:@selector(stopFruitAllActions)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setCollectCoins)], //tag:505
                         //[CCCallFunc actionWithTarget:self selector:@selector(removeCollectCoins)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep4Bool)],
                         nil]];
    }
    else if(STEP == 5)
    {
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setBudilnik_1)],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopBudilnikActions)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         //[CCCallFunc actionWithTarget:self selector:@selector(stopFruitAllActions)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setTimerBomb)], //tag:505
                         //[CCCallFunc actionWithTarget:self selector:@selector(removeCollectCoins)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep5Bool)],
                         //[CCDelayTime actionWithDuration:timeBetweenFruits],
                         //[CCCallFunc actionWithTarget:self selector:@selector(startBudilnikActions)],
                         nil]];
    }
    else if(STEP == 6)
    {
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         //[CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setBlockYourActions)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits*4],
                         [CCCallFunc actionWithTarget:self selector:@selector(removeBlockYourActions)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep6Bool)],
                         nil]];
    }
    else if(STEP == 7)
    {
        timeBetweenFruits = 0.6;
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setGrenade_1)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setTakeIt)],
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopPowerUpActions)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep7Bool)],
                         nil]];
    }
    else if(STEP == 8)
    {
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         //[CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(removeTakeIt)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep8Bool)],
                         nil]];
    }
    else if(STEP == 9)
    {
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         //[CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setChoosePowerUp)],
                         //[CCCallFunc actionWithTarget:self selector:@selector(setTapToUse)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep9Bool)],
                         nil]];
    }
    else if(STEP == 10)
    { 
        CCLOG(@"STEP10 !!!!");
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         //[CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setYagoda)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setPomidor)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setLemon)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setTapToUse)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits/2],
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep11Bool)], // на 1 выше стало
                         nil]];
    }
    else if(STEP == 11)
    { 
        CCLOG(@"STEP11 !!!!");
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         //[CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits*2],
                         [CCCallFunc actionWithTarget:self selector:@selector(removeTapToUse)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep12Bool)], // на 1 выше стало
                         nil]];
    }
    else if(STEP == 12)
    {  
        timeBetweenFruits = 0.25; // 0.3 потому-что powerups становятся большими
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(disableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setGifts)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(setBonus_1)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopPowerUpActions)],
                         
                         [CCCallFunc actionWithTarget:self selector:@selector(setBonus_2)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopPowerUpActions)],
                         
                         [CCCallFunc actionWithTarget:self selector:@selector(setBonus_3)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopPowerUpActions)],
                         
                         [CCCallFunc actionWithTarget:self selector:@selector(enableTouch)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setStep13Bool)], // на 1 выше стало
                         nil]];
    }
    else if(STEP == 13)
    {
        timeBetweenFruits = 0.5;
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(removeGifts)],
                         [CCDelayTime actionWithDuration:timeBetweenFruits],
                         [CCCallFunc actionWithTarget:self selector:@selector(levelIteration)],
                         [CCCallFunc actionWithTarget:self selector:@selector(startGame)],
                         [CCCallFunc actionWithTarget:self selector:@selector(setUserDefaults)],
                         [CCCallFunc actionWithTarget:self selector:@selector(restartGameScene)],
                         nil]];
    }
}
-(void)levelIteration{
    LEVELNUMBER = LEVELNUMBER + 1;
}

-(void)restartGameScene{
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1.5f scene:[Game node] withColor:ccBLACK]];
}


-(void)setBonus_1 //GRENADE
{
    i = 6;     
    xInt = 113;
    yInt = 278;
    [self addFruitCentering];
}
-(void)setBonus_2 //BOX
{
    i = 7;     
    xInt = 210;
    yInt = 247;
    [self addFruitCentering];
}
-(void)setBonus_3 //MECH
{
    i = 8;     
    xInt = 140;
    yInt = 180;
    [self addFruitCentering];
}
-(void)setGrenade_1 //GRENADE
{
    i = 6;     
    xInt = 150;
    yInt = 260;
    [self addFruitCentering]; 
}
-(void)setBudilnik_1  //BUDILNIK
{
    i = 13;    
    xInt = 200;
    yInt = 260;
    [self addFruitCentering]; 
}

-(void)setVishnya //VISHNYA
{ 
    i = 0;     
    xInt = 120;
    yInt = 300;
    [self addFruitCentering];
}
-(void)setYagoda //YAGODA
{
    i = 1;        
    xInt = 120;
    yInt = 300;
    [self addFruitCentering];
}
-(void)setPomidor  //POMIDOR
{
    i = 4;   
    xInt = 200;
    yInt = 240;
    [self addFruitCentering]; 
}
-(void)setAnanas  //ANANAS
{
    i = 5;        
    xInt = 100;
    yInt = 200;
    [self addFruitCentering];
}
-(void)setLemon  //LEMON
{
    i = 3;    
    xInt = 100;
    yInt = 210;
    [self addFruitCentering];
}

-(void)stopFruitAllActions
{
    for(Fruit *fruit in fruitsArray)
    {
        [fruit unschedule:@selector(monetaStart:)];
    }
}


-(void)stopBudilnikActions
{
    for(Fruit *fruit in fruitsArray)
    {
        [fruit unschedule:@selector(budilnikStart:)];
    }
}
-(void)stopPowerUpActions
{
    for(Fruit *fruit in fruitsArray)
    {
        [fruit unschedule:@selector(bonusStart:)];
    }
}
-(void)startBudilnikActions
{
    for(Fruit *fruit in fruitsArray)
    {
        [fruit schedule:@selector(budilnikStart:)];
    }
}
-(void)startPowerUpActions
{
    for(Fruit *fruit in fruitsArray)
    {
        [fruit schedule:@selector(bonusStart:)];
    }
}

-(void)setMoneta_1//Monetka_1
{
    i = 12;     
    xInt = 125;
    yInt = 280;
    [self addFruitCentering]; 
}
-(void)setMoneta_2//Monetka_3
{
    i = 11;     
    xInt = 170;
    yInt = 230;
    [self addFruitCentering];
}
-(void)setMoneta_3 //Monetka_5
{
    i = 10;    
    xInt = 100;
    yInt = 210;
    [self addFruitCentering];
}

//ТЕКСТЫ тутора

-(void)setTapTheFruits
{
    CCSprite *tapFruits = [CCSprite spriteWithFile:@"tapthefruits.png"];
    tapFruits.position = ccp(s.width*0.50,s.height*0.77);
    [self addChild:tapFruits z:1000 tag:501];
    STEP1BOOL = YES;
    [self schedule:@selector(tutorTimer:)]; // ВКЛЮЧАЕМ tutorTimer:
}
-(void)setCollectCoins
{
    CCSprite *collectCoins = [CCSprite spriteWithFile:@"collectcoins.png"];
    collectCoins.position = ccp(s.width*0.5,s.height*0.77);
    [self addChild:collectCoins z:1000 tag:505];
    //STEP3BOOL = YES; 
}
-(void)set1Life
{
    CCSprite *life1 = [CCSprite spriteWithFile:@"1life2.png"];
    life1.position = ccp(s.width*0.2,s.height*0.77);
    [self addChild:life1 z:1000 tag:502];
    //STEP3BOOL = YES; 
}
-(void)set2Life
{
    CCSprite *life2 = [CCSprite spriteWithFile:@"2life.png"];
    life2.position = ccp(s.width*0.75,s.height*0.70);
    [self addChild:life2 z:1000 tag:503];
    //STEP3BOOL = YES; 
}
-(void)set3Life
{
    CCSprite *life3 = [CCSprite spriteWithFile:@"3life2.png"];
    life3.position = ccp(s.width*0.1,s.height*0.50);
    [self addChild:life3 z:1000 tag:504];
    //STEP3BOOL = YES; 
}
-(void)setTimerBomb
{
    CCSprite *timerBomb = [CCSprite spriteWithFile:@"timerbomb.png"];
    timerBomb.position = ccp(s.width*0.5,s.height*0.70);
    [self addChild:timerBomb z:1000 tag:506];
    //STEP3BOOL = YES; 
}
-(void)setBlockYourActions
{
    CCSprite *blockYourAction = [CCSprite spriteWithFile:@"blockyouraction.png"];
    blockYourAction.position = ccp(s.width*0.60,s.height*0.35);
    [self addChild:blockYourAction z:1000 tag:507];
    //STEP3BOOL = YES; 
}
-(void)setTakeIt
{
    CCSprite *takeit = [CCSprite spriteWithFile:@"takeit.png"];
    takeit.position = ccp(s.width*0.38,s.height*0.73);
    [self addChild:takeit z:1000 tag:508];
}
-(void)setChoosePowerUp
{
    CCSprite *choosePowerUp = [CCSprite spriteWithFile:@"choosepowerup.png"];
    choosePowerUp.position = ccp(s.width*0.18,s.height*0.33);
    [self addChild:choosePowerUp z:1000 tag:509];
}
-(void)setTapToUse
{
    CCSprite *tapToUse = [CCSprite spriteWithFile:@"taptouse.png"];
    tapToUse.position = ccp(s.width*0.25,s.height*0.75);
    [self addChild:tapToUse z:1000 tag:510];
}
-(void)setGifts
{
    CCSprite *gifts = [CCSprite spriteWithFile:@"gifts.png"];
    gifts.position = ccp(s.width*0.48,s.height*0.77);
    [self addChild:gifts z:1000 tag:511];
}
-(void)stepIteration
{
    STEP = STEP + 1;
}
-(void)startTutorTimer
{
    [self schedule:@selector(tutorTimer:)];
}
-(void)stopTutorTimer
{
    [self unschedule:@selector(tutorTimer:)];
}

-(void)chooseStepFruit
{
    if(STEP == 2)
    {
        if(count == 1)
        {
            //i  = CCRANDOM_0_1()*3;
            i = 1; //yagoda
            xInt = 150;
            yInt = 280;
            [self addFruitCentering];
            //[self addFruitStep];
            count = count + 1;
        }
        else if(count == 2)
        {
            i = 0; //vishnya
            xInt = 190;
            yInt = 180;
            [self addFruitCentering];
            count = count + 1;
        }
        else if(count == 3)
        {
            i = 2;  //malina
            xInt = 110;
            yInt = 220;
            [self addFruitCentering];
            count = count + 1;
        }
        else if(count == 4)
        {
            i = 0;  //
            xInt = 220;
            yInt = 340;
            [self addFruitCentering];
            count = count + 1;
        }
        else if(count == 5)
        {
            i = 1;  //vishnya
            xInt = 90;
            yInt = 330;
            [self addFruitCentering];
            count = count + 1;
        }
        else if(count == 6)
        {
            i = 2;  //vishnya
            xInt = 240;
            yInt = 237;
            [self addFruitCentering];
            count = count + 1;
        }
    }
}

-(void)setStep2Bool{
    STEP2BOOL = YES;
}
-(void)setStep3Bool{
    STEP3BOOL = YES;
}
-(void)setStep4Bool{
    STEP4BOOL = YES;
}
-(void)setStep5Bool{
    STEP5BOOL = YES;
}
-(void)setStep6Bool{
    STEP6BOOL = YES;
}
-(void)setStep7Bool{
    STEP7BOOL = YES;
}
-(void)setStep8Bool{
    STEP8BOOL = YES;
}
-(void)setStep9Bool{
    STEP9BOOL = YES;
}
-(void)setStep10Bool{
    STEP10BOOL = YES;
}
-(void)setStep11Bool{
    STEP11BOOL = YES;
}
-(void)setStep12Bool{
    STEP12BOOL = YES;
}
-(void)setStep13Bool{
    STEP13BOOL = YES;
}



-(void)removeTapTheFruits
{
    [self removeChildByTag:501 cleanup:YES];
    //[self unschedule:@selector(tutorTimer:)];
}
-(void)remove123Life
{
    [self removeChildByTag:502 cleanup:YES];
    [self removeChildByTag:503 cleanup:YES];
    [self removeChildByTag:504 cleanup:YES];
}
-(void)removeCollectCoins
{
    [self removeChildByTag:505 cleanup:YES];
}
-(void)removeTimerBomb
{
    [self removeChildByTag:506 cleanup:YES];
}
-(void)removeBlockYourActions
{
    [self removeChildByTag:507 cleanup:YES];
}
-(void)removeTakeIt
{
    [self removeChildByTag:508 cleanup:YES];
}
-(void)removeChoosePowerUp
{
    [self removeChildByTag:509 cleanup:YES];
}
-(void)removeTapToUse
{
    [self removeChildByTag:510 cleanup:YES];
}
-(void)removeGifts
{
    [self removeChildByTag:511 cleanup:YES];
    [self unschedule:@selector(tutorTimer:)];
    TUTORBOOL = YES;
}

-(void)setIndex_0{
    i = 0;
    xInt = 120;
    yInt = 280;
    [self addFruitCentering];
}
-(void)setIndex_1{
    i = 1;
    xInt = 200;
    yInt = 240;
    [self addFruitCentering];
}
-(void)setIndex_2{
    i = 2;
    xInt = 140;
    yInt = 200;
    [self addFruitCentering];
}
-(void)addFruitCentering//:(int)index // c ЦЕНТРИРОВАНИЕМ
{
    fruitTypes = [NSArray arrayWithObjects:@"vishenka.png",@"yagoda.png",@"malina.png",@"lemon.png",@"pomidor.png",@"ananas.png",@"grenade.png",@"box_left.png",@"mech_left.png",@"boomerang.png",@"moneta_small.png",@"moneta_middle.png",@"moneta_big.png", @"budilnik_small.png",@"budilnik_middle.png",@"budilnik_big.png",nil];
    
    int flipInt = CCRANDOM_0_1()*2; /// ПОВОРОТ ВЛЕВО/ВПРАВО
    
    //i = index; // ПРИСВАИВАЕМ НОМЕР ЭКРАНА
    ////////////// ВЫБИРАЕМ 
    NSString *image = [fruitTypes objectAtIndex:i];
    Fruit *fruit =  [Fruit spriteWithFile:image];
    
    //xInt = CCRANDOM_0_1()*120 + 100;
    //yInt = CCRANDOM_0_1()*150 + 175; 
    
    fruit.position = ccp(xInt,yInt);
    fruit.opacity=0;
    
    for(Fruit *fruit1 in fruitsArray)
    {
        fruit1.scale = 0.7;
        fruit.scale = 0.7;
        if(CGRectIntersectsRect([fruit1 boundingBox], [fruit boundingBox] ) == YES)
        {
            CCLOG(@"CENTERING COLLISION !!!!!!!");
            NUM = NUM + 1;
            if(NUM >= 500 && gameOverBOOL == NO)
            {
                CCLOG(@"ADD FRUIT %d",NUM);
                gameoverBOOL = YES;
                [self statsGame];
            }
            [self addFruitCentering];
            collisionBOOL = YES;
            return;
        }
        else
        {
            collisionBOOL = NO;
            //continue;
        }
        fruit1.scale = 1.0;
        fruit.scale = 1.0;
        
    }// ЦИКЛ: СТОЛКНОВЕНИЯ
    
    NUM = 0;
    //i++;
    [fruitsArray addObject:fruit];
    int countFruits = [fruitsArray count];
    if (countFruits > 20 && gameoverBOOL == NO) 
    {
        gameoverBOOL = YES;
        //[self gameOver];
        [self statsGame];
    }
    [self addChild:fruit];
    [fruit startWithType:i];
    [fruit displayLifes];
    fruitsInt = fruitsInt + 1;  // СКОЛЬКО ВЫВАЛИЛОСЬ ФРУКТОВ
} 

-(void)addFruitStep
{
    fruitTypes = [NSArray arrayWithObjects:@"vishenka.png",@"yagoda.png",@"malina.png",@"lemon.png",@"pomidor.png",@"ananas.png",@"grenade.png",@"box_left.png",@"mech_left.png",@"boomerang.png",@"moneta_small.png",@"moneta_middle.png",@"moneta_big.png", @"budilnik_small.png",@"budilnik_middle.png",@"budilnik_big.png",nil];
    
    //int flipInt = CCRANDOM_0_1()*2; /// ПОВОРОТ ВЛЕВО/ВПРАВО
    
    ////////////// ВЫБИРАЕМ     
    NSString *image = [fruitTypes objectAtIndex:i];
    Fruit *fruit =  [Fruit spriteWithFile:image];
    
    xInt = CCRANDOM_0_1()*260 + 30;
    yInt = CCRANDOM_0_1()*400 + 40;
    
    fruit.position = ccp(xInt,yInt);
    
    fruit.opacity=0;
    
    if(i == 5){
        fruit.scale = 2.5;
    }else{
        fruit.scale = 0.6;
    }
    
    if(fruit.position.x < 20.0f){
        fruit.position = ccp(fruit.contentSize.width/2,fruit.position.y);
    }
    else if(fruit.position.x > 320){
        fruit.position = ccp(s.width-fruit.contentSize.width/2,fruit.position.y);
    }
    else  if(fruit.position.y < 135.0f){
        fruit.position = ccp(fruit.position.x,115+fruit.contentSize.height/2);
    }
    else  if(fruit.position.y > 415.0f){
        fruit.position = ccp(fruit.position.x,420-fruit.contentSize.height/2);
    }
    
    for(Fruit *fruit1 in fruitsArray)
    {
        fruit1.scale = 0.7;
        fruit.scale = 0.7;
        if(CGRectIntersectsRect([fruit1 boundingBox], [fruit boundingBox] ) == YES)
        {
            CCLOG(@"YES FRUITS COLLISION !!!!!!!");
            
            NUM = NUM + 1;
            if(NUM >= 500 && gameOverBOOL == NO)
            {
                CCLOG(@"ADD FRUIT %d",NUM);
                gameoverBOOL = YES;
                [self statsGame];
            }
            
            //[self chooseFruit];
            [self addFruitStep];
            
            return;
            collisionBOOL = YES;
        }
        else
        {
            collisionBOOL = NO;
        }
        fruit1.scale = 1.0;
        fruit.scale = 1.0;
        
    }// ЦИКЛ: СТОЛКНОВЕНИЯ
    
    NUM = 0;
    [fruitsArray addObject:fruit];
    int countFruits = [fruitsArray count];
    
    if (countFruits > 20 && gameoverBOOL == NO) 
    {
        gameoverBOOL = YES;
        //[self gameOver];
        [self statsGame];
    }
    
    [self addChild:fruit];
    [fruit startWithType:i];
    
    [fruit displayLifes];
    fruitsInt = fruitsInt + 1;  // СКОЛЬКО ВЫВАЛИЛОСЬ ФРУКТОВ
}









@end
