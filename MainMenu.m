
//
//  MainMenu.m
//  Touch_Project
//
//  Created by Артур on 18.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import "MainMenu.h"

#import "Game.h"
#import "TutorScene.h"
#import "LoaderScene.h"

#import "AppDelegate.h"
#import "SimpleAudioEngine.h"
#import "LevelConfigs.h"

@implementation MainMenu

- (void)dealloc
{
    [super dealloc];
}

-(void)onEnterTransitionDidFinish
{
    //[[CCTouchDispatcher sharedDispatcher] addStandardDelegate:self priority:0];
    //[[[CCDirector sharedDirector] openGLView] setMultipleTouchEnabled:YES];
    
    [self initializeGame];
} 

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	MainMenu *layer = [MainMenu node];
	[scene addChild: layer];
	
	return scene;
}

- (id)init
{
    if((self=[super init]))
    {
        delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [[CCDirector sharedDirector] resume];
        s = [[CCDirector sharedDirector] winSize];
        //self.isTouchEnabled = YES;
        
        isOptionsButtonSelected = NO;
        isResetSelected = NO;
        isMusicOn = YES;
        isSoundsOn = YES;
        
        
        [self setComposition];
        [self arrowMethod];
        [self headMethod];
        
        [self displayPlay];
        [self displayOptions];
        [self displayReset];
        
        [self displayStore];
        //[self displayGameCenter];
        [self displayVopros];
        
        //[self displayMarketingMix];
        
        //DATA
        [self setUserDefaults];
        //[self setDataLabel];
        [self schedule:@selector(userDataUpdate:)];
        
        
        [self playMethod];

    }
    return self;
}

#pragma mark < AUDIO >
-(void)initializeGame
{
    [self setSounds];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    isMusicOn = [userDefaults boolForKey:@"musicKey"];
    
    if(isMusicOn == YES){
        [self startMusicTheme];
    }
}
-(void)setSounds
{
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"pat_the_gorf_1.mp3"];
}

-(void)startMusicTheme
{
    //// MUSIC BACKGROUND 
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"pat_the_gorf_1.mp3" loop:YES];
    
   
}

-(void)stopMusicTheme
{
    [[SimpleAudioEngine sharedEngine] stopBackgroundMusic];
}

#pragma mark < USER DATA >
-(void)setUserDefaults
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    scoreKeyInt = [userDefaults integerForKey:@"scoreKey"];
    CCLOG(@"SCORE_KEY %d",scoreKeyInt);
    
    if(scoreKeyInt>0) //ВЫТАСКИВАЕМ
    {
        kulakKeyInt = [userDefaults integerForKey:@"kulakKey"];
        grenadeKeyInt = [userDefaults integerForKey:@"grenadeKey"];
        boxKeyInt = [userDefaults integerForKey:@"boxKey"];
        boomerangKeyInt = [userDefaults integerForKey:@"boomerangKey"];
        mechKeyInt = [userDefaults integerForKey:@"mechKey"];
        
        isMusicOn = [userDefaults boolForKey:@"musicKey"];
        isSoundsOn = [userDefaults boolForKey:@"soundKey"];
        
        LEVELKEYINT = [userDefaults integerForKey:@"LEVELKEY"];
         
        //MONETAS and POWERUPS COUNTs KEYs
        monetasCountInt = [userDefaults integerForKey:@"monetasCountKey"];
        killCountInt = [userDefaults integerForKey:@"killCountKey"];
        
        grenadeCountInt = [userDefaults integerForKey:@"grenadeCountKey"];
        boxCountInt = [userDefaults integerForKey:@"boxCountKey"];
        boomerangCountInt = [userDefaults integerForKey:@"boomerangCountKey"];
        mechCountInt = [userDefaults integerForKey:@"mechCountKey"];
    
    }
    else 
    {
        //ЗАНОСИМ ДАННЫЕ
        [userDefaults setInteger:100 forKey:@"scoreKey"]; //ИТОГОВЫЕ ОЧКИ
        
        [userDefaults setInteger:0 forKey:@"kulakKey"]; //ОЧКИ по УДАРАМ
        [userDefaults setInteger:0 forKey:@"grenadeKey"];
        [userDefaults setInteger:0 forKey:@"boxKey"];
        [userDefaults setInteger:0 forKey:@"boomerangKey"];
        [userDefaults setInteger:0 forKey:@"mechKey"];
        
        [userDefaults setInteger:101 forKey:@"LEVELKEY"]; //НОМЕР УРОВНЯ
        
        //[userDefaults setBool:YES forKey:@"musicKey"];
        //[userDefaults setBool:YES forKey:@"soundKey"];
        
        [userDefaults setInteger:0 forKey:@"monetasCountKey"]; //количество МОНЕТ
        [userDefaults setInteger:0 forKey:@"killCountKey"];
         
        [userDefaults setInteger:5 forKey:@"grenadeCountKey"];
        [userDefaults setInteger:5 forKey:@"boxCountKey"];
        [userDefaults setInteger:5 forKey:@"boomerangCountKey"];
        [userDefaults setInteger:5 forKey:@"mechCountKey"];
        
        //СОХРАНЯЕМ в ПЕРЕМЕННЫЕ
        scoreKeyInt = [userDefaults integerForKey:@"scoreKey"];
        
        kulakKeyInt = [userDefaults integerForKey:@"kulakKey"];
        grenadeKeyInt = [userDefaults integerForKey:@"grenadeKey"];
        boxKeyInt = [userDefaults integerForKey:@"boxKey"];
        boomerangKeyInt = [userDefaults integerForKey:@"boomerangKey"];
        mechKeyInt = [userDefaults integerForKey:@"mechKey"];
        
        isMusicOn = [userDefaults boolForKey:@"musicKey"];
        isSoundsOn = [userDefaults boolForKey:@"soundKey"];
        
        LEVELKEYINT = [userDefaults integerForKey:@"LEVELKEY"];
        
        //MONETAS and POWERUPS COUNTs KEYs
        monetasCountInt = [userDefaults integerForKey:@"monetasCountKey"];
        
        grenadeCountInt = [userDefaults integerForKey:@"grenadeCountKey"];
        boxCountInt = [userDefaults integerForKey:@"boxCountKey"];
        boomerangCountInt = [userDefaults integerForKey:@"boomerangCountKey"];
        mechCountInt = [userDefaults integerForKey:@"mechCountKey"];
        
        [userDefaults synchronize]; //НУЖНО на ВЫХОДЕ
    }
    
    isMusicOn = [userDefaults boolForKey:@"musicKey"];
    isSoundsOn = [userDefaults boolForKey:@"soundKey"];
    
}

-(void)setDataLabel
{
    CCSprite *temp = [CCSprite node];
    temp.textureRect = CGRectMake(0, 0, 320, 200);
    temp.color = ccGRAY;
    temp.opacity = 155;
    temp.position = ccp(s.width/2,s.height*0.8);
    [self addChild:temp z:1000];
    
    totalScoreLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    totalScoreLabel.position = ccp(s.width*0.25,s.height*0.96);
    [self addChild:totalScoreLabel z:1100];
    
    kulakScoreLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    kulakScoreLabel.position = ccp(s.width*0.25,s.height*0.925);
    [self addChild:kulakScoreLabel z:1100];
    
    grenadeScoreLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    grenadeScoreLabel.position = ccp(s.width*0.25,s.height*0.89);
    [self addChild:grenadeScoreLabel z:1100];
    
    boxScoreLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    boxScoreLabel.position = ccp(s.width*0.25,s.height*0.855);
    [self addChild:boxScoreLabel z:1100];
    
    boomerangScoreLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    boomerangScoreLabel.position = ccp(s.width*0.25,s.height*0.82);
    [self addChild:boomerangScoreLabel z:1100];
    
    mechScoreLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    mechScoreLabel.position = ccp(s.width*0.25,s.height*0.785);
    [self addChild:mechScoreLabel z:1100];
    
    LevelNumLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    LevelNumLabel.position = ccp(s.width*0.25,s.height*0.75);
    [self addChild:LevelNumLabel z:1100];
    
    musicBoolLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    musicBoolLabel.position = ccp(s.width*0.25,s.height*0.715);
    [self addChild:musicBoolLabel z:1100];
    
    soundBoolLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    soundBoolLabel.position = ccp(s.width*0.25,s.height*0.68);
    [self addChild:soundBoolLabel z:1100];
    
    /// MONETAS and POWERUPS COUNTS
    monetasCountLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    monetasCountLabel.position = ccp(s.width*0.7,s.height*0.91);
    [self addChild:monetasCountLabel z:1100];
    
    killCountLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    killCountLabel.position = ccp(s.width*0.7,s.height*0.875);
    [self addChild:killCountLabel z:1100];
    
    grenadeCountLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    grenadeCountLabel.position = ccp(s.width*0.7,s.height*0.81);
    [self addChild:grenadeCountLabel z:1100];
    
    boxCountLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    boxCountLabel.position = ccp(s.width*0.7,s.height*0.775);
    [self addChild:boxCountLabel z:1100];
    
    mechCountLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    mechCountLabel.position = ccp(s.width*0.7,s.height*0.74);
    [self addChild:mechCountLabel z:1100];
    
    boomerangCountLabel = [CCLabelTTF labelWithString:@"0.0" fontName:@"SQUARE" fontSize:12];
    boomerangCountLabel.position = ccp(s.width*0.7,s.height*0.705);
    [self addChild:boomerangCountLabel z:1100];
    

}

-(void)userDataUpdate:(ccTime)dt
{
    [totalScoreLabel setString:[NSString stringWithFormat:@"TotalScore = %d",scoreKeyInt]];
    
    [kulakScoreLabel setString:[NSString stringWithFormat:@"KulakScore = %d",kulakKeyInt]];
    [grenadeScoreLabel setString:[NSString stringWithFormat:@"GrenadeScore = %d",grenadeKeyInt]];
    [boxScoreLabel setString:[NSString stringWithFormat:@"BoxScore = %d",boxKeyInt]];
    [boomerangScoreLabel setString:[NSString stringWithFormat:@"BoomScore = %d",boomerangKeyInt]];
    [mechScoreLabel setString:[NSString stringWithFormat:@"MechScore = %d",mechKeyInt]];
    
    [LevelNumLabel setString:[NSString stringWithFormat:@"LEVELNUM = %d",LEVELKEYINT]];
    
    [musicBoolLabel setString:[NSString stringWithFormat:@"music ON = %d",isMusicOn]];
    [soundBoolLabel setString:[NSString stringWithFormat:@"sound ON = %d",isSoundsOn]];
    
    //COUNTS: MONETAS and PowerUps
    [monetasCountLabel setString:[NSString stringWithFormat:@"Monetas = %d",monetasCountInt]];
    [killCountLabel setString:[NSString stringWithFormat:@"Kill Count = %d",killCountInt]];
    
    [grenadeCountLabel setString:[NSString stringWithFormat:@"GrenadeCount = %d",grenadeCountInt]];
    [boxCountLabel setString:[NSString stringWithFormat:@"Box Count = %d",boxCountInt]];
    [boomerangCountLabel setString:[NSString stringWithFormat:@"Boom Count = %d",boomerangCountInt]];
    [mechCountLabel setString:[NSString stringWithFormat:@"Mech Count = %d",mechCountInt]];
     
}



-(void)setComposition
{
    arrowSprite = [CCSprite spriteWithFile:@"arrow.png"];
    arrowSprite.position = ccp(s.width*0.06,s.height*0.935);
    arrowSprite.scale = 1.02;
    [self addChild:arrowSprite z:101];
    
    headSprite = [CCSprite spriteWithFile:@"rontoohead.png"];
    //headSprite.position = ccp(s.width*0.52,s.height*0.75);
    headSprite.position = ccp(s.width*0.18,s.height*0.935);
    headSprite.scale = 1.02;
    [self addChild:headSprite z:110];
    
    mainheadSprite = [CCSprite spriteWithFile:@"head.png"];
    //headSprite.position = ccp(s.width*0.52,s.height*0.75);
    mainheadSprite.position = ccp(s.width*0.18,s.height*0.935);
    mainheadSprite.scale = 1.02;
    [self addChild:mainheadSprite z:111];
    
    whiteroundSprite = [CCSprite spriteWithFile:@"white_round.png"];
    whiteroundSprite.position = ccp(s.width*0.18,s.height*0.935);
    whiteroundSprite.scale = 1.02;
    [self addChild:whiteroundSprite z:100];
    
    float size  = 0.45;
    
    playSprite = [CCSprite spriteWithFile:@"playbutton.png"];
    playSprite.position = ccp(s.width*0.49,s.height*size);
    playSprite.scale = 0.97;
    playSprite.opacity = 155;
    //[self addChild:playSprite z:10];
    
    backwardFruits = [CCSprite spriteWithFile:@"triofruits.png"];
    backwardFruits.position = ccp(s.width*0.445,s.height*size+32); //+7px
    backwardFruits.scale = 0.96;
    [self addChild:backwardFruits z:9];
    
    towardFruits = [CCSprite spriteWithFile:@"yagodamalina.png"];
    towardFruits.position = ccp(s.width*0.69,s.height*size-19); //-5px
    towardFruits.scale = 1.;
    [self addChild:towardFruits z:11];
    
    //TITLE_SPRITE
    titleSprite = [CCSprite spriteWithFile:@"tapthefruit_logo.png"];
    titleSprite.position = ccp(s.width*0.46,s.height*0.8);
    titleSprite.scale = 0.96;
    [self addChild:titleSprite z:100];    
    
}


#pragma mark < MORE APPS > 

-(void)otherGames
{
    NSString *search = @"roonto.com";  
    NSString *sstring = [NSString stringWithFormat:@"http://phobos.apple.com/WebObjects/MZSearch.woa/wa/search?WOURLEncoding=ISO8859_1&lang=1&output=lm&country=US&term=%@&media=software", [search stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];  
    [[UIApplication sharedApplication] openURL: [NSURL URLWithString:sstring]];  
}




#pragma mark < PROGRAMM ANIMATION > 

-(void)headMethod
{
    CCSequence *scaleHead = [CCSequence actions:
                             
                             [CCScaleTo actionWithDuration:0.5 scale:1.02],
                             //[CCDelayTime actionWithDuration:.5f],
                             [CCScaleTo actionWithDuration:0.5 scale:1.07],
                             //[CCDelayTime actionWithDuration:.5f],
                             nil];
    
    //CCEaseExponentialInOut *easePlay = [CCEaseExponentialOut actionWithAction:scalePlay];
    CCEaseBounceOut *easeHead = [CCEaseBounceIn actionWithAction:scaleHead];
    //CCEaseElasticOut *easePlay = [CCEaseElasticInOut actionWithAction:scalePlay];
    CCRepeatForever *repeatHead = [CCRepeatForever actionWithAction:easeHead];
    
    [mainheadSprite runAction: repeatHead];
}

-(void)arrowMethod
{
    CCSequence *scaleArrow = [CCSequence actions:
                              
                              [CCMoveTo actionWithDuration:0.9f position:ccp(s.width*0.045,s.height*0.935)],
                              //[CCDelayTime actionWithDuration:.5f],
                              [CCMoveTo actionWithDuration:0.9f position:ccp(s.width*0.06,s.height*0.935)],
                              //[CCDelayTime actionWithDuration:.5f],
                              nil];
    
    CCEaseElasticOut *easeArrow = [CCEaseElasticInOut actionWithAction:scaleArrow];
    CCRepeatForever *repeatArrow = [CCRepeatForever actionWithAction:easeArrow];
    
    [arrowSprite runAction: repeatArrow];
}

-(void)playMethod
{
    CCSequence *scalePlay = [CCSequence actions:
                             
                             [CCScaleTo actionWithDuration:1.5 scale:0.96],
                             //[CCDelayTime actionWithDuration:.5f],
                             [CCScaleTo actionWithDuration:1.5 scale:1.0],
                             //[CCDelayTime actionWithDuration:.5f],
                             nil];
    
    //CCEaseExponentialInOut *easePlay = [CCEaseExponentialOut actionWithAction:scalePlay];
    //CCEaseBounceOut *easePlay = [CCEaseBounceIn actionWithAction:scalePlay];
    CCEaseElasticOut *easePlay = [CCEaseElasticInOut actionWithAction:scalePlay];
    CCRepeatForever *repeatPlay = [CCRepeatForever actionWithAction:easePlay];
    
    repeatPlay.tag = 111;
    [playItem runAction: repeatPlay];
}

#pragma mark < OPTIONS >

-(void)displayOptions
{
    optionsButtonOn = [CCMenuItemImage itemFromNormalImage:@"option_selected.png"
                                             selectedImage:@"optionbutton.png"];
    CCMenuItemImage *optionsButtonOff = [CCMenuItemImage itemFromNormalImage:@"optionbutton.png"
                                                               selectedImage:@"option_selected.png"];
    
    optionsToggle = [CCMenuItemToggle itemWithTarget:self selector:@selector(optionsToggle) items:optionsButtonOff, optionsButtonOn, nil];
    
    optionsToggle.position = ccp(s.width-optionsButtonOn.contentSize.width*0.8, 0+optionsButtonOn.contentSize.height*0.8);
    
    
    optionsMenu = [CCMenu menuWithItems:optionsToggle, nil];
    [optionsMenu setPosition:CGPointZero];
    
    optionsMenu.scale = 1.025;
    //optionsMenu.opacity = 240;
    
    [self addChild:optionsMenu z:100];
}

-(void)optionsToggle
{
    if(isOptionsButtonSelected == NO)
    {
        CCLOG(@"optionToggle!!!");
        isOptionsButtonSelected = YES;
        
        if(isMusicOn == YES)
        {
            musicOn = [CCMenuItemImage itemFromNormalImage:@"music_on.png" 
                                             selectedImage:@"music_off.png"];
            musicOff = [CCMenuItemImage itemFromNormalImage:@"music_off.png"
                                              selectedImage:@"music_on.png"]; 
        }
        else
        {
            musicOn = [CCMenuItemImage itemFromNormalImage:@"music_off.png" 
                                             selectedImage:@"music_on.png"];
            musicOff = [CCMenuItemImage itemFromNormalImage:@"music_on.png"
                                              selectedImage:@"music_off.png"];
        }
        
        if(isSoundsOn == YES)
        {
            soundsOn = [CCMenuItemImage itemFromNormalImage:@"zvuk_on.png"
                                              selectedImage:@"zvuk_off.png"];
            soundsOff = [CCMenuItemImage itemFromNormalImage:@"zvuk_off.png"
                                               selectedImage:@"zvuk_on.png"];
        }
        else
        {
            soundsOn = [CCMenuItemImage itemFromNormalImage:@"zvuk_off.png"
                                              selectedImage:@"zvuk_on.png"];
            soundsOff = [CCMenuItemImage itemFromNormalImage:@"zvuk_on.png"
                                               selectedImage:@"zvuk_off.png"];
        }
        
        CCMenuItemToggle *musicToggle = [CCMenuItemToggle itemWithTarget:self selector:@selector(musicToggle) items:musicOn, musicOff, nil];
        CCMenuItemToggle *soundsToggle = [CCMenuItemToggle itemWithTarget:self selector:@selector(soundsToggle) items:soundsOn, soundsOff, nil];
        
        CCMenuItemImage *aboutItem = [CCMenuItemImage itemFromNormalImage:@"about_btn.png" selectedImage:@"about_btn.png" target:self selector:@selector(aboutItem)];
        
        musicToggle.position = ccp(s.width-optionsButtonOn.contentSize.width*0.7, 50);
        soundsToggle.position = ccp(s.width-optionsButtonOn.contentSize.width*0.7, 50);
        aboutItem.position = ccp(s.width-optionsButtonOn.contentSize.width*0.7, 50);
        
        musicToggle.tag = 21;
        soundsToggle.tag = 22;
        aboutItem.tag = 23;
        //musicToggle.scale=0.7;
        //soundsToggle.scale=0.7;
        
        [musicToggle runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width-optionsButtonOn.contentSize.width*0.75, 125)]];//125
        [soundsToggle runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width-optionsButtonOn.contentSize.width*0.75, 85)]];//165//85
        [aboutItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width-optionsButtonOn.contentSize.width*0.75, 85)]]; //85
        
        //CCMenu *optionsSubMenu = [CCMenu menuWithItems:musicToggle, soundsToggle, aboutItem, nil];
        CCMenu *optionsSubMenu = [CCMenu menuWithItems:musicToggle, soundsToggle, nil];
        [optionsSubMenu setPosition:CGPointZero];
        optionsSubMenu.tag = 20;
        [self addChild:optionsSubMenu];
        
    }
    else
    {
        CCLOG(@"OptionsToggle-> Turning Options ON");
        isOptionsButtonSelected = NO;
        
        CCMenu *optionsSubMenu = (CCMenu*)[self getChildByTag:20];
        CCMenuItemToggle *musicToggle = (CCMenuItemToggle*)[optionsSubMenu getChildByTag:21];
        CCMenuItemToggle *soundsToggle = (CCMenuItemToggle*)[optionsSubMenu getChildByTag:22];
        CCMenuItemImage *aboutItem = (CCMenuItemImage*)[optionsSubMenu getChildByTag:23];
        
        [musicToggle runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width-optionsButtonOn.contentSize.width*0.75, 40)]];
        [soundsToggle runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width-optionsButtonOn.contentSize.width*0.75, 40)]];
        [aboutItem runAction:[CCMoveTo actionWithDuration:0.2f position:ccp(s.width-optionsButtonOn.contentSize.width*0.75, 40)]];
        
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.3f], [CCCallFunc actionWithTarget:self selector:@selector(removeOptionsSubmenu)], nil]];
    }
}

-(void)removeOptionsSubmenu
{
    CCMenu *optionsSubMenu = (CCMenu*)[self getChildByTag:20];
    [self removeChild:optionsSubMenu cleanup:YES];
}

-(void)musicToggle
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    //isMusicOn = musicBoolLabel;
    if(isMusicOn == YES) 
    {
        isMusicOn = NO;
        [musicBoolLabel setString:[NSString stringWithFormat:@"music ON = %d",isMusicOn]];
        [self stopMusicTheme];
    }
    else
    {
        isMusicOn = YES; 
        [musicBoolLabel setString:[NSString stringWithFormat:@"music ON = %d",isMusicOn]];
        [self startMusicTheme];
    }
    [userDefaults setBool:isMusicOn forKey:@"musicKey"];
    [userDefaults synchronize];

}



-(void)soundsToggle
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if(isSoundsOn == YES)
    {
        isSoundsOn = NO;
        [soundBoolLabel setString:[NSString stringWithFormat:@"sound ON = %d",isSoundsOn]];
    }
    else
    {
        isSoundsOn = YES; 
        [soundBoolLabel setString:[NSString stringWithFormat:@"music ON = %d",isSoundsOn]];
    }
    [userDefaults setBool:isSoundsOn forKey:@"soundKey"];
    [userDefaults synchronize];
}
-(void)aboutItem
{
    CCLOG(@"ABOUT ITEM");
}

#pragma mark < STORE >

-(void)displayStore
{
    CCMenuItemImage *storeItem = [CCMenuItemImage itemFromNormalImage:@"shopbutton.png" 
                                                        selectedImage:@"shopbutton.png"
                                                               target:self selector:@selector(storeItem)];
    
    CCMenu *mainMenu = [CCMenu menuWithItems:storeItem, nil];
    //[mainMenu setPosition:CGPointZero];
    mainMenu.position = ccp(storeItem.contentSize.width*0.8,0+storeItem.contentSize.height*0.8);
    [self addChild:mainMenu z:1000];
    
    
}

-(void)storeItem
{
    CCLOG(@"!!!! STORE ITEM !!!");
}

#pragma mark < GAMECENTER >

-(void)displayGameCenter
{
    CCMenuItemImage *leadsItem = [CCMenuItemImage itemFromNormalImage:@"leaderboards.png" 
                                                        selectedImage:@"leaderboards.png"
                                                               target:self selector:@selector(leadsItem)];
    
    CCMenuItemImage *achievsItem = [CCMenuItemImage itemFromNormalImage:@"achievements.png" 
                                                          selectedImage:@"achievements.png"
                                                                 target:self selector:@selector(achievesItem)];
    
    leadsItem.scale = 0.9;
    achievsItem.scale = 0.9;
    CCMenu *gcMenu = [CCMenu menuWithItems:leadsItem, achievsItem, nil];
    //[mainMenu setPosition:CGPointZero];
    gcMenu.position = ccp(s.width*0.5,0+leadsItem.contentSize.height*0.55);
    [gcMenu alignItemsHorizontallyWithPadding:2];
    
    [self addChild:gcMenu z:1001];
}

-(void)leadsItem
{
    CCLOG(@"LEADS");
}

-(void)achievesItem
{
    CCLOG(@"ACHIEVES");
}

#pragma mark < TUTOR (VOPROS) >

-(void)displayVopros
{
    CCMenuItemImage *voprosItem = [CCMenuItemImage itemFromNormalImage:@"tutor.png" 
                                                         selectedImage:@"tutor.png"
                                                                target:self selector:@selector(voprosItem)];
    voprosItem.scale = 1.05;
    CCMenu *voprosMenu = [CCMenu menuWithItems:voprosItem, nil];
    //[mainMenu setPosition:CGPointZero];
    voprosMenu.position = ccp(s.width-voprosItem.contentSize.width*0.7,s.height-voprosItem.contentSize.height*0.7);
    [self addChild:voprosMenu z:1000];
    
}

-(void)voprosItem
{
    CCLOG(@"!!!! VOPROS ITEM !!!");
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.8 scene:[TutorScene node] withColor:ccBLACK]];
    
}


#pragma mark < MARKETING MIX >


-(void)displayMarketingMix
{
    CCMenuItemImage *podarokItem = [CCMenuItemImage itemFromNormalImage:@"bonus_button.png" 
                                                          selectedImage:@"bonus_button.png"
                                                                 target:self selector:@selector(podarokItem)];
    
    CCMenuItemImage *facebookItem = [CCMenuItemImage itemFromNormalImage:@"facebook_button.png" 
                                                           selectedImage:@"facebook_button.png"
                                                                  target:self selector:@selector(facebookItem)];
    
    CCMenu *mixMenu = [CCMenu menuWithItems:podarokItem, facebookItem, nil];
    //[mainMenu setPosition:CGPointZero];
    
    podarokItem.position = ccp(-s.width*0.3,s.height*0.1);
    facebookItem.position = ccp(s.width*0.3,s.height*0.5);
    
    podarokItem.scale = 1.05;
    facebookItem.scale = 0.95;
    
    mixMenu.position = ccp(s.width*0.5,s.height*0.23);
    //[mixMenu alignItemsHorizontallyWithPadding:60];
    
    [self addChild:mixMenu z:990];
    
}

-(void)podarokItem
{
    CCLOG(@"PODAROK");
}

-(void)facebookItem
{
    CCLOG(@"FACEBOOK");
}

#pragma mark < RESET >

-(void)displayReset
{
    resetButtonOn = [CCMenuItemImage itemFromNormalImage:@"reset_game.png"
                                           selectedImage:@"reset_game.png"];
    CCMenuItemImage *resetButtonOff = [CCMenuItemImage itemFromNormalImage:@"reset_game.png"
                                                             selectedImage:@"reset_game.png"];
    
    resetToggle = [CCMenuItemToggle itemWithTarget:self selector:@selector(resetToggle) items:resetButtonOff, resetButtonOn, nil];
    
    //resetToggle.position = ccp(s.width-resetButtonOn.contentSize.width*0.8, 0+resetButtonOn.contentSize.height*0.8);
    resetToggle.position = ccp(s.width*0.49,s.width*0.368);
    resetToggle.scale = 0.98;
    
    resetMenu = [CCMenu menuWithItems:resetToggle, nil];
    [resetMenu setPosition:CGPointZero];
    
    resetMenu.scale = 1.025;
    //optionsMenu.opacity = 240;
    
    [self addChild:resetMenu z:100];
}

-(void)resetToggle
{
    
    if(isResetSelected == NO)
    {
        CCLOG(@"optionToggle!!!");
        isResetSelected = YES;
        
        resetNoItem = [CCMenuItemImage itemFromNormalImage:@"reset_no.png" selectedImage:@"reset_no.png" target:self selector:@selector(resetNoItem)];
        resetYesItem = [CCMenuItemImage itemFromNormalImage:@"reset_yes.png" selectedImage:@"reset_yes.png" target:self selector:@selector(resetYesItem)];
        
        resetNoItem.position = ccp(s.width*0.5,s.height*0.24);
        resetYesItem.position = ccp(s.width*0.5,s.height*0.24);
        
        [resetNoItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.6825,s.height*0.24)]]; //85
        [resetYesItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.301,s.height*0.24)]]; //85
        
        resetMenu = [CCMenu menuWithItems: resetNoItem, resetYesItem, nil];
        [resetMenu setPosition:CGPointZero];
        //resetMenu.tag = 120;
        [self addChild:resetMenu];
        
    }
    else
    {
        CCLOG(@"ResetToggle-> Turning Reset ON");
        isResetSelected = NO;
        
        [resetNoItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.5,s.height*0.24)]]; //85
        [resetYesItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.5,s.height*0.24)]]; //85
        
        [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.3f], [CCCallFunc actionWithTarget:self selector:@selector(removeResetmenu)], nil]];
    }
}

-(void)removeResetmenu
{
    // CCMenu *resetMenu = (CCMenu*)[self getChildByTag:120];
    [self removeChild:resetMenu cleanup:YES];
}

-(void)resetNoItem
{
    CCLOG(@"NO!!!!!!!");
    CCLOG(@"NO!!!!!!!");
    /// ЗАКРЫВАЕМ RESET GAME
    CCLOG(@"ResetToggle-> Turning Reset ON");
    isResetSelected = NO;
    [resetNoItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.5,s.height*0.24)]]; //85
    [resetYesItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.5,s.height*0.24)]]; //85
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.3f], [CCCallFunc actionWithTarget:self selector:@selector(removeResetmenu)], nil]];
    
}

-(void)resetYesItem
{
    CCLOG(@"YES!!!!!!");
    //ОБНУЛЕНИЕ ВСЕХ ДАННЫХ
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setInteger:10 forKey:@"scoreKey"]; //ИТОГОВЫЕ ОЧКИ
    
    [userDefaults setInteger:0 forKey:@"kulakKey"]; //ОЧКИ по УДАРАМ
    [userDefaults setInteger:0 forKey:@"grenadeKey"];
    [userDefaults setInteger:0 forKey:@"boxKey"];
    [userDefaults setInteger:0 forKey:@"boomerangKey"];
    [userDefaults setInteger:0 forKey:@"mechKey"];
    
    [userDefaults setInteger:LEVEL_NUM forKey:@"LEVELKEY"]; //НОМЕР УРОВНЯ
    
    //[userDefaults setBool:YES forKey:@"musicKey"];
    //[userDefaults setBool:YES forKey:@"soundKey"];
    [userDefaults setInteger:0 forKey:@"monetasCountKey"]; //количество МОНЕТ и СУПЕРУДАРОВ
    [userDefaults setInteger:0 forKey:@"killCountKey"];
    
    [userDefaults setInteger:GRENADE_NUM forKey:@"grenadeCountKey"]; //ПОДСЧЕТ по УДАРАМ
    [userDefaults setInteger:BOX_NUM forKey:@"boxCountKey"];
    [userDefaults setInteger:MECH_NUM forKey:@"boomerangCountKey"];
    [userDefaults setInteger:BOOMERANG_NUM forKey:@"mechCountKey"];
    
    
    //СОХРАНЯЕМ в ПЕРЕМЕННЫЕ
    scoreKeyInt = [userDefaults integerForKey:@"scoreKey"];
    
    kulakKeyInt = [userDefaults integerForKey:@"kulakKey"];
    grenadeKeyInt = [userDefaults integerForKey:@"grenadeKey"];
    boxKeyInt = [userDefaults integerForKey:@"boxKey"];
    boomerangKeyInt = [userDefaults integerForKey:@"boomerangKey"];
    mechKeyInt = [userDefaults integerForKey:@"mechKey"];
    
    isMusicOn = [userDefaults boolForKey:@"musicKey"];
    isSoundsOn = [userDefaults boolForKey:@"soundKey"];
    
    LEVELKEYINT = [userDefaults integerForKey:@"LEVELKEY"];
    
    monetasCountInt = [userDefaults integerForKey:@"monetasCountKey"];
    killCountInt = [userDefaults integerForKey:@"killCountKey"];
    
    grenadeCountInt = [userDefaults integerForKey:@"grenadeCountKey"];
    boxCountInt = [userDefaults integerForKey:@"boxCountKey"];
    boomerangCountInt = [userDefaults integerForKey:@"boomerangCountKey"];
    mechCountInt = [userDefaults integerForKey:@"mechCountKey"];
    
    [userDefaults synchronize]; //НУЖНО на ВЫХОДЕ
    
    /// ЗАКРЫВАЕМ RESET GAME
    CCLOG(@"NO!!!!!!!");
    CCLOG(@"ResetToggle-> Turning Reset ON");
    isResetSelected = NO;
    
    [resetNoItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.5,s.height*0.24)]]; //85
    [resetYesItem runAction:[CCMoveTo actionWithDuration:0.3f position:ccp(s.width*0.5,s.height*0.24)]]; //85
    
    [self runAction:[CCSequence actions:[CCDelayTime actionWithDuration:0.3f], [CCCallFunc actionWithTarget:self selector:@selector(removeResetmenu)], nil]];
}

#pragma mark < PLAY BUTTON >

-(void)displayPlay
{
    playItem = [CCMenuItemImage itemFromNormalImage:@"playbutton.png" 
                                      selectedImage:@"playbutton.png"
                                             target:self selector:@selector(playItem)];
    
    playMenu = [CCMenu menuWithItems:playItem, nil];
    playMenu.scale = 0.97;
    //[mainMenu setPosition:CGPointZero];
    playMenu.position = ccp(s.width*0.475,s.height*0.435);
    [self addChild:playMenu z:10];
}

-(void)playItem
{
    [playItem stopActionByTag:111];
    // playItem.scale = 1.05;
    
   // [playItem runAction:[CCEaseIn actionWithAction:[CCScaleTo actionWithDuration:0.25 scale:1.065]]];
    [playItem runAction:[CCScaleTo actionWithDuration:0.35 scale:1.06]];
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:1.35],
                     [CCCallFunc actionWithTarget:self selector:@selector(transition)]
                     ,nil]];
}

-(void)transition
{

    if(scoreKeyInt>0)
    {
      //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.8 scene:[LoaderScene node] withColor:ccBLACK]];
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.8 scene:[Game node] withColor:ccBLACK]];
    }
    else
    {
      //[[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.8 scene:[TutorScene node] withColor:ccBLACK]];
       
        [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:0.8 scene:[Game node] withColor:ccBLACK]];
        
    }
    
}




@end