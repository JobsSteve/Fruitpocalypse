//
//  Game+StatsMenu.m
//  Touch_Project
//
//  Created by Артур on 20.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+StatsMenu.h"
#import "CCMenuPopup.h"
#import "PopUp.h"

#import "StoreScene.h"
#import "MainMenu.h"

#define ANIM_SPEED 01.19

@implementation Game (StatsMenu)

-(void)setGameOverLabel
{
    gameOverLabel = [CCLabelTTF labelWithString:@"gameover" fontName:@"SQUARE" fontSize:16];
    gameOverLabel.anchorPoint = ccp(0,0.5);
    gameOverLabel.position = ccp(s.width*0.01,s.height*0.9);
    [self addChild:gameOverLabel z:100];
}

-(void)setStatsButton
{
    //// PAUSE BUTTON //////////////////////////////////////////
    statsButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"stats_level.png"] selectedSprite:NULL target:self selector:@selector(statsGame)];
    statsButton.scale = 0.95;
    
    CCMenu *menu = [CCMenu menuWithItems:statsButton, nil];
    menu.position = ccp(0+statsButton.contentSize.width*0.6,s.height-statsButton.contentSize.height);
    [self addChild:menu z:10];
}

-(void)statsGame
{
    CCLOG(@"STATS GAME!!!");
    if(isStats == YES){
        return;
    }
    
    [self unschedule:@selector(levelTimerStart:)];
    [self unschedule:@selector(Timer:)];
    [self unschedule:@selector(scoreUpdate:)];
    [self stopActionByTag:301];
    [self stopActionByTag:401];
    
    CCMenuItemSprite *mainmenuButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"mainmenu_BUTTON.png"] selectedSprite:NULL target:self selector:@selector(mainmenuMenu)];
    CCMenuItemSprite *ratingButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"rating_BUTTON.png"] selectedSprite:NULL target:self selector:@selector(ratingMenu)];
    CCMenuItemSprite *nextButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"next_BUTTON.png"] selectedSprite:NULL target:self selector:@selector(nextMenu)];
    CCMenuItemSprite *restartButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"restart_BUTTON.png"] selectedSprite:NULL target:self selector:@selector(restartMenu)];
    
    CCMenuPopup *menu;
    CCSprite *statSprite;
    if(gameoverBOOL == YES){
        menu = [CCMenuPopup menuWithItems: mainmenuButton,ratingButton,restartButton, nil];
        statSprite= [CCSprite spriteWithFile:@"gameover_STATS.png"];
        
    }
    else{
        //menu = [CCMenuPopup menuWithItems: mainmenuButton,ratingButton,nextButton, nil];
        menu = [CCMenuPopup menuWithItems: mainmenuButton,restartButton,nextButton, nil];
        statSprite= [CCSprite spriteWithFile:@"level_STATS.png"];
        
    }
    menu.position = ccp(s.width*0.5,s.height*0.075);
    [menu alignItemsHorizontallyWithPadding:7];
    menu.scale = 0.9;
    
    PopUp *pop = [PopUp popUpWithSprite:menu andWindow: statSprite];
    [self addChild:pop z:1000];
    
    isStats = YES;
    
    [self statisticsDisplay];
}

-(void)mainmenuMenu
{
    CCLOG(@"main menu");
    isStats = NO;
    [self removeChildByTag:101 cleanup:YES];
    
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1.5f scene:[MainMenu node] withColor:ccBLACK]];
}

-(void)ratingMenu
{
    CCLOG(@"rating menu");
    isStats = NO;
    [self removeChildByTag:101 cleanup:YES];
}

-(void)nextMenu
{
    if(gameOverBOOL == NO){
        LEVELNUMBER = LEVELNUMBER+1;
    }
    CCLOG(@"next menu");
    isStats = NO;
    [self removeChildByTag:101 cleanup:YES];
    gameOverBOOL = NO;
    
    //[self levelTimerDelayAction]; // т.к. есть UserDefaults
    
    [self setUserDefaults];
    
    [self transition];
}

-(void)transition
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.0 scene:[StoreScene node] withColor:ccBLACK]];
    
}

-(void)restartMenu
{
    CCLOG(@"restart menu");
    //isStats = NO;
    [self removeChildByTag:101 cleanup:YES];
    //gameOverBOOL = NO;
    isPaused = NO;
    //[[CCDirector sharedDirector] resume];
    //[[CCDirector sharedDirector] replaceScene:[[self class] node]];
    [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1.5f scene:[[self class] node] withColor:ccBLACK]];
    //[self levelTimerDelayAction];
}
-(void)statisticsDisplay
{
    CCSprite *statsBox = [CCSprite node];
    //statsBox.color = ccYELLOW;
    statsBox.opacity = 0;
    statsBox = [CCSprite spriteWithFile:@"blank.png"];
    [statsBox setTextureRect:CGRectMake(0,0, s.width, s.height)];
    statsBox.position = ccp(s.width/2,s.height/2);
    [self addChild:statsBox z:1000 tag:101];
    // KULAK STATISTICS
    CCLabelTTF *kulakKill = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    kulakKill.color = ccBLACK;
    kulakKill.position = ccp(s.width*0.425,s.height*0.665);
    [statsBox addChild:kulakKill z:1000];
    [kulakKill setString:[NSString stringWithFormat:@"%d",kulakScoreInt]];
    
    CCLabelTTF *kulakScore = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    kulakScore.color = ccBLACK;
    kulakScore.position = ccp(s.width*0.7,s.height*0.665);
    [statsBox addChild:kulakScore z:1000];
    [kulakScore setString:[NSString stringWithFormat:@"%d",kulakScoreInt*10]];
    
    // GRENADE STATISTICS
    CCLabelTTF *grenadeKill = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    grenadeKill.color = ccBLACK;
    grenadeKill.position = ccp(s.width*0.425,s.height*0.549);
    [statsBox addChild:grenadeKill z:1000];
    [grenadeKill setString:[NSString stringWithFormat:@"%d",grenadeScoreInt]];
    
    CCLabelTTF *grenadeScore = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    grenadeScore.color = ccBLACK;
    grenadeScore.position = ccp(s.width*0.7,s.height*0.549);
    [statsBox addChild:grenadeScore z:1000];
    [grenadeScore setString:[NSString stringWithFormat:@"%d",grenadeScoreInt*20]];
    
    // BOX STATISTICS
    CCLabelTTF *boxKill = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    boxKill.color = ccBLACK;
    boxKill.position = ccp(s.width*0.425,s.height*0.437);
    [statsBox addChild:boxKill z:1000];
    [boxKill setString:[NSString stringWithFormat:@"%d",boxScoreInt]];
    
    CCLabelTTF *boxScore = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    boxScore.color = ccBLACK;
    boxScore.position = ccp(s.width*0.7,s.height*0.437);
    [statsBox addChild:boxScore z:1000];
    [boxScore setString:[NSString stringWithFormat:@"%d",boxScoreInt*30]];
    
    // MECH STATISTICS
    CCLabelTTF *mechKill = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    mechKill.color = ccBLACK;
    mechKill.position = ccp(s.width*0.425,s.height*0.327);
    [statsBox addChild:mechKill z:1000];
    [mechKill setString:[NSString stringWithFormat:@"%d",mechScoreInt]];
    
    CCLabelTTF *mechScore = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    mechScore.color = ccBLACK;
    mechScore.position = ccp(s.width*0.7,s.height*0.327);
    [statsBox addChild:mechScore z:1000];
    [mechScore setString:[NSString stringWithFormat:@"%d",mechScoreInt*40]];
    
    // BOOMERANG STATISTICS
    CCLabelTTF *boomerangKill = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    boomerangKill.color = ccBLACK;
    boomerangKill.position = ccp(s.width*0.425,s.height*0.212);
    [statsBox addChild:boomerangKill z:1000];
    [boomerangKill setString:[NSString stringWithFormat:@"%d",boomerangScoreInt]];
    
    CCLabelTTF *boomerangScore = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    boomerangScore.color = ccBLACK;
    boomerangScore.position = ccp(s.width*0.7,s.height*0.212);
    [statsBox addChild:boomerangScore z:1000];
    [boomerangScore setString:[NSString stringWithFormat:@"%d",boomerangScoreInt*50]];
    
    int kulakTotal = kulakScoreInt*10;
    int grenadeTotal = grenadeScoreInt*20;
    int boxTotal = boxScoreInt*30;
    int mechTotal = mechScoreInt*40;
    int boomerangTotal = boomerangScoreInt*50;
    
    TOTALSCORE = kulakTotal+grenadeTotal+boxTotal+mechTotal+boomerangTotal;
    //TOTAL SCORE
    CCLabelTTF *totalScore = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:22];
    totalScore.color = ccBLACK;
    totalScore.position = ccp(s.width*0.6,s.height*0.8);
    [statsBox addChild:totalScore z:1000];
    
    [totalScore setString:[NSString stringWithFormat:@"%d",TOTALSCORE]];
    
    
    [statsBox runAction:[CCFadeTo actionWithDuration:ANIM_SPEED opacity:250]];
    [statsBox runAction:[CCSequence actions:
                         //[CCScaleTo actionWithDuration:ANIM_SPEED /2 scale:0.9],
                         [CCScaleTo actionWithDuration:ANIM_SPEED /10 scale:0.9],
                         [CCScaleTo actionWithDuration:ANIM_SPEED/2  scale:1.0],
                         //[CCScaleTo actionWithDuration:ANIM_SPEED/5  scale:0.95],
                         nil]];
    
   
}



@end
