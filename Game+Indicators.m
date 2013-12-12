//
//  Game+Indicators.m
//  Touch_Project
//
//  Created by Артур on 21.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Indicators.h"

@implementation Game (Indicators)


-(void)setGameplayIndicators
{
    //// SCORE LABEL /////////////////////////////////////////(КОЛИЧЕСТВО УБИТЫХ)
    scoreLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:36];
    scoreLabel.color = ccWHITE;
    scoreLabel.anchorPoint = ccp(0.5,0.5);
    scoreLabel.position = ccp(s.width*0.5,s.height-23);
    [self addChild:scoreLabel z:10];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    score = [userDefaults integerForKey:@"killCountKey"];
    [scoreLabel setString:[NSString stringWithFormat:@"%d",score]];
    
    //// COUNT LABEL ////////////////////////////////////////(ПОДСЧЕТ ФРУКТОВ НА ЭКРАНЕ)
    countLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    countLabel.anchorPoint = ccp(0,0);
    countLabel.opacity = 250;
    countLabel.position = ccp(s.width*0.05,s.height*0.09);
    [self addChild:countLabel z:10];
    
    //// TIMER LABEL ////////////////////////////////////////////(ТЕКУЩЕЕ ВРЕМЯ ИГРЫ 00:00:00)
    timerLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:15];
    //timerLabel.color = ccBLACK;
    timerLabel.anchorPoint = ccp(0,0);
    timerLabel.opacity = 200;
    timerLabel.position = ccp(s.width*0.77,s.height*0.00005);
    [self addChild:timerLabel z:10];
    
    /////////////////////////////// MONETA/BUDILNIK INDICATORS //////////////////////////////
    //// MONETA COUNT LABEL ///////////////////////////////////////
    monetaIndicator = [CCSprite spriteWithFile:@"moneta_big.png"];
    monetaIndicator.position = ccp(s.width*0.1,s.height*0.96);
    monetaIndicator.scale = 0.62;
    monetaIndicator.scaleY = 0.67;
    [self addChild:monetaIndicator z:1000];
    
    monetaCountLabel = [CCLabelTTF labelWithString:@"x0" fontName:@"SQUARE" fontSize:18];
    monetaCountLabel.anchorPoint = ccp(0,0.5);
    monetaCountLabel.position = ccp(monetaIndicator.position.x+monetaIndicator.contentSize.width*0.3,s.height*0.96);
    monetaCountLabel.opacity = 250;
    [self addChild:monetaCountLabel z:1000];
    
    //// BUDILNIK COUNT LABEL /////////////////////////////////////
    budilnikTimerLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:16];
    budilnikTimerLabel.opacity = 240;
    [self addChild:budilnikTimerLabel z:1000];
    
    budilnikIndicator = [CCSprite spriteWithFile:@"budilnik_time.png"];
    budilnikIndicator.position = ccp(s.width*0.1,s.height*0.9);
    budilnikIndicator.scale = 0.95;
    [self addChild:budilnikIndicator z:1000];
    
    //// SPEEDTEST FRUITS ////////////
    speedTestLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:16];
    speedTestLabel.position = ccp(s.width*0.8,s.height*0.24);
    [self addChild:speedTestLabel z:1001];
    
    //// PROCENTILE OF GAMEOVER //////////
    procentileLabel = [CCLabelTTF labelWithString:@"0%" fontName:@"SQUARE" fontSize:16];
    procentileLabel.position = ccp(s.width*0.5,s.height*0.24);
    [self addChild:procentileLabel z:1001];
    
    //// INDICATOR OF GAMEOVERING ////
    dangerSprite = [CCSprite node];
    dangerSprite.textureRect = CGRectMake(0, 0, 320, 480);
    dangerSprite.opacity = 0;
    dangerSprite.color=ccRED;
    dangerSprite.position = ccp(s.width/2,s.height/2);
    [self addChild:dangerSprite z:0];
}

/*-(void)setStatsIndicators
{
    ///////////////////////////////// SCORE SYSTEM //////////////////////////
    //// GRENADE INDICATOR ///////////////////////////////////////
    grenadeIndicator = [CCSprite spriteWithFile:@"indicator_grenade.png"];
    grenadeIndicator.position = ccp(s.width*0.75,s.height*0.85);
    grenadeIndicator.scale = 0.50;
    [self addChild:grenadeIndicator z:1000];
    
    grenadeScoreLabel = [CCLabelTTF labelWithString:@"x0" fontName:@"SQUARE" fontSize:18];
    grenadeScoreLabel.anchorPoint = ccp(0,0.5);
    grenadeScoreLabel.position = ccp(s.width*0.8,s.height*0.85);
    [self addChild:grenadeScoreLabel z:1000];
    
    //// BOX INDICATOR /////////////////////////////////////////
    boxIndicator = [CCSprite spriteWithFile:@"indicator_box.png"];
    boxIndicator.position = ccp(s.width*0.75,s.height*0.775);
    boxIndicator.scale = 0.50;
    [self addChild:boxIndicator z:1000];
    
    boxScoreLabel = [CCLabelTTF labelWithString:@"x0" fontName:@"SQUARE" fontSize:18];
    boxScoreLabel.anchorPoint = ccp(0,0.5);
    boxScoreLabel.position = ccp(s.width*0.8,s.height*0.775);
    [self addChild:boxScoreLabel z:1000];
    
    //// MECH INDICATOR /////////////////////////////////////////
    mechIndicator = [CCSprite spriteWithFile:@"indicator_mech.png"];
    mechIndicator.position = ccp(s.width*0.75,s.height*0.700);
    mechIndicator.scale = 0.50;
    [self addChild:mechIndicator z:1000];
    
    mechScoreLabel = [CCLabelTTF labelWithString:@"x0" fontName:@"SQUARE" fontSize:18];
    mechScoreLabel.anchorPoint = ccp(0,0.5);
    mechScoreLabel.position = ccp(s.width*0.8,s.height*0.700);
    [self addChild:mechScoreLabel z:1000];
    
    //// BOOMERANG INDICATOR /////////////////////////////////////////
    boomerangIndicator = [CCSprite spriteWithFile:@"indicator_boomerang.png"];
    boomerangIndicator.position = ccp(s.width*0.75,s.height*0.625);
    boomerangIndicator.scale = 0.50;
    [self addChild:boomerangIndicator z:1000];
    
    boomerangScoreLabel = [CCLabelTTF labelWithString:@"x0" fontName:@"SQUARE" fontSize:18];
    boomerangScoreLabel.anchorPoint = ccp(0,0.5);
    boomerangScoreLabel.position = ccp(s.width*0.8,s.height*0.625);
    [self addChild:boomerangScoreLabel z:1000];
    
    //// KULAK INDICATOR /////////////////////////////////////////
    kulakIndicator = [CCSprite spriteWithFile:@"indicator_kulak.png"];
    kulakIndicator.position = ccp(s.width*0.75,s.height*0.550);
    kulakIndicator.scale = 0.50;
    [self addChild:kulakIndicator z:1000];
    
    kulakScoreLabel = [CCLabelTTF labelWithString:@"x0" fontName:@"SQUARE" fontSize:18];
    kulakScoreLabel.anchorPoint = ccp(0,0.5);
    kulakScoreLabel.position = ccp(s.width*0.8,s.height*0.550);
    [self addChild:kulakScoreLabel z:1000];
    
}
 */

-(void)setSecundomers
{
    //////////////////////////////// SECUNDOMERS  ////////////////////////////////
    //// BOX LABEL ///////////////////////////////////////////(СЕКУНДОМЕР БОКСА)
    boxLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:30];
    boxLabel.position = ccp(s.width*0.5,s.height*0.5);
    boxLabel.opacity = 0;
    [self addChild:boxLabel z:110];
    
    //// MECH LABEL //////////////////////////////////////////(СЕКУНДОМЕР МЕЧА)
    mechLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:30];
    mechLabel.position = ccp(s.width*0.5,s.height*0.5);
    mechLabel.opacity = 0;
    [self addChild:mechLabel z:110];
}

#pragma mark < Red Alert >

-(void)redAlert
{
    // dangerSprite.opacity=150;
    CCAction *fadeAlert = [CCFadeTo actionWithDuration:0.1 opacity:160];
    
    
    [dangerSprite runAction:[CCSequence actions:fadeAlert,
                             [CCCallFunc actionWithTarget:self selector:@selector(redBlink)],nil]];
}
-(void)redBlink
{
    repAlert = [CCRepeatForever actionWithAction:[CCBlink actionWithDuration:5 blinks:8]];
    repAlert.tag = 222;
    [dangerSprite runAction:repAlert];
    
    //alertBOOL = YES;
}


@end
