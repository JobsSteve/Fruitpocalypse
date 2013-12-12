//
//  LogoScene.m
//  Touch_Project
//
//  Created by Артур on 18.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogoScene.h"
#import "MainMenu.h"

@implementation LogoScene

- (void)dealloc{
    [super dealloc];
}

+(CCScene *) scene
{
	CCScene *scene = [CCScene node];
	LogoScene *layer = [LogoScene node];
	[scene addChild: layer];
	
	return scene;
}

-(id) init
{
	if((self=[super init])) 
    {
        s = [[CCDirector sharedDirector] winSize];
        
        tempSprite = [CCSprite spriteWithFile:@"logo_team.png"];
        tempSprite.position = ccp(s.width*0.5,s.height*0.5);
        //tempSprite.scale = 1.06;
        //tempSprite.color = ccWHITE;
        tempSprite.opacity = 255;
        
        [self addChild:tempSprite z:10];
        
        [self runAction:[CCSequence actions:
                         [CCDelayTime actionWithDuration:3.0f],
                         [CCCallFunc actionWithTarget:self selector:@selector(transitionToMainMenu)],nil]];
    }
	return self;
}


-(void)transitionToMainMenu
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[MainMenu scene] withColor:ccBLACK]];
    
}



@end