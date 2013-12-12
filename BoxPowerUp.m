//
//  BoxPowerUp.m
//  Touch_Project
//
//  Created by Артур on 15.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BoxPowerUp.h"

@implementation BoxPowerUp


- (void)dealloc
{
    [super dealloc];
}

-(id)init
{
    if(self=[super init])
    {
        s = [CCDirector sharedDirector].winSize;
        
       // boxPowerUp = [CCSprite spriteWithFile:@"powerup_box.png"];
        //boxPowerUp.position = ccp(s.width*3/8,s.height*2.5/16);
        //[self addChild:boxPowerUp];
    }
    return self;
}

-(void)startBox
{
    gloveLeft = [CCSprite spriteWithFile:@"glove_right.png"];
    gloveLeft.position = ccp(-gloveLeft.contentSize.width/2,s.height*1.5/10);
    [self addChild:gloveLeft z:100 tag:10];
    
    gloveRight = [CCSprite spriteWithFile:@"glove_left.png"];
    gloveRight.position = ccp(s.width/2,s.height*1.5/10);
    [self addChild:gloveRight z:110 tag:11];
    
    
    
}





@end
