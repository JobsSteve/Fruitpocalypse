//
//  StoreScene.h
//  Touch_Project
//
//  Created by Артур on 22.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "StoreScrollLayer.h"

@interface StoreScene : CCLayer
{
    StoreScrollLayer* scrollLayer;
	CGSize size;
    
    CCSprite *upComposition;
    CCSprite *downComposition;
    
    
    CCLabelTTF *pageLabel; //НОМЕР СТРАНИЦЫ
    
    CCMenu *menu_cost;
    CCMenu *menu_coins;
    
    CCSprite *temp1;
    
    CCLabelTTF *monetaCountLabel;
    CCLabelTTF *grenadeCountLabel,*boxCountLabel,*boomerangCountLabel,*mechCountLabel;
    
    int coinsCountInt;
    int grenadeCountInt,boxCountInt,boomerangCountInt,mechCountInt;
    //rint allinOneInt;
    
    float countTimer;
    
    NSMutableArray *touchRealSprites;
    NSMutableArray *touchCoinSprites;
    
    /// USER DATA
    int TOTALSCORE;
    
    int monetaTakeInt;
    int bombBonusTake, boxBonusTake, mechBonusTake,boomerangBonusTake;
    
    /// NEXT BUTTON
    CCMenuItemImage *nextItem;
    CCMenu *nextMenu;
    
    
}

@property (nonatomic, retain) StoreScrollLayer* scrollLayer;

+(id) scene;


@end