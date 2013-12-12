//
//  Game+AdditionalMethods.m
//  Touch_Project
//
//  Created by Артур on 20.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+AdditionalMethods.h"

@implementation Game (AdditionalMethods) 

#pragma mark -----------------------------

-(void)blackForeground
{
    //// ЗАТЕМНЕНИЕ ///////////////////
    bgBlack = [CCSprite node];
    bgBlack.color = ccBLACK;
    bgBlack.opacity = 0;
    [bgBlack setTextureRect:CGRectMake(0, 0, s.width, s.height)];
    bgBlack.anchorPoint = ccp(0,0);
    [self addChild:bgBlack z:1000];
}

-(void)boundaryBox
{
    boundaryBox = [CCSprite node];
    boundaryBox.color = ccYELLOW;
    boundaryBox.opacity = 0;
    [boundaryBox setTextureRect:CGRectMake(0,0, s.width, s.height*0.75)];
    //boundaryBox.anchorPoint = ccp(0,1);
    boundaryBox.position = ccp(s.width/2,s.height*6/10);
    [self addChild:boundaryBox z:110];
}

-(void)didScore
{
    score++;
    
    [scoreLabel runAction:[CCSequence actions:
                     [CCScaleTo actionWithDuration:0.2 scale:1.35],
                     [CCScaleTo actionWithDuration:0.05 scale:1.05],nil]];
    
    [scoreLabel setString:[NSString stringWithFormat:@"%i",score]]; 
}

-(void)didCountFruits
{
    int countFruits = [fruitsArray count];
    [countLabel setString:[NSString stringWithFormat:@"%i",countFruits]]; 
}

-(void)setAdsBanner
{
    //// REMOVE ADS ///////////////////
    CCSprite *removeAds = [CCSprite spriteWithFile:@"iads_admob.png"];
    removeAds.position = ccp(removeAds.contentSize.width/2,removeAds.contentSize.height/2);
    [self addChild:removeAds];
    
    //// GRIDS //////////////////////
    CCSprite *gridSprite = [CCSprite spriteWithFile:@"game_field.png"];
    gridSprite.position = ccp(s.width/2,s.height*5.5/10);
    //[self addChild:gridSprite];
}

#pragma mark < Delegates >
-(void)enableTouch
{
    [[CCTouchDispatcher sharedDispatcher] addStandardDelegate:self priority:0];
}

-(void)disableTouch
{
    [[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
}





@end
