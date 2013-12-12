//
//  Fruit.h
//  Touch_Project
//
//  Created by Артур on 04.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
@class AppDelegate;

@interface Fruit : CCSprite
{
    CGSize s;
    bool isUp;
    
     AppDelegate *delegate;
    
    int lifesInt;
    
    //CCLabelTTF *displayLabel;
    CCLabelTTF *displayLabel;
    
    int indexInt;
    
   // CCParticleExplosion *explosion;
    CGPoint explosionPosition;
    
    //// BONUSES
    BOOL bombBonusBOOL;
    BOOL boxBonusBOOL;
    BOOL mechBonusBOOL;
    BOOL boomerangBonusBOOL;
    
    int bombBonusInt;
    int boxBonusInt;
    int mechBonusInt;
    int boomerangBonusInt;
    
    float timerBonus;
    BOOL bonusDone;
    
    //// MONETAS
    BOOL monetaSmallBOOL, moneatMiddleBOOL, monetaBigBOOL;
    float timerMoneta;
    BOOL monetaDone;
    
    //// BUDILNIK
    BOOL budilnikSmallBOOL, budilnikMiddleBOOL, budilnikBigBOOL;
    float budilnikStop;
    float timerBudilnik;
    BOOL budilnikDone;
    
    //Game *game;
    CCSequence *sequenceAction;
    
    //VISHNYA
    CCSprite *vishnyaLeft;
    CCSprite *vishnyaRight;
    
    CCRepeatForever *repeatAction;
    CCRepeatForever *repeatAction2;
    
    //YAGODA
    CCSprite *yagodaLeft;
    CCSprite *yagodaRight;
    
    //MALINA
    CCSprite *malinaLeft;
    CCSprite *malinaRight;
    
    //LIMON
    CCSprite *limonLeft;
    CCSprite *limonRight;
    
    //POMIDOR
    CCSprite *pomidorLeft;
    CCSprite *pomidorRight;
    
    //ANANAS
    CCSprite *ananasLeft;
    CCSprite *ananasRight;
    
    //ПЕРЕМЕННАЯ 
    float SPEED_PARAM;
    
    BOOL bigBOOL;
    
    @public
    CGRect bbox;
}


-(BOOL)getBudilnikDone;
-(BOOL)getMonetaDone;
-(BOOL)getBonusDone;

-(void)displayLifes;
-(void)wasTapped;

-(int)getLifes;
-(int)getIndex;

-(void)explosionEffect;
-(void)wasPowerUpTapped;


//BONUSES
-(BOOL)getBombBonusBOOL;
-(BOOL)getBoxBonusBOOL;
-(BOOL)getMechBonusBOOL;
-(BOOL)getBoomerangBonusBOOL;
-(BOOL)getMonetaSmallBOOL;
-(BOOL)getMonetaMiddleBOOL;
-(BOOL)getMonetaBigBOOL;
-(BOOL)getBudilnikSmallBOOL;
-(BOOL)getBudilnikMiddleBOOL;
-(BOOL)getBudilnikBigBOOL;






@end
