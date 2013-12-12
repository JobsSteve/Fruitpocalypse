//
//  MainMenu.h
//  Touch_Project
//
//  Created by Артур on 18.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "cocos2d.h"

@class AppDelegate;

@interface MainMenu : CCLayer
{
    CGSize s;
    AppDelegate *delegate;
    
    CCSprite *playSprite;
    
    CCSprite *headSprite;
    CCSprite *whiteroundSprite;
    CCSprite *arrowSprite;
    
    
    CCSprite *mainheadSprite;
    
    CCSprite *towardFruits;
    CCSprite *backwardFruits;
    
    CCSprite *titleSprite;
    
    
    
    //OPTION BUTTON
    BOOL isOptionsButtonSelected;
    BOOL isResetSelected;
    BOOL isMusicOn;
    BOOL isSoundsOn;
    
    
    CCMenu *optionsMenu;
    CCMenuItemToggle *optionsToggle;
    
    
    CCMenuItemImage *optionsButtonOn;
    
    //MUSIC On/Off
    CCMenuItemImage *musicOn,*musicOff;
    CCMenuItemImage *soundsOn,*soundsOff;
    
    CCMenuItemImage *resetButtonOn;
    //CCMenuItemImage *resetButtonYes;
    CCMenuItemToggle *resetToggle;
    CCMenu *resetMenu;
    
    CCMenuItemImage *resetNoItem,*resetYesItem;
    
    CCMenu *playMenu;
    CCMenuItemImage *playItem;
    
    
    // USER DEFAULTS
    NSInteger kulakKeyInt,grenadeKeyInt,boxKeyInt,boomerangKeyInt,mechKeyInt;
    NSInteger scoreKeyInt;
 
    NSInteger LEVELKEYINT;
   
    
    BOOL musicKeyOn,soundsKeyOn;
    BOOL INTROTUTKEY,INTERTUTKEY;
    
    NSInteger monetasCountInt;
    NSInteger killCountInt;
    NSInteger grenadeCountInt, boxCountInt, boomerangCountInt, mechCountInt;
    
    // DATA LABELS
    CCLabelTTF *totalScoreLabel, *kulakScoreLabel,*grenadeScoreLabel,*boxScoreLabel,*boomerangScoreLabel,*mechScoreLabel;
    CCLabelTTF *LevelNumLabel;
    CCLabelTTF *musicBoolLabel, *soundBoolLabel;
   
    CCLabelTTF *monetasCountLabel;
    CCLabelTTF *killCountLabel;
    CCLabelTTF *grenadeCountLabel, *boxCountLabel, *boomerangCountLabel, *mechCountLabel;
    
   
    
    
}

+(CCScene*)scene;

@end