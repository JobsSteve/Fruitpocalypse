//
//  Game+Music.m
//  Touch_Project
//
//  Created by Артур on 20.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game+Music.h"
#import "SimpleAudioEngine.h"
@implementation Game (Music)

-(void)initializeSoundData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    isSoundOn = [userDefaults boolForKey:@"soundKey"];
    isMusicOn = [userDefaults boolForKey:@"musicKey"];
    
    
    if(isMusicOn == YES )
    {
        [self setMusic];
        [self startMusicTheme];
    }
    if(isSoundOn==YES)
    {
        [self setSounds];
    }
}
-(void)setMusic{
    [[SimpleAudioEngine sharedEngine] preloadBackgroundMusic:@"pat_the_gorf_2.mp3"];
}

-(void)setSounds{
    hitSound = [NSString stringWithString:@"taping.caf"];
    grenadeSound = [NSString stringWithString:@"bomb.caf"];
    boxSound = [NSString stringWithString:@"boxing.caf"];
    mechSound = [NSString stringWithString:@"mech.caf"];
    boomerangSound = [NSString stringWithString:@"boomerang.caf"];
    youLoseSound = [NSString stringWithString:@"YouLose.caf"];
    youWinSound = [NSString stringWithString:@"YouWin.caf"];
    
    [[SimpleAudioEngine sharedEngine] preloadEffect:hitSound];
    [[SimpleAudioEngine sharedEngine] preloadEffect:grenadeSound];
    [[SimpleAudioEngine sharedEngine] preloadEffect:boxSound];
    [[SimpleAudioEngine sharedEngine] preloadEffect:boomerangSound];
    [[SimpleAudioEngine sharedEngine] preloadEffect:youLoseSound];
    [[SimpleAudioEngine sharedEngine] preloadEffect:youWinSound];
}

//-(void)setSoun

-(void)startMusicTheme
{
    ////MUSIC BACKGROUND ///////////////////////////
    [[SimpleAudioEngine sharedEngine] playBackgroundMusic:@"pat_the_gorf_2.mp3" loop:YES];
}

-(void)stopMusicTheme
{
    [[SimpleAudioEngine sharedEngine]stopBackgroundMusic ];
}



@end
