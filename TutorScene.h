//
//  TutorScene.h
//  Touch_Project
//
//  Created by Артур on 19.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "ScrollLayer.h"


@interface TutorScene : CCScene
{
    ScrollLayer* scrollLayer;
    CGSize size;
    
    float  conditionTimer;
    CCSprite *slideToSprite;
    
    BOOL tutor0BOOL;
    BOOL tut0BOOL;
    
    CCSprite *tempSprite;
    
    BOOL tutor3BOOL;
    BOOL tut3BOOL;
    
    CCSprite *slideIndicator;
    CCSprite* slot;
    
    BOOL page1Bool;
    BOOL page2Bool;
    BOOL page3Bool;
}

@property (nonatomic, retain) ScrollLayer* scrollLayer;

//+(id) scene;

@end