//
//  LoaderScene.m
//  Touch_Project
//
//  Created by Артур on 19.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoaderScene.h"
#import "TutorScene.h"
#import "Game.h"

#define LOADERTIMER 0.3 //1.2

@implementation LoaderScene

+(CCScene*)scene
{
	CCScene *scene = [CCScene node];
	LoaderScene *layer = [LoaderScene node];
	[scene addChild: layer];

	return scene;
}

- (void) dealloc{
	[super dealloc];
}

-(id) init
{
	if((self=[super init]))
    {
        size = [CCDirector sharedDirector].winSize;
        //loaderIndex = 0;
        
        [self getLoaderDefaults];
        
        
       
     
        
        [self schedule:@selector(loaderTimer:)];
    }
    return self;
}

-(void)bouncingMethod
{
    CCSequence *scalePlay = [CCSequence actions:
                             [CCScaleTo actionWithDuration:1.2 scale:1.00],
                             [CCDelayTime actionWithDuration:.5f],
                             [CCScaleTo actionWithDuration:1.2 scale:1.06],
                             //[CCDelayTime actionWithDuration:.5f],
                             
                             nil];
    
    //CCEaseExponentialInOut *easePlay = [CCEaseExponentialOut actionWithAction:scalePlay];
    //CCEaseBounceOut *easePlay = [CCEaseBounceIn actionWithAction:scalePlay];
    CCEaseElasticOut *easePlay = [CCEaseElasticInOut actionWithAction:scalePlay];
    
    CCRepeatForever *repeatPlay = [CCRepeatForever actionWithAction:easePlay];
    
    [fruit runAction: repeatPlay];
    
}

-(void)setSlideIndicator
{
    
    slotInterface = [CCSprite spriteWithFile:@"blank.png"];
    slotInterface.position = ccp(0,0);
    [self addChild:slotInterface];
    
    for(int i=0;i<4;i++)
    {
        slot = [CCSprite spriteWithFile:@"slider_slot.png"];
        slot.position = ccp(size.width*0.47 +i*slot.contentSize.width*1.25,size.height*0.4);
        [slotInterface addChild:slot z:10];
    }
    /*for (int i = 0; i < carrotsLeft; i++)
     {
     CCSprite *c = [CCSprite spriteWithSpriteFrameName:@"life.png"];
     c.anchorPoint = ccp(1,1);
     c.position = ccp(s.width - i * c.contentSize.width, s.height);
     [carrots addObject:c];
     [self addChild:c z:10];
     }*/
}

-(void)loaderTimer:(ccTime)dt
{
    loadTimer += dt;
    loadEndTimer += dt;
    //CCLOG(@"LOADTIMER == %f",loadTimer);
    if(loadTimer >= 0.3 && loadTimer<=0.6){
        num = 0;
        //slideIndicator.position = ccp(size.width*0.47 +num*slot.contentSize.width*1.25,size.height*0.3);
    }
    else  if(loadTimer >= 0.6 && loadTimer<=0.9){
        num = 1;
        //slideIndicator.position = ccp(size.width*0.47 +num*slot.contentSize.width*1.25,size.height*0.3);
    }
    else  if(loadTimer >= 0.9 && loadTimer<=1.2){
        num = 2;
    }
    else  if(loadTimer >= 1.2 && loadTimer<=1.6){
        num = 3;
    }
    else if(loadTimer >= 1.5){
        loadTimer = 0;
    }
    
    slideIndicator.position = ccp(size.width*0.47 +num*slot.contentSize.width*1.25,size.height*0.4);
    
    if(loadEndTimer >= 5.0f)
    {
        [self transition];
        
        [self runAction:[CCSequence actions:
                         [CCCallFunc actionWithTarget:self selector:@selector(loaderSchedulerStop)],
                         [CCCallFunc actionWithTarget:self selector:@selector(removeFruit)],
                         [CCDelayTime actionWithDuration:0.5],
                         [CCCallFunc actionWithTarget:self selector:@selector(transition)],nil]];
    }
}

-(void)removeFruit
{
    [self removeChildByTag:100 cleanup:YES];
    //[self removeFromParentAndCleanup:YES];
}

-(void)loaderSchedulerStop
{
     [self unschedule:@selector(loaderTimer:)];
}

-(void)transition
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.9 scene:[Game node] withColor:ccBLACK]];
    
}

-(void)getLoaderDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    loaderIndex = [userDefaults integerForKey:@"loaderKey"];
    [userDefaults synchronize];
    
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:0.5],
                     [CCCallFunc actionWithTarget:self selector:@selector(setLoaderAssets)],nil]];
}

-(void)setLoaderAssets
{
    [self setSlideIndicator];
    [self setRandomFruit];
}


-(void)setLoaderDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:loaderIndex forKey:@"loaderKey" ];
    [userDefaults synchronize];
}

-(void)setRandomFruit
{
      NSArray *fruitLoader = [NSArray arrayWithObjects:@"load_yagoda.png",@"load_malina.png",@"load_vishenka.png",@"load_lemon.png",@"load_tomat.png",@"load_ananas.png",nil];
    
     //CCArray *fruitLoader = [CCArray arrayWithNSArray: @"load_yagoda.png",@"load_malina.png",@"load_vishenka.png",@"load_lemon.png",@"load_tomat.png",@"load_ananas.png",nil];
    
    //int i = CCRANDOM_0_1()*5;
    
    loaderIndex = loaderIndex+1;
    if(loaderIndex>5)
    {
        loaderIndex=0;
    }
    
    [self setLoaderDefaults];
    
    CCLOG(@"LOADER INDEX = %d",loaderIndex);
    
    //loaderIndex = 4;
    
    ////////////// ВЫБИРАЕМ
    NSString *image = [fruitLoader objectAtIndex:loaderIndex];
    fruit =  [CCSprite spriteWithFile:image];
    [self addChild:fruit z:100 tag:100];
    fruit.scale = 1.06;
    //fruit.opacity = 0;
    
    
    if(loaderIndex == 0)
    {
        slideIndicator = [CCSprite spriteWithFile:@"indicator_yagoda.png"];
        [slotInterface addChild:slideIndicator z:11];
        fruit.position = ccp(size.width*0.5,size.height*0.51);
    }
    else if(loaderIndex == 1)
    {
        slideIndicator = [CCSprite spriteWithFile:@"indicator_malina.png"];
        [slotInterface addChild:slideIndicator z:11];
        fruit.position = ccp(size.width*0.5,size.height*0.5);
    }
    else if(loaderIndex == 2)
    {
        slideIndicator = [CCSprite spriteWithFile:@"indicator_vishenka.png"];
        [slotInterface addChild:slideIndicator z:11];
        fruit.position = ccp(size.width*0.5,size.height*0.51);
    }
    else if(loaderIndex == 3)
    {
        slideIndicator = [CCSprite spriteWithFile:@"indicator_lemon.png"];
        [slotInterface addChild:slideIndicator z:11];
        fruit.position = ccp(size.width*0.5,size.height*0.51);
    }
    else if(loaderIndex == 4)
    {
        slideIndicator = [CCSprite spriteWithFile:@"indicator_tomat.png"];
        [slotInterface addChild:slideIndicator z:11];
        fruit.position = ccp(size.width*0.5,size.height*0.5);
    }
    else 
    {
        slideIndicator = [CCSprite spriteWithFile:@"indicator_ananas.png"];
        [slotInterface addChild:slideIndicator z:11];
        fruit.position = ccp(size.width*0.48,size.height*0.6);
    }
    
    [self bouncingMethod];
}


@end
