//
//  Game+PowerUpsPanel.m
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

//POWERUPS PANEL
#import "Game+PowerUps.h" 

@implementation Game (PowerUps)

-(void)setPowerUps //КНОПКИ СУПЕРУДАРОВ
{
    grenadePowerUp = [CCSprite spriteWithFile:@"powerup_grenade.png"];
    grenadePowerUp.position = ccp(s.width*1/8,s.height*2.5/16);
    grenadePowerUp.scale = 1.05;
    [self addChild:grenadePowerUp z:10];
    
    /* boxPowerUp = [CCSprite spriteWithFile:@"powerup_box.png"];
     boxPowerUp.position = ccp(s.width*3/8,s.height*2.5/16);
     boxPowerUp.scale = 1.05;
     [self addChild:boxPowerUp z:10];
     */
    box = [BoxPowerUp spriteWithFile:@"powerup_boxing.png"];
    box.position = ccp(s.width*3/8,s.height*2.5/16);
    box.scale = 1.05;
    [self addChild:box z:11];
    
    mechPowerUp = [CCSprite spriteWithFile:@"powerup_mech.png"];
    mechPowerUp.position = ccp(s.width*5/8,s.height*2.5/16);
    mechPowerUp.scale = 1.05;
    [self addChild:mechPowerUp z:10];
    
    boomerangPowerUp = [CCSprite spriteWithFile:@"powerup_boom.png"];
    boomerangPowerUp.position = ccp(s.width*7/8,s.height*2.5/16);
    boomerangPowerUp.scale = 1.05;
    [self addChild:boomerangPowerUp z:10];
}

-(void)powerUpsMoveDown
{
    id bombActionToEase1 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*1/8,s.height*2.5/16 - 120)];
    id bombActionToEase2 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*3/8,s.height*2.5/16 - 120)];
    id bombActionToEase3 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*5/8,s.height*2.5/16 - 120)];
    id bombActionToEase4 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*7/8,s.height*2.5/16 - 120)];
    
    [grenadePowerUp runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase1]];
    [box runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase2]];
    [mechPowerUp runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase3]];
    [boomerangPowerUp runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase4]];
}

-(void)powerUpsMoveBack
{
    //id moveBack = [CCMoveTo actionWithDuration:1.0 position:ccp(0,+120)];
    //[bombPowerUp runAction:[CCEaseOut actionWithAction: moveBack]];
    
    id bombActionToEase1 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*1/8,s.height*2.5/16)];
    id bombActionToEase2 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*3/8,s.height*2.5/16)];
    id bombActionToEase3 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*5/8,s.height*2.5/16)];
    id bombActionToEase4 = [CCMoveTo actionWithDuration:0.6 position:ccp(s.width*7/8,s.height*2.5/16)];
    [grenadePowerUp runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase1]];
    [box runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase2]];
    [mechPowerUp runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase3]];
    [boomerangPowerUp runAction:[CCEaseExponentialOut actionWithAction:bombActionToEase4]];
}

-(void)hidePowerUps
{
    boomerangPowerUp.opacity = 150;
    box.opacity = 150;
    grenadePowerUp.opacity = 150;
    grenadePowerUp.opacity = 150;
}

-(void)showPowerUps
{
    boomerangPowerUp.opacity = 255;
    box.opacity = 255;
    grenadePowerUp.opacity = 255;
    grenadePowerUp.opacity = 255;
}

-(void)setBonusIndicators
{
    /////////////////////////////// BONUSES ///////////////////////////////
    //// GRENADE BONUS LABEL //////////////////////////////////(КОЛИЧЕСТВО БОМБ В СЛОТЕ)
    bombBonusLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    bombBonusLabel.position = ccp(grenadePowerUp.position.x*0.5,grenadePowerUp.position.y*0.5);
    bombBonusLabel.opacity = 250;
    [self addChild:bombBonusLabel z:1000];
    
    //// BOX BONUS LABEL ////////////////////////////(КОЛИЧЕСТВО БОКСЕРСКИХ раундов в СЛОТЕ)
    boxBonusLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    boxBonusLabel.position = ccp(box.position.x*0.5,box.position.y*0.5);
    boxBonusLabel.opacity = 250;
    [self addChild:boxBonusLabel z:1000];
    
    //// MECH BONUS LABEL ///////////////////////////////////////
    mechBonusLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    mechBonusLabel.position = ccp(mechPowerUp.position.x*0.5,mechPowerUp.position.y*0.5);
    mechBonusLabel.opacity = 250;
    [self addChild:mechBonusLabel z:1000];
    
    //// BOOMERANG BONUS LABEL //////////////////////////////(КОЛИЧЕСТВО БУМЕРАНГОВ в СЛОТЕ)
    boomerangBonusLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:20];
    boomerangBonusLabel.position = ccp(boomerangPowerUp.position.x*0.5,boomerangPowerUp.position.y*0.5);
    boomerangBonusLabel.opacity = 250;
    [self addChild:boomerangBonusLabel z:1000];
}



@end
