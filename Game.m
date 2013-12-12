//
//  Game.m
//  Touch_Project
//
//  Created by Артур on 04.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "AppDelegate.h"
#import "Fruit.h"

#import "SimpleAudioEngine.h"
#import "CCMenuPopup.h"
#import "PopUp.h"
#import "TouchTrailLayer.h"


#import "LevelConfigs.h"

@implementation Game

+(CCScene *)scene
{
	CCScene *scene = [CCScene node];
	Game *layer = [Game node];
	[scene addChild: layer];
	
	return scene;
}

- (void)dealloc{
    [super dealloc];
}

-(void)onEnterTransitionDidFinish
{
    [[CCTouchDispatcher sharedDispatcher] addStandardDelegate:self priority:0];
    //[[[CCDirector sharedDirector] openGLView] setMultipleTouchEnabled:YES];
    
    [self initializeGame];
} 

- (id)init
{
    if((self=[super init]))
    {
        delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [[CCDirector sharedDirector] resume];
        s = [[CCDirector sharedDirector] winSize];
        
        //levelTimerFloat = 3602;  //(302)->5sec (7202)->120sec (3600)->60sec
        //LEVELNUMBER = 100;   
        
        grenadeScoreInt = 0;   //КОЛИЧЕСТВО УБИТЫХ РАЗНЫМИ СУПЕРУДАРАМИ
        boxScoreInt = 0;
        mechScoreInt = 0;
        boomerangScoreInt = 0;
        kulakScoreInt = 0;
       
        timeBetweenFruits = 0.7f;
        gameoverBOOL = NO;
        index = 0;
        
        grenadeBOOL = NO;
        boxBOOL = NO;
        mechBOOL = NO;
        boomerangBOOL = NO;
        
        timerBox = 330;    ///  5.5 sec
        timerMech = 270;   ///  4.5 sec
        timerBoomerang = 200;  ///  3.33 sec 
        kickBOOL = YES;
        kickEnableBOOL = YES;
        
        fruitsInt = 1;
        
        bombBonusInt = 0;
        boxBonusInt = 0;
        mechBonusInt = 0;
        boomerangBonusInt = 0;
        
        bombBonusTake = 0;  //КОЛИЧЕСТВО ВЗЯТЫХ СУПЕРУДАРОВ
        boxBonusTake = 0;
        mechBonusTake = 0;
        boomerangBonusTake = 0;
        
        monetaCountInt = 0;
        monetaTakeInt = 0;
        
        timerIndicator = 0;
        NUM = 0;
        FRUITNUM = 0;
        STEP = 1;
        STEP1BOOL = NO;
        STEP2BOOL = NO;
        STEP3BOOL = NO;
        STEP4BOOL = NO;
        
        STEP9BOOL = NO;
        STEP12BOOL = NO;
        
        count = 1;
        
        TUTORBOOL = YES;
        
        planBOOL = NO;
        planA = YES;
        planB = NO;
        planC = NO;
        planD = NO;
        planE = NO;
        planF = NO;
        
        planDelay = NO;
        
        delayA = NO;
        
        vesaFloat = 0;
        
        alertBOOL=NO;
        //alertStopBOOL=NO;
        
        soundEnableBOOL=YES;
    }
    return self;
}

-(void)initializeGame
{
    fruitsArray = [[CCArray alloc] init];
    bonusArray = [[CCArray alloc] init];
    
    [self startGo];
    
    //[self setSounds];
    //[self startMusicTheme];
    
    [self setSecundomers];
   
    [self setGameplayIndicators];  // кол-во УБИТЫХ, на ЭКРАНЕ
    [self setBonusIndicators];  // кол-во СУПЕРУДАРОВ в СЛОТАХ
    
    [self setPauseButton];
    
    [self setLevelTimer];
    [self setLevelNumber];
    
    [self setPowerUps];
    [self setAdsBanner];
    [self blackForeground];
    [self boundaryBox];
    [self setMoveSprite];  ///КУБИК МЕЧА 4x4 px (для обнаружения столкновений с фруктами) 
    //[self schedule:@selector(levelTimerStart:)];
    //[self setGameoverLabel]; //надпись GAMEOVER
    //[self setStatsButton]; // надпись STATS
    //[self setStatsIndicators]; // убитых БОКСОМ, ГРАНАТОЙ и тд
    
    [self schedule:@selector(scoreUpdate:)]; // обновление ОЧКОВ
    
    /*[self levelTimerDelayAction];
   //или (goTimer:)//ПЕРЕКЛЮЧЕНИЕ после 30сек на СПЕЦ.АТАКУ
    [self setTimerUpdate]; //Начинаем отсчет с 1-го уровня
     */
    
    [self getUserDefaults]; //устанавливается НОМЕР УРОВНЯ
    
    //[self setTutorLevel];
    [self startGame];
    //[self schedule:@selector(Timer:)];
     [self levelAction];
    
     [self initializeSoundData];

}

-(void)getUserDefaults //берем из UserDefaults в ПЕРЕМЕННЫЕ
{
    //1 ВЫТАСКИВАЕМ значения из NSUserDefaults и присваиваем переменным
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    TOTALSCORE = [userDefaults integerForKey:@"scoreKey"];
    LEVELNUMBER = [userDefaults integerForKey:@"LEVELKEY"];
    
    if(TOTALSCORE > 0) //уже начинали ИГРУ
    {
        kulakScoreInt = [userDefaults integerForKey:@"kulakKey"];
        grenadeScoreInt = [userDefaults integerForKey:@"grenadeKey"];
        boxScoreInt = [userDefaults integerForKey:@"boxKey"];
        boomerangScoreInt = [userDefaults integerForKey:@"boomerangKey"];
        mechScoreInt = [userDefaults integerForKey:@"mechKey"];
    
        //КОЛИЧЕСТВО монеток и суперударов
        monetaTakeInt = [userDefaults integerForKey:@"monetasCountKey"];
        score = [userDefaults integerForKey:@"killCountKey"];
       
        bombBonusTake = [userDefaults integerForKey:@"grenadeCountKey"];
        boxBonusTake = [userDefaults integerForKey:@"boxCountKey"];
        boomerangBonusTake = [userDefaults integerForKey:@"boomerangCountKey"];
        mechBonusTake = [userDefaults integerForKey:@"mechCountKey"];
    
        isMusicOn = [userDefaults boolForKey:@"musicKey"];
        isSoundOn = [userDefaults boolForKey:@"soundKey"];
        
        LEVELNUMBER = [userDefaults integerForKey:@"LEVELKEY"];
        //monetasInt = [userDefaults integerForKey:@"monetasKey"];
    }
    [userDefaults synchronize];
    
    [self monetaCountAction];
}

-(void)setUserDefaults
{
    // Сохранить результаты в UserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setInteger:TOTALSCORE forKey:@"scoreKey"];
    
    [userDefaults setInteger:kulakScoreInt forKey:@"kulakKey"];
    [userDefaults setInteger:grenadeScoreInt forKey:@"grenadeKey"];
    [userDefaults setInteger:boxScoreInt forKey:@"boxKey"];
    [userDefaults setInteger:boomerangScoreInt forKey:@"boomerangKey"];
    [userDefaults setInteger:mechScoreInt forKey:@"mechKey"];
    
    [userDefaults setInteger:LEVELNUMBER forKey:@"LEVELKEY"];
    
    [userDefaults setInteger:monetaTakeInt forKey:@"monetasCountKey"];
    [userDefaults setInteger:score forKey:@"killCountKey"];
    
    [userDefaults setInteger:bombBonusTake forKey:@"grenadeCountKey"];
    [userDefaults setInteger:boxBonusTake forKey:@"boxCountKey"];
    [userDefaults setInteger:boomerangBonusTake forKey:@"boomerangCountKey"];
    [userDefaults setInteger:mechBonusTake forKey:@"mechCountKey"];
    
    [userDefaults setBool:isMusicOn forKey:@"musicKey"];
    [userDefaults setBool:isSoundOn forKey:@"soundKey"];
    
    [userDefaults synchronize];
}


-(void)scoreUpdate:(ccTime)dt
{
    /*//(КОЛИЧЕСТВО УБИТЫХ КУЛАК)
    [kulakScoreLabel setString:[NSString stringWithFormat:@"x%d",kulakScoreInt]];
    //(КОЛИЧЕСТВО УБИТЫХ ГРАНАТОЙ)
    [grenadeScoreLabel setString:[NSString stringWithFormat:@"x%d",grenadeScoreInt]];
    //(КОЛИЧЕСТВО УБИТЫХ БОКСОМ)
    [boxScoreLabel setString:[NSString stringWithFormat:@"x%d",boxScoreInt]];
    //(КОЛИЧЕСТВО УБИТЫХ МЕЧОМ)
    [mechScoreLabel setString:[NSString stringWithFormat:@"x%d",mechScoreInt]];
    //(КОЛИЧЕСТВО УБИТЫХ БУМЕРАНГОМ)
    [boomerangScoreLabel setString:[NSString stringWithFormat:@"x%d",boomerangScoreInt]];
   */
     
    //(НОМЕР УРОВНЯ)
    [levelNumberLabel setString:[NSString stringWithFormat:@"%d",LEVELNUMBER]];
    
    
    //СКОРОСТЬ ВОЛНЫ
    [speedTestLabel setString:[NSString stringWithFormat:@"%0.3f",timeBetweenFruits]];
    
    procent = 0.225; //1%
    procentileFloat = vesaFloat/0.225; //подсчитывается %
    //PROCENTILE (ПРОЦЕНТИЛЬ)
    [procentileLabel setString:[NSString stringWithFormat:@"%0.1f %%",procentileFloat]];
    
    
    /// COUNTLABEL
    countLabel.position = ccp(s.width*0.05,s.height*0.04); //(КОЛИЧЕСТВО ФРУКТОВ НА ЭКРАНЕ)
    //[countLabel setString:[NSString stringWithFormat:@"%d", [fruitsArray count]]];
    
    [countLabel setString:[NSString stringWithFormat:@"%f", vesaFloat]];
     
    [bombBonusLabel setString:[NSString stringWithFormat:@"%d",bombBonusTake]];
    bombBonusLabel.position = ccp(grenadePowerUp.position.x,grenadePowerUp.position.y);
    
    [boxBonusLabel setString:[NSString stringWithFormat:@"%d",boxBonusTake]];
    boxBonusLabel.position = ccp(box.position.x,box.position.y);
    
    [mechBonusLabel setString:[NSString stringWithFormat:@"%d",mechBonusTake]];
    mechBonusLabel.position = ccp(mechPowerUp.position.x,mechPowerUp.position.y);
    
    [boomerangBonusLabel setString:[NSString stringWithFormat:@"%d",boomerangBonusTake]];
    boomerangBonusLabel.position = ccp(boomerangPowerUp.position.x,boomerangPowerUp.position.y);
    
    
    [timerLabel setString:[NSString stringWithFormat:@"0%i.0%0.2f",index,timerDisplay]];
    
    if(timerDisplay > 60)
    {
        timerDisplay = timerDisplay/60;
        index++;
    }
    
    
    if(procentileFloat > 70 && alertBOOL==NO){
        [self redAlert];
        alertBOOL = YES;
        //alertStopBOOL = NO;
        [self schedule:@selector(alertMethod:)];
    }
    if(procentileFloat < 50 && alertStopBOOL==NO){
        [dangerSprite stopActionByTag:222];
        dangerSprite.opacity=0;
        alertBOOL = NO;
        alertStopBOOL=YES;
    }
    
    for(Fruit *fruit in fruitsArray)
    {
        if([fruit getBudilnikDone] == YES){
            [fruitsArray removeObject:fruit];
        }
        else if([fruit getMonetaDone] == YES){
            [fruitsArray removeObject:fruit];
        }
        else if([fruit getBonusDone] == YES){
            [fruitsArray removeObject:fruit];
        }
    }
}

-(void)alertMethod:(ccTime)dt
{
    alertTimer = alertTimer+dt;
    
    if(alertTimer> 2.0)
    {
        [self unschedule:@selector(alertMethod:)];
        alertStopBOOL=NO;
    }
}

-(void)startGame
{
    if(LEVELNUMBER == 0){
        [self setTutorLevel];
    }
    else if(LEVELNUMBER>=1){
        [self schedule:@selector(Timer:)]; //или (goTimer:)   //ПЕРЕКЛЮЧЕНИЕ после 30сек на СПЕЦ.АТАКУ
        [self setTimerUpdate]; //Начинаем отсчет с 1-го уровня
        [self levelTimerDelayAction];
    }
}


#pragma mark < LEVELDESIGN >

-(void)setTimerUpdate  //УСТАНАВЛИВАЕМ НА 1мин(3600мсек)(->Difficulty->TimerUpdate)
{
    //levelTimerFloat = 3602; //УСТАНАВЛИВАЕМ СЕКУНДОМЕР НА 5 СЕК
    //levelTimerFloat = 300;
    //[levelTimerLabel setString:[NSString stringWithString:@"01.00"]];
    [self runAction:[CCSequence actions:
                                [CCDelayTime actionWithDuration:0.9f],
                                [CCCallFunc actionWithTarget:self selector:@selector(setLevelDifficulty)],
                                [CCCallFunc actionWithTarget:self  selector:@selector(startTimerUpdate)],                 
                                nil]];
}


-(void)startTimerUpdate //АЛГОРИТМ ВЫБОРА ФРУКТА (Delay:timeBetweenFruits->chooseFruit)
{
    //[self schedule:@selector(Timer:)];
    
    CCAction *sequenceAction = [CCSequence actions:
                            [CCDelayTime actionWithDuration:timeBetweenFruits], //устанавливаем ПРОМЕЖУТОК ВРЕМЕНИ
                            [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                          
                            nil];
    
    CCAction *repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
    
    repeatAction.tag = 301;
    
    [self runAction: repeatAction];
}

-(void) Timer:(ccTime)dt /// (СУПЕРАТАКИ ПО УРОВНЯМ - РАСПРЕДЕЛЕНИЕ)
{
      timerIndicator += dt;
     // CCLOG(@"TIMERINDICATOR %f",timerIndicator);
  
    if(timerIndicator >= 16.25 && planA == YES) //10-20
    {
        planA = NO;
        planB = YES;
        [self stopActionByTag:301];
        //[self setLevelDifficulty ];
        [self setTimerUpdate];
    }
    if(timerIndicator >= (15+20.45) && planB == YES)//20-30
    {
        planB = NO;
        planC = YES;
        [self stopActionByTag:301];
        //[self setLevelDifficulty ];
        [self setTimerUpdate];
    }
    if(timerIndicator >= (16+19.5+20.45) && planC == YES)//30-40
    {
        planC = NO;
        planD = YES;
        [self stopActionByTag:301];
        //[self setLevelDifficulty ];
        [self setTimerUpdate];
    }
    if(timerIndicator >= (16+19.5+19.5+20.45) && planD == YES)//40-50
    {
        planD= NO;
        planE= YES;
        [self stopActionByTag:301];
        //[self setLevelDifficulty ];
        [self setTimerUpdate];
    }
    if(timerIndicator >= (16+19.5+19.5+19.5+20.45) && planE == YES)//50-60
    {
        planE= NO;
        planF= YES;
        [self stopActionByTag:301];
        //[self setLevelDifficulty ];
        [self setTimerUpdate];
    }

    
    
    
    /*////////////////// LEVEL 101 ////////////////////
        if(timerIndicator >= 40 && planBOOL == NO && LEVELNUMBER == 101)
        {
            planC = YES;
            //CCLOG(@"TIMER INSIDE!!! TIMER INSIDE!!! TIMER INSIDE!!!");
            [self stopActionByTag:301];
            CCAction *sequenceAction2 = [CCSequence actions:
                                        [CCDelayTime actionWithDuration:0.99],
                                        [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                        [CCDelayTime actionWithDuration:0.25],
                                        [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                        [CCDelayTime actionWithDuration:0.25],
                                        [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                        nil];
            CCAction *repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            repeatAction2.tag = 401;
            [self runAction: repeatAction2];
            planBOOL = YES;
        }
        ////////////////// LEVEL 102 ////////////////////
        if(timerIndicator >= 40 && planBOOL == NO && LEVELNUMBER == 102)
        {
            planC = YES;
           // CCLOG(@"TIMER INSIDE!!! TIMER INSIDE!!! TIMER INSIDE!!!");
            [self stopActionByTag:301];
            CCAction *sequenceAction2 = [CCSequence actions:
                                     [CCDelayTime actionWithDuration:0.99],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.275],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.275],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                         
                                     [CCDelayTime actionWithDuration:0.5],
                                     //[CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     //[CCDelayTime actionWithDuration:0.2],
                                     //[CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     nil];
            CCAction *repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            repeatAction2.tag = 401;
            [self runAction: repeatAction2];
            planBOOL = YES;
        }
        ////////////////// LEVEL 103 ////////////////////
        if(timerIndicator >= 40 && planBOOL == NO && LEVELNUMBER == 103)
        {
        planC = YES;
        //CCLOG(@"TIMER INSIDE!!! TIMER INSIDE!!! TIMER INSIDE!!!");
        [self stopActionByTag:301];
        CCAction *sequenceAction2 = [CCSequence actions:
                                     [CCDelayTime actionWithDuration:0.99],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.9],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.8],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.7],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.6],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                 
                                     nil];
        CCAction *repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
        repeatAction2.tag = 401;
        [self runAction: repeatAction2];
        planBOOL = YES;
    }
        ////////////////// LEVEL 104 ////////////////////
        if(timerIndicator >= 40 && planBOOL == NO && LEVELNUMBER == 104)
        {
        planC = YES;
        //CCLOG(@"TIMER INSIDE!!! TIMER INSIDE!!! TIMER INSIDE!!!");
        [self stopActionByTag:301];
        CCAction *sequenceAction2 = [CCSequence actions:
                                     [CCDelayTime actionWithDuration:0.5],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.27],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.27],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.27],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     [CCDelayTime actionWithDuration:0.27],
                                     [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     
                                     //[CCDelayTime actionWithDuration:0.2],
                                     //[CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     //[CCDelayTime actionWithDuration:0.2],
                                     //[CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
                                     nil];
        CCAction *repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
        repeatAction2.tag = 401;
        [self runAction: repeatAction2];
        planBOOL = YES;
     
    }*/
    //[self didCountFruits];
    //[self unschedule:@selector(Timer:)];
}

-(void)setLevelDifficulty // установка времени (1-20s 20-40s 40-60s)
{
    if(LEVELNUMBER == 1)
    {
        if(planA == YES){ //0-10sec
            timeBetweenFruits = time_1_1;
        }
        else if(planB == YES){
            timeBetweenFruits = time_1_2;
        }
        else if(planC == YES){
            timeBetweenFruits = time_1_3;
        }
        
    }
    else if(LEVELNUMBER == 2)
    {
        if(planA == YES){
            timeBetweenFruits = time_2_1;
        }
        else if(planB == YES){
            timeBetweenFruits = time_2_2;
        }
        else if(planC == YES){
            timeBetweenFruits = time_2_3;
        }
        else if(planD == YES){
            timeBetweenFruits = time_2_4;
        }
    }
    else if(LEVELNUMBER == 3)
    {
        if(planA == YES){
            timeBetweenFruits = time_3_1;
        }
        else if(planB == YES){
            timeBetweenFruits = time_3_2;
        }
        else if(planC == YES){
            timeBetweenFruits = time_3_3;
        }
        else if(planD == YES){
            timeBetweenFruits = time_3_4;
        }
        else if(planE== YES){
            timeBetweenFruits = time_3_5;
        }
    }
    else if(LEVELNUMBER == 4)
    {
        if(planA == YES){
            timeBetweenFruits = time_4_1;
        }
        else if(planB == YES){
            timeBetweenFruits = time_4_2;
        }
        else if(planC == YES){
            timeBetweenFruits = time_4_3;
        }
        else if(planD == YES){
            timeBetweenFruits = time_4_4;
        }
        else if(planE== YES){
            timeBetweenFruits = time_4_5;
        }
        else if(planF== YES){
            timeBetweenFruits = time_4_6;
        }
    }
    else if(LEVELNUMBER == 5)
    {
        if(planA == YES){
            timeBetweenFruits = time_5_1;
        }
        else if(planB == YES){
            timeBetweenFruits = time_5_2;
        }
        else if(planC == YES){
            timeBetweenFruits = time_5_3;
        }
        else if(planD == YES){
            timeBetweenFruits = time_5_4;
        }
        else if(planE== YES){
            timeBetweenFruits = time_5_5;
        }
        else if(planF== YES){
            timeBetweenFruits = time_5_6;
        }
    }
    
    
  
}

-(void)chooseFruit // CHOOSE FRUIT устанавливает i в качестве выхода
{
    randomNumber = CCRANDOM_0_1()*100+1;

    if(LEVELNUMBER == 1)
    {
        if(planA == YES){
            plan_1_1;
        }
        if(planB == YES){
            plan_1_2a; plan_1_2b;
        }
        if(planC == YES){
            plan_1_3a; plan_1_3b;
        }
    }
    if(LEVELNUMBER == 2)
    {
        if(planA == YES){
            plan_2_1;
        }
        if(planB == YES){
            plan_2_2;
        }
        if(planC == YES){
            plan_2_3;
        }
        if(planD == YES){
            plan_2_4;
        }
    }
    if(LEVELNUMBER == 3)
    {
        if(planA == YES){
            plan_3_1a; plan_3_1b;
        }
        if(planB == YES){
            plan_3_2a; plan_3_2b;
        }
        if(planC == YES){
            plan_3_3a; plan_3_3b;
        }
        if(planD == YES){
            plan_3_4a; plan_3_4b;
        }
        if(planE == YES){
            plan_3_5a; plan_3_5b;
        }
    }
    if(LEVELNUMBER == 4)
    {
        if(planA == YES){
            plan_4_1a; plan_4_1b;
        }
        if(planB == YES){
            plan_4_2a; plan_4_2b;
        }
        if(planC == YES){
            plan_4_3a; plan_4_3b;
        }
        if(planD == YES){
            plan_4_4a; plan_4_4b;
        }
        if(planE == YES){
            plan_4_5a; plan_4_5b;
        }
        if(planF == YES){
            plan_4_6a; plan_4_6b;
        }
    }
    if(LEVELNUMBER == 5)
    {
        if(planA == YES){
            plan_5_1a; plan_5_1b;
        }
        if(planB == YES){
            plan_5_2a; plan_5_2b;
        }
        if(planC == YES){
            plan_5_3a; plan_5_3b;
        }
        if(planD == YES){
            plan_5_4a; plan_5_4b;
        }
        if(planE == YES){
            plan_5_5a; plan_5_5b;
        }
        if(planF == YES){
            plan_5_6a; plan_5_6b;
        }
    }

 

    [self addFruit];
}



-(void)addFruit
{
    fruitTypes = [NSArray arrayWithObjects:@"malina.png",@"yagoda.png",@"vishenka.png",@"lemon.png",@"pomidor.png",@"ananas.png",@"grenade.png",@"box_left.png",@"mech_left.png",@"boomerang.png",@"moneta_small.png",@"moneta_middle.png",@"moneta_big.png", @"budilnik_small.png",@"budilnik_middle.png",@"budilnik_big.png",nil];
    
   // int flipInt = CCRANDOM_0_1()*2; /// ПОВОРОТ ВЛЕВО/ВПРАВО
    
////////////// ВЫБИРАЕМ 
    NSString *image = [fruitTypes objectAtIndex:i];
    Fruit *fruit =  [Fruit spriteWithFile:image];
    
    if([fruitsArray count] <= 3){
        xInt = CCRANDOM_0_1()*160 + 80;
        yInt = CCRANDOM_0_1()*240 + 100;
    }
    else{
        xInt = CCRANDOM_0_1()*260 + 30;
        yInt = CCRANDOM_0_1()*400 + 40;
    }
    
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
                [self chooseFruit];
               
                collisionBOOL = YES;
                 return;
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
    
    if(i == 0){vesaFloat = vesaFloat+ vesMalina;}
    else if(i==1){vesaFloat = vesaFloat + vesYagoda;}
    else if(i==2){vesaFloat = vesaFloat + vesVishenka;}
    else if(i==3){vesaFloat = vesaFloat + vesLemon;}
    else if(i==4){vesaFloat = vesaFloat + vesPomidor;}
    else if(i==5){vesaFloat = vesaFloat + vesAnanas;}
    
    //*int countFruits = [fruitsArray count];
    if (vesaFloat> 22 && gameoverBOOL == NO)
    {
        gameoverBOOL = YES;
        [self stopActionByTag:301];
        [self unschedule:@selector(levelTimerStart:)];
        [self unschedule:@selector(Timer:)];
        
        
        [self stopMusicTheme];
        [self statsGame];
        
        if(isSoundOn==YES){
            [[SimpleAudioEngine sharedEngine] playEffect:youLoseSound];
        }
        else{
            CCLOG(@"NOT SOUND");
        }
        return;
    }
    
    [self addChild:fruit];
      
    [fruit startWithType:i];
    
   
    

    /* if(i==6){
        bombBonusInt = bombBonusInt+1;      //BONUS INT: BOMB BOX MECH BOOMERANG
    }
    else if(i==7){boxBonusInt = boxBonusInt+1;}
    else if(i==8){mechBonusInt = mechBonusInt+1;}
    else if(i==9){boomerangBonusInt = boomerangBonusInt+1;}*/
    
    [fruit displayLifes];
    fruitsInt = fruitsInt + 1;  // СКОЛЬКО ВЫВАЛИЛОСЬ ФРУКТОВ
} 


#pragma mark < TOUCH METHODS >

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(isPaused == YES) {
        return;
    }
    
    for (UITouch *touch in [event allTouches])
    {
        CGPoint location = [touch locationInView:touch.view];
        location = [[CCDirector sharedDirector] convertToGL:location];
        
        //НАЖАТИЕ НА БУДИЛЬНИК (ТУТОРИАЛ)
        if(STEP5BOOL == YES)
        {
             for (Fruit *fruit in fruitsArray)
             {
                 if (CGRectContainsPoint([fruit boundingBox], location))// && touchBOOL == YES)
                 {
                     {
                         [self startBudilnikActions];
                         [self removeTimerBomb];
                         
                     }
                 }
             }
         }
        
        //НАЖАТИЕ НА СЛОТ->ГАРАНАТА
        if(STEP9BOOL == YES)
        {
                if (CGRectContainsPoint([grenadePowerUp boundingBox], location))// && touchBOOL == YES)
                {
                        [self removeChoosePowerUp];
                        [self setStep10Bool];
                        STEP = 10;
                        [self chooseTutorFruit];
                        //STEP = 11;
                        CCLOG(@"GRENADE 10 STEP!!!");
                        //STEP9BOOL = NO;
                }
        }
        //НАЖАТИЕ НА СЛОТ->нажатие на ЭКРАН (использование ГАРАНАТЫ)
        if(STEP10BOOL == YES)
        {
            if(CGRectContainsPoint([boundaryBox boundingBox], location))
            {
                STEP = 11;
                [self chooseTutorFruit];
                STEP = 12;
                STEP10BOOL = NO;
            }
        }
        
        
        ///// нажатие на СЛОТ СУПЕРУДАРА(4)
        ///// нажатие на СЛОТ->БУМЕРАНГ
        if(CGRectContainsPoint([grenadePowerUp boundingBox], location) && bombBonusTake > 0)
        {
            if(boxBOOL == YES || mechBOOL == YES || boomerangBOOL == YES){
                continue;
            }
                
            if(grenadeBOOL == NO){
             grenadeBOOL = YES;  CCLOG(@"GRENADEBOOL = YES !!!");
            }
            else {
                grenadeBOOL = NO; CCLOG(@"GRENADEBOOL = NO !!!");
            }
           
            if(grenadeBOOL == YES){
                
                [self startGrenade];   // УСТАНАВЛИВАЕМ ИНДИКАТОР ГРАНАТЫ
                [self hidePowerUps];
                [self powerUpsMoveDown];
                bombBonusTake = bombBonusTake-1;
            
            }
            else if(grenadeBOOL == NO){
                [self closeGrenade];
                [self showPowerUps];
                [self powerUpsMoveBack];
                 
            }
        }
        
        ///// нажатие на СЛОТ->БОКС
        if(CGRectContainsPoint([box boundingBox], location) && boxBonusTake > 0)
        {
            if(grenadeBOOL == YES || mechBOOL == YES || boomerangBOOL == YES){
                continue;
            }
            
            if(boxBOOL == NO){
                boxBOOL = YES;  CCLOG(@"BOX BOXBOOL = YES !!!");
            }
            else {
                boxBOOL = NO; CCLOG(@"BOX BOXBOOL = NO !!!");
            }
            
            if(boxBOOL == YES){
                //[self startBomb];
                [self startBox];
                [self hidePowerUps];
                [self powerUpsMoveDown];
                boxBonusTake = boxBonusTake-1;
               
            }
            else if(boxBOOL == NO){
                [self unschedule:@selector(boxKick:)];
                [self closeBox];
                timerBox = 330;
                [self showPowerUps];
                [self powerUpsMoveBack];
               
            }
        }
        
        ///// нажатие на СЛОТ->МЕЧ
        if(CGRectContainsPoint([mechPowerUp boundingBox], location) && mechBonusTake > 0)
        {
            if(grenadeBOOL == YES || boxBOOL == YES || boomerangBOOL == YES) {
                continue;
            }
            
            if(mechBOOL== NO){
                mechBOOL = YES;  CCLOG(@"MECH BOOL = YES !!!");
            }
            else {
                mechBOOL = NO; CCLOG(@"MECH BOOL = NO !!!");
            }
            
            if(mechBOOL == YES){
            
                [self startMech];
                [self hidePowerUps];
                [self powerUpsMoveDown];
                mechBonusTake = mechBonusTake-1;
                
            }
            else if(mechBOOL == NO){
               // [self unschedule:@selector(boxKick:)];
                [self closeMech];
                [self showPowerUps];
                //timerBox = 330;
            }
        }
        
        ///// нажатие на СЛОТ->БУМЕРАНГ 
        if(CGRectContainsPoint([boomerangPowerUp boundingBox], location) && boomerangBonusTake > 0)
        {
            if(grenadeBOOL == YES || boxBOOL == YES || mechBOOL == YES) {
                continue;
            }
            
            if(boomerangBOOL == NO){
                boomerangBOOL = YES;  CCLOG(@"BOOMERANG BOOL = YES !!!");
            }
            else {
                boomerangBOOL = NO; CCLOG(@"BOOMERANG BOOL = NO !!!");
            }
            
            if(boomerangBOOL == YES){
                [self startBoomerang];
                [self powerUpsMoveDown];
                boomerangBonusTake = boomerangBonusTake-1;
            }
            else if(boomerangBOOL == NO){
                [self closeBoomerang];
                //[self stopBoomerangAction];
            }
        }
        
        ///// нажатие на ИГРОВОЙ ЭКРАН
        if(grenadeBOOL == YES) /////// БОМБА в ЭКРАНЕ //////
        {
            if(CGRectContainsPoint([boundaryBox boundingBox], location))
            {
                //boundaryBOOL = NO;
                [self powerUpsMoveBack];
            
                bgBlack.opacity=0;

                bombSprite = [CCSprite node];
                bombSprite.color = ccYELLOW;
                bombSprite.opacity = 0;
                [bombSprite setTextureRect:CGRectMake(0, 0, s.width/2+5, s.height/3+7.5)];
                [self addChild:bombSprite z:120 tag:2];  //ПОЗЖЕ УДАЛЯЕТСЯ ПО ТЕГУ 2
                
                bombSprite.position = location;
                explosionPosition = location;
                
                [self grenadeExplosion];
                //[[SimpleAudioEngine sharedEngine] playEffect:grenadeSound];
                
                if(isSoundOn==YES){
                    [[SimpleAudioEngine sharedEngine] playEffect:grenadeSound];
                }
                else{
                    CCLOG(@"NOT SOUND");
                }
                
                [self schedule:@selector(grenadeActionUpdate:)];
            }
        }
        
        if(boxBOOL == YES)  /////// БОКС в ЭКРАНЕ //////////
        {
            if(CGRectContainsPoint([boundaryBox boundingBox], location))
            {
                boxPosition = location;
                boxLabel.opacity = 150;
                
                float kickDuration = 0.14;
                
                if(boxPosition.y < s.height*3.5/10)
                {
                    kickDuration = 0.07;
                }
                
                if(kickEnableBOOL == YES) // РАЗРЕШЕНИЕ на УДАР
                {
                    if(kickBOOL == YES)
                    {
                        kickTimerFloat = 0; //Обнуляем начало отсчета (ПРОМЕЖУТОК между УДАРОМ)
                        id actionToEase = [CCMoveTo actionWithDuration:kickDuration position:ccp(boxPosition.x-10,boxPosition.y-20)];
                        //[gloveLeft runAction:[CCMoveTo actionWithDuration:kickDuration position:boxPosition]];
                        [gloveLeft runAction:[CCEaseExponentialInOut actionWithAction:actionToEase]];
                    }
                    else if(kickBOOL == NO)
                    {
                        kickTimerFloat = 0; //Обнуляем начало отсчета (ПРОМЕЖУТОК между УДАРОМ)
                        //[gloveRight runAction:[CCMoveTo actionWithDuration:kickDuration position:boxPosition]];
                        id actionToEase = [CCMoveTo actionWithDuration:kickDuration position:ccp(boxPosition.x+10,boxPosition.y-20)];
                        [gloveRight runAction:[CCEaseExponentialInOut actionWithAction:actionToEase]];
                    }
                
                    if(kickBOOL == YES){
                        kickBOOL = NO;
                    }
                    else{
                        kickBOOL =YES;
                    }
                    
                    if(isSoundOn==YES){
                        [[SimpleAudioEngine sharedEngine] playEffect:boxSound];
                    }
                    else{
                        CCLOG(@"NOT SOUND");
                    }
                }
                //[[SimpleAudioEngine sharedEngine] playEffect:boxSound];     /// !!! ГОНГ !!!!
                [self schedule:@selector(boxKick:)];
                bgBlack.opacity = 0;
                
                //timeBetweenFruits = 0.5f;
            }
        }
        
        if(boomerangBOOL == YES) //// БУМЕРАНГ в ЭКРАНЕ //////////////////
        {
            if(CGRectContainsPoint([boundaryBox boundingBox], location))
            {
                //boomerangPosition = location;
                
                //timerBoomerang = 200;
                [self hidePowerUps];
                
                //[[SimpleAudioEngine sharedEngine] playEffect:boxSound];     /// !!! ГОНГ !!!!
                //[self schedule:@selector(boomerangKick:)];
                
                if(isSoundOn==YES){
                    [[SimpleAudioEngine sharedEngine] playEffect:boomerangSound];
                }
                else{
                    CCLOG(@"NOT SOUND");
                }
                
                boomerangBOOL = NO;
                [self boomerangKick];
            }
        }
        
        if(mechBOOL == YES)  ///// МЕЧ в ЭКРАНЕ ///////////////////
        {
            if(CGRectContainsPoint([boundaryBox boundingBox], location))
            {
                moveSprite.position = location;
            
                mechLabel.opacity = 150;
                
                [self schedule:@selector(mechUpdate:)];
                //moveSprite.opacity = 255;
                bgBlack.opacity = 0;
            }
        }
        
        /////////// ТАП в ЭКРАНЕ //////////////////////////
        if(grenadeBOOL == NO && boxBOOL == NO && mechBOOL == NO && boomerangBOOL == NO)
        {
            for (Fruit *fruit in fruitsArray)
            {
                if (CGRectContainsPoint([fruit boundingBox], location))// && touchBOOL == YES)
                {
                    [fruit wasTapped];
            
                    if([fruit getLifes] <=0)
                    {
                        [[SimpleAudioEngine sharedEngine] stopEffect:hitSound];
                        soundFloat=0;
                        
                        if([fruit getIndex]>=0 && [fruit getIndex]<=5 )
                            kulakScoreInt = kulakScoreInt + 1;
                        
                        if([fruit getIndex] == 0){vesaFloat = vesaFloat - vesMalina;}
                        else if([fruit getIndex] == 1){vesaFloat = vesaFloat - vesYagoda;}
                        else if([fruit getIndex] == 2){vesaFloat = vesaFloat - vesVishenka;}
                        else if([fruit getIndex] == 3){vesaFloat = vesaFloat - vesLemon;}
                        else if([fruit getIndex] == 4){vesaFloat = vesaFloat - vesPomidor;}
                        else if([fruit getIndex] == 5){vesaFloat = vesaFloat - vesAnanas;}
                        
                        if(vesaFloat < 0){
                            vesaFloat=0;
                        }
                        
                        
                        [fruit explosionEffect];
                        [fruitsArray removeObject:fruit];
                      
                        
                        /*if(soundEnableBOOL==YES){
                            [self schedule:@selector(soundBegin:)];
                        }*/
                        
                        if(isSoundOn==YES && soundEnableBOOL==YES){
                            [[SimpleAudioEngine sharedEngine] playEffect:hitSound];
                        }
                        else{
                            CCLOG(@"NO SOUNDS");
                        }
                        [self didScore];
                    }
                    
                    if([fruit getBombBonusBOOL] == YES)
                    {
                        bombBonusTake = bombBonusTake+1;
                        [fruitsArray removeObject:fruit];
                    }
                    else if([fruit getBoxBonusBOOL] == YES)
                    {
                        boxBonusTake = boxBonusTake+1;
                        [fruitsArray removeObject:fruit];
                    }
                    else if([fruit getMechBonusBOOL] == YES)
                    {
                        mechBonusTake = mechBonusTake+1;
                        [fruitsArray removeObject:fruit];
                    }
                    else if([fruit getBoomerangBonusBOOL] == YES)
                    {
                        boomerangBonusTake = boomerangBonusTake+1;
                        [fruitsArray removeObject:fruit];
                    }
                    else if([fruit getMonetaSmallBOOL] == YES)
                    {
                        monetaTakeInt = monetaTakeInt + 1;
                        [fruitsArray removeObject:fruit];
                         [self monetaDelayAction];
                    }
                    else if([fruit getMonetaMiddleBOOL] == YES)
                    {
                        monetaTakeInt = monetaTakeInt + 3;
                        [fruitsArray removeObject:fruit];
                         [self monetaDelayAction];
                    }
                    else if([fruit getMonetaBigBOOL] == YES)
                    {
                        monetaTakeInt = monetaTakeInt + 5;
                        [fruitsArray removeObject:fruit];
                         [self monetaDelayAction];
                    }
                    else if([fruit getBudilnikSmallBOOL] == YES)
                    {
                        budilnikFloat = 210;
                        [fruitsArray removeObject:fruit];
                        [self schedule:@selector(budilnikStart:)];
                        [self disableTouch];
                       /* [fruit runAction:[CCSpawn actions:
                                          [CCScaleTo actionWithDuration:2 scale:15.0],
                                          [CCFadeOut actionWithDuration:1]
                                          ,nil]];
                        [fruit setBigBOOL];*/
                    }
                    else if([fruit getBudilnikMiddleBOOL] == YES)
                    {
                        budilnikFloat = 210;
                        [fruitsArray removeObject:fruit];
                        [self schedule:@selector(budilnikStart:)];
                        [self disableTouch];
                    }
                    else if([fruit getBudilnikBigBOOL] == YES)
                    {
                        budilnikFloat = 210;
                        [fruitsArray removeObject:fruit];
                        [self schedule:@selector(budilnikStart:)];
                        [self disableTouch];
                    }
    
                    //touchBOOL = NO;
                }
            }
        }
   }
}

-(void)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent *)event
{
    //touchBOOL = YES;
    //CCLOG(@"touchBOOL = %@",touchBOOL);
    CCLOG(@"CCTOUCH ENDED !!!");
    
    if(mechBOOL == YES)
    {
        CCLOG(@"CCTOUCH ENDED !!!");
        moveSprite.opacity = 0;
    }
    
}

- (void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(mechBOOL == NO){
        return;
    }
    CCLOG(@"CCTOUCH MOVE !!!");
    for (UITouch *touch in [event allTouches])
    {
        [[SimpleAudioEngine sharedEngine] stopEffect:mechSound];
        
        CGPoint location = [touch locationInView:touch.view];
        location = [[CCDirector sharedDirector] convertToGL:location];
        
        moveSprite.position = location;
        for(Fruit *fruit in fruitsArray)
        {
            if(CGRectContainsPoint([fruit boundingBox], location)) //МЕЧОМ
            {
                CCLOG(@"!!!! COLLIDE MECH !!!!");
                if([fruit getIndex]>=0 && [fruit getIndex]<=5)
                mechScoreInt = mechScoreInt + 1;
                
                if(isSoundOn==YES){
                    [[SimpleAudioEngine sharedEngine] playEffect:mechSound];
                }
                else{
                    CCLOG(@"NOT SOUND");
                }
                
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
                //[[SimpleAudioEngine sharedEngine] playEffect:mechSound];
                [fruit explosionEffect];
                [fruitsArray removeObject:fruit];
            }
        }
    }
}


#pragma mark <LEVEL PARAMETERS>
-(void)setLevelTimer //инициализация levelTimerLabel
{
    //// LEVELTIMER LABEL ///////////////////////////////////////(ВРЕМЯ ОДНОГО УРОВНЯ)
    levelTimerLabel = [CCLabelTTF labelWithString:@"01.00" fontName:@"SQUARE" fontSize:19];
    levelTimerLabel.opacity = 240;
    levelTimerLabel.anchorPoint = ccp(0,0.5);
    levelTimerLabel.position = ccp(s.width*0.41,s.height*0.89);
    [self addChild:levelTimerLabel z:10];
    
    levelSecondInt = levelTimerFloat/60;
    levelMinuteInt = levelSecondInt/60;
    levelSecondInt = 0;
}

-(void)setLevelNumber
{
    //// LEVEL(STRING) LABEL /////////////////////////////////////(НАДПИСЬ УРОВЕНЬ)
    levelLabel = [CCLabelTTF labelWithString:@"level" fontName:@"SQUARE" fontSize:16];
    levelLabel.opacity = 240;
    levelLabel.position = ccp(s.width*0.45,s.height*0.55); //0.89
    [self addChild:levelLabel z:10];
    
    //// LEVEL NUMBER LABEL /////////////////////////////////////////(НОМЕР УРОВНЯ)
    levelNumberLabel = [CCLabelTTF labelWithString:@"1" fontName:@"SQUARE" fontSize:18];
    levelNumberLabel.opacity = 240;
    levelNumberLabel.anchorPoint = ccp(0,0.5);
    levelNumberLabel.position = ccp(s.width*0.45+levelLabel.contentSize.width*0.6,s.height*0.55); //0.894
    [self addChild:levelNumberLabel z:10];
    
    levelLabel.opacity=0;
    levelNumberLabel.opacity=0;
}

-(void)levelAction
{
    [levelNumberLabel runAction:[CCSequence actions:
                                 [CCFadeIn actionWithDuration:0.5],
                                 [CCDelayTime actionWithDuration:1.0],
                                 [CCFadeOut actionWithDuration:0.5],nil]];
    
    [levelLabel runAction:[CCSequence actions:
                           [CCFadeIn actionWithDuration:0.5],
                           [CCDelayTime actionWithDuration:1.0],
                           [CCFadeOut actionWithDuration:0.5],nil]];
}


#pragma mark <LEVEL START>
-(void)levelTimerDelayAction  //УСТАНАВЛИВАЕМ НА 5(10)сек и ПРОДОЛЖАЕМ
{
    levelTimerFloat = 3602;// 1802 //3602(1мин); //УСТАНАВЛИВАЕМ СЕКУНДОМЕР НА 5 СЕК
    //levelTimerFloat = 300;
    [levelTimerLabel setString:[NSString stringWithString:@"01.00"]];
    [levelTimerLabel runAction:[CCSequence actions:
                                [CCDelayTime actionWithDuration:0.9f],
                                [CCCallFunc actionWithTarget:self  selector:@selector(startLevelTimer)],                 
                                nil]];
}

-(void)startLevelTimer //ВКЛЮЧАЕМ СЕКУНДОМЕР (ТАЙМЕР УРОВНЯ)
{
    [self schedule:@selector(levelTimerStart:)]; //ОТОБРАЖЕНИЕ/ОБНОВЛЕНИЕ СЕКУНДОМЕРА
    planBOOL = NO;
    timerIndicator = 0; //в Timer:
}

-(void)levelTimerStart:(ccTime)dt
{
    levelTimerFloat -= dt;
    
    if(levelTimerFloat > 60)
    {
        levelSecondInt = (int)levelTimerFloat/60;
        levelMinuteInt = levelSecondInt/60;
        if(levelSecondInt > 60){
            levelSecondInt = levelSecondInt - 60;
        }
        if(levelSecondInt == 60){
            levelSecondInt = 0;
        }
        
        if(levelSecondInt < 10){
            [levelTimerLabel setString:[NSString stringWithFormat:@"0%i.0%i",levelMinuteInt,levelSecondInt]];
        }
        else{
            [levelTimerLabel setString:[NSString stringWithFormat:@"0%i.%i",levelMinuteInt,levelSecondInt]];
        }
        levelTimerLabel.position = ccp(s.width*0.41,s.height*0.89);
    }
    
    if(levelTimerFloat < 60) // ОТКЛЮЧАЕМ СЕКУНДОМЕР (ТАЙМЕР УРОВНЯ)
    {
        levelTimerFloat = 0;
        [levelTimerLabel setString:[NSString stringWithFormat:@"00.0%i",levelTimerFloat]];
        [self unschedule:@selector(levelTimerStart:)];
        
        [self stopActionByTag:301];
        nextButton.opacity = 255;
        //[self statsGame];
        
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:1.0f],
                         [CCCallFunc actionWithTarget:self selector:@selector(stopMusicTheme)],
                         [CCDelayTime actionWithDuration:1.5f],
                         [CCCallFunc actionWithTarget:self selector:@selector(statsGame)],
                         [CCCallFunc actionWithTarget:self selector:@selector(soundWin)],nil]];
    }
}

-(void)soundWin
{
    if(isSoundOn==YES){
        [[SimpleAudioEngine sharedEngine] playEffect:youWinSound];
    }
    else{
        CCLOG(@"NOT SOUND");
    }
}

#pragma mark < BUDILNIK >
-(void)budilnikStart:(ccTime)dt
{
    budilnikFloat -= dt;
    budilnikTimerLabel.opacity = 255;
    bgBlack.opacity = 60;
    
    if(budilnikFloat > 60)
    {
        budilnikFloat = budilnikFloat/60;
    }
    
    [budilnikTimerLabel setString:[NSString stringWithFormat:@" 0%0.2f",budilnikFloat]];
    budilnikTimerLabel.position = ccp(budilnikIndicator.position.x + budilnikTimerLabel.contentSize.width*2/3, budilnikIndicator.position.y);
    
    if(budilnikFloat <= 0)
    {
        bgBlack.opacity = 0;
        budilnikFloat = 0;
        [budilnikTimerLabel setString:[NSString stringWithFormat:@"0%0.2f",budilnikFloat]];
        [self enableTouch];
        [self unschedule:@selector(budilnikStart:)];
        budilnikTimerLabel.opacity = 0;
    }
}
 
#pragma mark < MONETA ACTION >

-(void)monetaDelayAction
{
    [monetaCountLabel runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.6],
                                 [CCCallFunc actionWithTarget:self  selector:@selector(monetaCountAction)],                     
                                 nil]];
}
-(void)monetaCountAction
{
    [monetaCountLabel setString:[NSString stringWithFormat:@"x%d",monetaTakeInt]];
    monetaCountLabel.position = ccp(monetaIndicator.position.x+monetaIndicator.contentSize.width*0.3,s.height*0.96);
}




@end
