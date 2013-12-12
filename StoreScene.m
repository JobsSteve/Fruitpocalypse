//
//  StoreScene.m
//  Touch_Project
//
//  Created by Артур on 22.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "StoreScene.h"
#import "Game.h"

#import "LoaderScene.h"
@implementation StoreScene

@synthesize scrollLayer;

+(id) scene
{
	CCScene *scene = [CCScene node];
	StoreScene *layer = [StoreScene node];
	[scene addChild: layer];
    
	return scene;
}

- (void) dealloc
{
    //[touchRealSprites release];
    //touchRealSprites = nil;
	[super dealloc];
}

-(id) init
{
	if( (self=[super init] )) 
    {
		size = [[CCDirector sharedDirector] winSize];
        
        [self setPanels];
        
        
        self.scrollLayer = [StoreScrollLayer node];
		self.scrollLayer.contentSize = CGSizeMake(250, 65);
		self.scrollLayer.position = ccp( size.width /2 , size.height/2 );
		self.scrollLayer.pageSize = 10;
		NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
		CCSprite* temp;
        
        
        temp = [CCSprite node];
		//temp.color = ccYELLOW;
        temp = [CCSprite spriteWithFile:@"slot_default.png"];
        temp.scale = 0.97;
        
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
		temp = [CCSprite node];
		//temp.color = ccYELLOW;
        temp = [CCSprite spriteWithFile:@"slot_default.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
		temp = [CCSprite node];
		//temp.color = ccRED;
        temp = [CCSprite spriteWithFile:@"slot_allinone.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
        temp = [CCSprite node];
		//temp.color = ccBLUE;
        temp = [CCSprite spriteWithFile:@"slot_boomerang.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
		temp = [CCSprite node];
		//temp.color = ccGRAY;
        temp = [CCSprite spriteWithFile:@"slot_mech.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
		temp = [CCSprite node];
		//temp.color = ccGREEN;
        temp = [CCSprite spriteWithFile:@"slot_box.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
        temp = [CCSprite node];
		//temp.color = ccORANGE;
        
        temp1 = [CCSprite spriteWithFile:@"slot_grenade.png"];
        temp1.scale = 0.97;
		temp1.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp1];
        
        
        
        temp = [CCSprite node];
		//temp.color = ccMAGENTA;
        temp = [CCSprite spriteWithFile:@"slot_default.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
        temp = [CCSprite node];
		//temp.color = ccYELLOW;
        temp = [CCSprite spriteWithFile:@"slot_default.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
        temp = [CCSprite node];
		//temp.color = ccYELLOW;
        temp = [CCSprite spriteWithFile:@"slot_default.png"];
        temp.scale = 0.97;
		temp.textureRect = CGRectMake(0, 0, 250, 66);
		[array addObject:temp];
        
        
		scrollLayer.arrayPages = array;
		scrollLayer.pageSize = 10;
		scrollLayer.currentPage = 5;
		[scrollLayer makePages];
		[self addChild:self.scrollLayer];
        
        
        coinsCountInt = 0;
        grenadeCountInt = 0;
        boxCountInt = 0;
        boomerangCountInt = 0;
        mechCountInt = 0;
        
        
        [self setCostButtons];
        [self setCoinButtons];
        
        [self setCountsParameters];
        
        [self setPageNumberLabel];
        [self schedule:@selector(pageNumberUpdate:)];
        
        [self schedule:@selector(countsTimer:)];
        
        [self getUserDefaults];
        //[self setUserDefaults];
        
        [self displayNext];
        
    }
	return self;
}

-(void)getUserDefaults //берем из UserDefaults в ПЕРЕМЕННЫЕ
{
    //1 ВЫТАСКИВАЕМ значения из NSUserDefaults и присваиваем переменным
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    TOTALSCORE = [userDefaults integerForKey:@"scoreKey"];
    //LEVELNUMBER = [userDefaults integerForKey:@"LEVELKEY"];
    
    if(TOTALSCORE > 0) //уже начинали ИГРУ
    {
        //kulakScoreInt = [userDefaults integerForKey:@"kulakKey"];
        //grenadeScoreInt = [userDefaults integerForKey:@"grenadeKey"];
        //boxScoreInt = [userDefaults integerForKey:@"boxKey"];
        //boomerangScoreInt = [userDefaults integerForKey:@"boomerangKey"];
        //mechScoreInt = [userDefaults integerForKey:@"mechKey"];
        
        //КОЛИЧЕСТВО монеток и суперударов
        monetaTakeInt = [userDefaults integerForKey:@"monetasCountKey"];
        
        bombBonusTake = [userDefaults integerForKey:@"grenadeCountKey"];
        boxBonusTake = [userDefaults integerForKey:@"boxCountKey"];
        boomerangBonusTake = [userDefaults integerForKey:@"boomerangCountKey"];
        mechBonusTake = [userDefaults integerForKey:@"mechCountKey"];
        
        //LEVELNUMBER = [userDefaults integerForKey:@"LEVELKEY"];
        //monetasInt = [userDefaults integerForKey:@"monetasKey"];
    }
    [userDefaults synchronize];
}

-(void)setUserDefaults
{
    // Сохранить результаты в UserDefaults
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setInteger:TOTALSCORE forKey:@"scoreKey"];
    
    //[userDefaults setInteger:kulakScoreInt forKey:@"kulakKey"];
    //[userDefaults setInteger:grenadeScoreInt forKey:@"grenadeKey"];
    //[userDefaults setInteger:boxScoreInt forKey:@"boxKey"];
    //[userDefaults setInteger:boomerangScoreInt forKey:@"boomerangKey"];
    //[userDefaults setInteger:mechScoreInt forKey:@"mechKey"];
    
    //[userDefaults setInteger:LEVELNUMBER forKey:@"LEVELKEY"];
    
    [userDefaults setInteger:monetaTakeInt forKey:@"monetasCountKey"];
    [userDefaults setInteger:bombBonusTake forKey:@"grenadeCountKey"];
    [userDefaults setInteger:boxBonusTake forKey:@"boxCountKey"];
    [userDefaults setInteger:boomerangBonusTake forKey:@"boomerangCountKey"];
    [userDefaults setInteger:mechBonusTake forKey:@"mechCountKey"];
    
    //[userDefaults setBool:isMusicOn forKey:@""];
    
    [userDefaults synchronize];
}

-(void)countsTimer:(ccTime)dt
{
    //countTimer += dt;
    //[coinsCountLabel setString:[NSString stringWithFormat:@"%d",coinsCountInt]];
    [monetaCountLabel setString:[NSString stringWithFormat:@"%d",monetaTakeInt]];
    if(monetaTakeInt > 999){
        monetaCountLabel.scale = 0.9;
    }
    if(monetaTakeInt > 9999){
        monetaCountLabel.scale = 0.7;
    }
    
    [grenadeCountLabel setString:[NSString stringWithFormat:@"%d",bombBonusTake]];
    [boxCountLabel setString:[NSString stringWithFormat:@"%d",boxBonusTake]];
    [boomerangCountLabel setString:[NSString stringWithFormat:@"%d",boomerangBonusTake]];
    [mechCountLabel setString:[NSString stringWithFormat:@"%d",mechBonusTake]];
    
}


-(void)setPanels
{
    upComposition = [CCSprite spriteWithFile:@"up_composition.png"];
    upComposition.position = ccp(size.width*0.48,size.height - upComposition.contentSize.height*0.48);
    upComposition.scale = 0.97;
    [self addChild:upComposition z:100];
    
    downComposition = [CCSprite spriteWithFile:@"down_composition.png"];
    downComposition.position = ccp(size.width*0.47,0 + downComposition.contentSize.height/2);
    downComposition.scale = 1.05;
    [self addChild:downComposition z:110];
    
}

-(void)setCostButtons
{
    CCSprite *costGrenade = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costGrenadeSprite = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costBox = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costBoxSprite = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costMech = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costMechSprite = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costBoomerang = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costBoomerangSprite = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costAllinOneSprite = [CCSprite spriteWithFile:@"cost_0_99.png"];
    CCSprite *costAllinOne = [CCSprite spriteWithFile:@"cost_0_99.png"];
    //CCSprite *cost1 = [CCSprite spriteWithFile:@"cost_1_99.png"];
    //CCSprite *cost2 = [CCSprite spriteWithFile:@"cost_2_99.png"];
    
    CCMenuItemSprite *costGrenadeItem = [CCMenuItemSprite itemFromNormalSprite:costGrenadeSprite selectedSprite:costGrenade target:self selector:@selector(buyforRealGrenade)];
    costGrenadeItem.scale = 0.9;
    CCMenuItemSprite *costBoxItem = [CCMenuItemSprite itemFromNormalSprite:costBoxSprite selectedSprite:costBox target:self selector:@selector(buyforRealBox)];
    costBoxItem.scale = 0.9;
    CCMenuItemSprite *costBoomerangItem = [CCMenuItemSprite itemFromNormalSprite:costBoomerangSprite selectedSprite:costBoomerang target:self selector:@selector(buyforRealBoomerang)];
    costBoomerangItem.scale = 0.9;
    CCMenuItemSprite *costMechItem = [CCMenuItemSprite itemFromNormalSprite:costMechSprite selectedSprite:costMech target:self selector:@selector(buyforRealMech)];
    costMechItem.scale = 0.9;
    CCMenuItemSprite *costAllinOneItem = [CCMenuItemSprite itemFromNormalSprite:costAllinOneSprite selectedSprite:costAllinOne target:self selector:@selector(buyforRealAllinOne)];
    costAllinOneItem.scale = 0.9;
    
    menu_cost = [CCMenu menuWithItems:costGrenadeItem,costBoxItem,costMechItem,costBoomerangItem,costAllinOneItem, nil];
    //menu_cost = [CCMenu menuWithItems:costGrenadeItem,costBoxItem, nil];
    menu_cost.position = ccp(size.width*0.35,-size.height*0.213);
    //[menu_cost alignItemsVerticallyWithPadding:29.0f ];
    [menu_cost alignItemsVerticallyWithPadding:32.5f ];
    //[self addChild:menu];
    [temp1 addChild:menu_cost z:1000];
}

-(void)buyforRealGrenade{
    CCLOG(@"!!! GRENADE 0.99$ !!!");
}
-(void)buyforRealBox{
    CCLOG(@"!!! BOX 0.99$ !!!");
}
-(void)buyforRealMech{
    CCLOG(@"!!! MECH 0.99$ !!!");
}
-(void)buyforRealBoomerang{
    CCLOG(@"!!! BOOMERANG 0.99$ !!!");
}
-(void)buyforRealAllinOne{
    CCLOG(@"!!! ALL-IN-ONE 1.99$ !!!");
}

-(void)setCoinButtons
{
    
    CCSprite *coins120 = [CCSprite spriteWithFile:@"coins_120.png"];
    CCSprite *coins130 = [CCSprite spriteWithFile:@"coins_130.png"];
    CCSprite *coins140 = [CCSprite spriteWithFile:@"coins_140.png"];
    CCSprite *coins150 = [CCSprite spriteWithFile:@"coins_150.png"];
    CCSprite *coins300 = [CCSprite spriteWithFile:@"coins_300.png"];
    CCSprite *coins120Sprite = [CCSprite spriteWithFile:@"coins_120.png"];
    CCSprite *coins130Sprite = [CCSprite spriteWithFile:@"coins_130.png"];
    CCSprite *coins140Sprite = [CCSprite spriteWithFile:@"coins_140.png"];
    CCSprite *coins150Sprite = [CCSprite spriteWithFile:@"coins_150.png"];
    CCSprite *coins300Sprite = [CCSprite spriteWithFile:@"coins_300.png"];
    
    
    CCMenuItemSprite *coinsGrenadeItem = [CCMenuItemSprite itemFromNormalSprite:coins120Sprite selectedSprite:coins120 target:self selector:@selector(buyforCoinsGrenade)];
    CCMenuItemSprite *coinsBoxItem = [CCMenuItemSprite itemFromNormalSprite:coins130Sprite selectedSprite:coins130 target:self selector:@selector(buyforCoinsBox)];
    CCMenuItemSprite *coinsBoomerangItem = [CCMenuItemSprite itemFromNormalSprite:coins140Sprite selectedSprite:coins140 target:self selector:@selector(buyforCoinsBoomerang)];
    CCMenuItemSprite *coinsMechItem = [CCMenuItemSprite itemFromNormalSprite:coins150Sprite selectedSprite:coins150 target:self selector:@selector(buyforCoinsMech)];
    CCMenuItemSprite *coinsAllinOneItem = [CCMenuItemSprite itemFromNormalSprite:coins300Sprite selectedSprite:coins300 target:self selector:@selector(buyforCoinsAllinOne)];
    
    menu_coins = [CCMenu menuWithItems:coinsGrenadeItem,coinsBoxItem,coinsMechItem,coinsBoomerangItem,coinsAllinOneItem, nil];
    menu_coins.position = ccp(size.width*0.59,-size.height*0.212);
    [menu_coins alignItemsVerticallyWithPadding:22.99f ];
    //[self addChild:menu];
    [temp1 addChild:menu_coins z:1001];
}

-(void)buyforCoinsGrenade{
    CCLOG(@"!!! GRENADE 120coins !!!");
    if(monetaTakeInt > 120)
    {
        //coinsCountInt = coinsCountInt - 120;
        monetaTakeInt = monetaTakeInt - 120;
        //grenadeCountInt = grenadeCountInt + 5;
        bombBonusTake = bombBonusTake + 5;
    }
}
-(void)buyforCoinsBox{
    CCLOG(@"!!! BOX 130coins !!!");
    if(monetaTakeInt > 130)
    {
        monetaTakeInt = monetaTakeInt - 130;
        boxBonusTake = boxBonusTake + 5;
    }
}
-(void)buyforCoinsMech{
    CCLOG(@"!!! MECH 140coins !!!");
    if(monetaTakeInt > 140)
    {
        monetaTakeInt = monetaTakeInt - 140;
        mechBonusTake = mechBonusTake + 5;
    }
    
}
-(void)buyforCoinsBoomerang{
    CCLOG(@"!!! BOOMERANG 150coins !!!");
    if(monetaTakeInt > 150)
    {
        monetaTakeInt = monetaTakeInt - 150;
        boomerangBonusTake = boomerangBonusTake + 5;
    }
}
-(void)buyforCoinsAllinOne{
    if(monetaTakeInt > 300)
    {
        monetaTakeInt = monetaTakeInt - 300;
        bombBonusTake = bombBonusTake + 5;
        boxBonusTake = boxBonusTake+ 5;
        mechBonusTake = mechBonusTake + 5;
        boomerangBonusTake = boomerangBonusTake + 5;
    }
}

-(void)setCountsParameters
{
    // количество МОНЕТОК
    monetaCountLabel = [CCLabelTTF labelWithString:@"00" fontName:@"SQUARE" fontSize:18];
    monetaCountLabel.color = ccBLACK;
    monetaCountLabel.anchorPoint = ccp(0.5,0.5);
    monetaCountLabel.position = ccp(size.width*0.48, size.height*0.865);
    [self addChild:monetaCountLabel z:200];
    
    // количиство СУПЕРУДАРОВ в СЛОТАХ
    grenadeCountLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:18];
    grenadeCountLabel.color = ccBLACK;
    grenadeCountLabel.anchorPoint = ccp(0.5,0.5);
    grenadeCountLabel.position = ccp(size.width*0.21, size.height*0.035);
    [self addChild:grenadeCountLabel z:201];
    
    boxCountLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:18];
    boxCountLabel.color = ccBLACK;
    boxCountLabel.anchorPoint = ccp(0.5,0.5);
    boxCountLabel.position = ccp(size.width*0.38, size.height*0.035);
    [self addChild:boxCountLabel z:202];
    
    boomerangCountLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:18];
    boomerangCountLabel.color = ccBLACK;
    boomerangCountLabel.anchorPoint = ccp(0.5,0.5);
    boomerangCountLabel.position = ccp(size.width*0.552, size.height*0.035);
    [self addChild:boomerangCountLabel z:202];
    
    mechCountLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:18];
    mechCountLabel.color = ccBLACK;
    mechCountLabel.anchorPoint = ccp(0.5,0.5);
    mechCountLabel.position = ccp(size.width*0.73, size.height*0.035);
    [self addChild:mechCountLabel z:202];
    
}

-(void)setPageNumberLabel
{
    pageLabel = [CCLabelTTF labelWithString:@"page:0" fontName:@"Marker Felt" fontSize:25];
    pageLabel.color = ccWHITE;
    pageLabel.position = ccp(size.width*0.5,size.height*0.6);
    [self addChild:pageLabel z:100];
    
}

-(void)pageNumberUpdate:(ccTime)dt
{
    [pageLabel setString:[NSString stringWithFormat:@"page:%d",self.scrollLayer.currentPage]];
    
    if(scrollLayer.currentPage > 7){
        scrollLayer.currentPage = 7;
    }
    if(scrollLayer.currentPage < 2){
        scrollLayer.currentPage = 2;
    }
}

#pragma mark < NEXT BUTTON >

-(void)displayNext
{
    nextItem = [CCMenuItemImage itemFromNormalImage:@"next_BUTTON.png" 
                                      selectedImage:@"next_BUTTON.png"
                                             target:self selector:@selector(nextItem)];
    
    nextMenu = [CCMenu menuWithItems:nextItem, nil];
    nextMenu.scale = 0.9;
    //[mainMenu setPosition:CGPointZero];
    nextMenu.position = ccp(size.width*0.88,size.height*0.055);
    [self addChild:nextMenu z:10];
}

-(void)nextItem
{
    [self setUserDefaults]; //СИНХРОНИЗИРУЕМ ПОКУПКИ
    
    [CCCallFunc actionWithTarget:self selector:@selector(chooseFruit)],
    [nextItem runAction:[CCScaleTo actionWithDuration:0.35 scale:1.06]];
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:0.65],
                     [CCCallFunc actionWithTarget:self selector:@selector(transition)]
                     ,nil]];
}

-(void)transition
{
 
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.8 scene:[LoaderScene node] withColor:ccBLACK]];
}



@end