//
//  Game+PauseMenu.m
//  Touch_Project
//
//  Created by Артур on 20.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+PauseMenu.h"
#import "PopUp.h"
#import "CCMenuPopup.h"
#import "Game.h"

#import "StoreScene.h"
#import "MainMenu.h"

@implementation Game (PauseMenu)


-(void)setPauseButton
{
    //// PAUSE BUTTON //////////////////////////////////////////
    CCMenuItemSprite *pauseButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"pausebutton.png"] selectedSprite:NULL target:self selector:@selector(pauseGame)];
    pauseButton.scale = 0.85;
    
    CCMenu *menu = [CCMenu menuWithItems:pauseButton, nil];
    pauseButton.position = ccp(s.width*0.5 - pauseButton.contentSize.width*0.65, (s.height*0.5) - pauseButton.contentSize.height*0.6);
    [self addChild:menu z:10];
}

-(void)pauseGame
{
    CCLOG(@"PAUSE GAME!!!");
    if(isPaused == YES){
        return;
    }
    
    [self unschedule:@selector(levelTimerStart:)];
    [self unschedule:@selector(Timer:)];
    [self unschedule:@selector(scoreUpdate:)];
    [self stopActionByTag:301];
    [self stopActionByTag:401];
    
    
    CCMenuItemSprite *resumeButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"play_pausemenu.png"] selectedSprite:NULL target:self selector:@selector(resumeMenu2)];
    CCMenuItemSprite *restartButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"restart_pausemenu.png"] selectedSprite:NULL target:self selector:@selector(restartMenu2)];
    CCMenuItemSprite *mainmenuButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"mainm_pausemenu.png"] selectedSprite:NULL target:self selector:@selector(mainMenu2)];
    CCMenuItemSprite *storeButton = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"korzina_pausemenu.png"] selectedSprite:NULL target:self selector:@selector(storeMenu2)];
    
    CCMenuPopup *menu = [CCMenuPopup menuWithItems: resumeButton,restartButton, mainmenuButton,storeButton, nil];
    //menu.anchorPoint = ccp(0.5,0.5);
    menu.position = ccp(s.width*0.5,s.height*0.537);
    [menu alignItemsVerticallyWithPadding:25];
    
    resumeButton.position = ccp(0,+50);
    restartButton.position = ccp(-27.5,-20);
    mainmenuButton.position = ccp(+27.5,-20);
    storeButton.position = ccp(0,-90);
    
    CCSprite *statSprite = [CCSprite spriteWithFile:@"pause_window.png"];
    statSprite.scaleY = 0.77;
    statSprite.scaleX = 0.6;
    //statSprite.position = ccp(0,+150);
    
    PopUp *pop = [PopUp popUpWithSprite:menu andWindow: statSprite];
    [self addChild:pop z:1000];
    
    isPaused = YES;
}

-(void)storeMenu2
{
   [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1.5f scene:[StoreScene node] withColor:ccBLACK]];
}

-(void)mainMenu2
{
     isPaused = NO;
     [[CCDirector sharedDirector]replaceScene:[CCTransitionFade transitionWithDuration:1.5f scene:[MainMenu node] withColor:ccBLACK]];
}

-(void)resumeMenu2
{
    isPaused = NO;
    [self schedule:@selector(levelTimerStart:)];
 
    [self unschedule:@selector(Timer:)];
    [self unschedule:@selector(scoreUpdate:)];
    //[self schedule:@selector(Timer:)];
    [self setTimerUpdate];
}
-(void)restartMenu2
{
    isPaused = NO;
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[[self class] node]];
}


@end
