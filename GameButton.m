//
//  GameButton.m
//  Touch_Project
//
//  Created by Артур on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameButton.h"

@implementation GameButton

+(id)buttonWithFile: (NSString *)buttonFile
{
    return [[[GameButton alloc] initWithFile:buttonFile] autorelease];
}

-(id)initWithFile: (NSString *)buttonFile
{
    if((self = [super init]))
    {
        NSString *btnFrame = buttonFile;
        int fSize = 12;
        //self = [CCSprite spriteWithFile:@"btnFrame"];
        
        CCSprite *btn = [CCSprite spriteWithFile:buttonFile];
        //btn.position = ccp(s.width/2,s.height/2 - 100);
        [self addChild:btn];
        //[self setDisplayFrame:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:btnFrame]];
        //CCLabelTTF *label = [CCLabelTTF labelWithString:buttonText fontName:@"TOONISH" fontSize:fSize + big * fSize];
        //label.position = ccp(self.contentSize.width/2, self.contentSize.height/2);
        //[self addChild:label z:1];
        //CCLabelTTF *labelShadow = [CCLabelTTF labelWithString:buttonText fontName:@"TOONISH" fontSize:fSize + big * fSize];
        //labelShadow.position = ccp(self.contentSize.width/2 - (2 + big * 2), self.contentSize.height/2);
        //labelShadow.color = ccBLACK;
        //labelShadow.opacity = 150;
        //[self addChild:labelShadow];
    }
    return self;
}

@end
