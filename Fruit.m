//
//  Fruit.m
//  Touch_Project
//
//  Created by Артур on 04.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Fruit.h"
#import "Game.h"

//#define ANIM_SPEED .6f

@implementation Fruit

- (void)dealloc
{
    //[explosion release];
    [super dealloc];
}

-(id)init
{
    if(self=[super init])
    {
        s = [CCDirector sharedDirector].winSize;
        
        SPEED_PARAM = 0.6; //[Game timeBetweenFruits];
        
        //Game *game = [Game node];
        //SPEED_PARAM = (float)[game getPARAM];
        //upTime = 2.0f;
        //type = MOLE_TYPE_A;
        //delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
        //ОТОБРАЖЕНИЕ ЖИЗНИ у ФРУКТОВ
        displayLabel = [CCLabelTTF labelWithString:@"0" fontName:@"SQUARE" fontSize:17];
        displayLabel.opacity = 220;
        displayLabel.position = ccp(self.contentSize.width/2,self.contentSize.height);
        [self addChild:displayLabel z:10];  
        
        bombBonusBOOL = NO, boxBonusBOOL = NO, mechBonusBOOL = NO, boomerangBonusBOOL = NO;
        
        monetaSmallBOOL = NO, moneatMiddleBOOL = NO, monetaBigBOOL = NO;
        budilnikSmallBOOL = NO, budilnikMiddleBOOL = NO, budilnikBigBOOL = NO;
        
        budilnikDone = NO,monetaDone = NO,bonusDone = NO;
        
        bigBOOL = NO;
    }
    return self;
}

/*-(id)initWithFile:(NSString *)filename {
    if (self = [super initWithFile:filename]) {
        bbox = [self boundingBox];
    }
    return self;
}*/

-(void)startWithType:(int)index
{
    [self stopAllActions];
    isUp = YES;
    explosionPosition = ccp(self.contentSize.width/2,self.contentSize.height/2);
    
    int flipInt = CCRANDOM_0_1()*2;
    
      if(flipInt == 1){
     self.flipX = NO;
     }else{
     self.flipX = YES;
     }
     
    
    if(index == 0)
    {
        [self setLifes:1];
        
        /*
        vishnyaLeft = [CCSprite spriteWithFile:@"vishnya_left.png"];
        vishnyaLeft.scale = 1.0;
        vishnyaLeft.opacity = 0;
    
        vishnyaRight = [CCSprite spriteWithFile:@"vishnya_left.png"];
        vishnyaRight.scale = 1.0;
        vishnyaRight.opacity = 0;
        [self addChild:vishnyaLeft z:10];
        [self addChild:vishnyaRight z:10];
        
        if(flipInt == 1)
        {
           vishnyaLeft.position = ccp(self.contentSize.width/2-20-1,self.contentSize.height/2+10-1);
           vishnyaRight.position = ccp(self.contentSize.width/2+2.0,self.contentSize.height/2);
            
            CCSprite *sequenceAction = [CCSequence actions:
                                    [CCSpawn actions:
                                     [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                     [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                        position:ccp(self.contentSize.width/2-20-1,self.contentSize.height/2+10-1)]
                                     , nil],
                                                      
                                    [CCSpawn actions:
                                     [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                     [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                         position:ccp(self.contentSize.width/2-20-1-2.5,self.contentSize.height/2+10-1)]
                                     , nil]];
        
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
      
            CCSprite *sequenceAction2 = [CCSequence actions:
                                     [CCSpawn actions:
                                      [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                      [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                          position:ccp(self.contentSize.width/2+2.0,self.contentSize.height/2)]
                                      , nil],
                                     
                                     [CCSpawn actions:
                                      [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                      [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                          position:ccp(self.contentSize.width/2+1-1.0,self.contentSize.height/2)]
                                      , nil]];

            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
           
            [vishnyaLeft runAction:repeatAction];
            [vishnyaRight runAction:repeatAction2];
            vishnyaLeft.opacity = 255;
            vishnyaRight.opacity = 255;
        }
        else
        {
            vishnyaLeft.position = ccp(self.contentSize.width/2-2,self.contentSize.height/2);
            vishnyaRight.position = ccp(self.contentSize.width/2+20+0.5,self.contentSize.height/2+10-1);
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-2,self.contentSize.height/2)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-2+2,self.contentSize.height/2)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+20+0.5,self.contentSize.height/2+10-1)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+22.5+0.5,self.contentSize.height/2+10-1)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
           
            vishnyaLeft.flipX = YES;
            vishnyaRight.flipX = YES;
            [vishnyaLeft runAction:repeatAction];
            [vishnyaRight runAction:repeatAction2];
            vishnyaLeft.opacity = 255;
            vishnyaRight.opacity = 255;
         
        }
     */   
    }
   
       
        
    
    else if(index == 1)
    {
        [self setLifes:1];
        
        /*
        yagodaLeft = [CCSprite spriteWithFile:@"yagoda_left.png"];
        yagodaLeft.scale = 1.0;
         yagodaLeft.opacity = 0;
        
         yagodaRight = [CCSprite spriteWithFile:@"yagoda_right.png"];
         yagodaRight.scale = 1.0;
         yagodaRight.opacity = 0;
        [self addChild: yagodaLeft z:10];
        [self addChild: yagodaRight z:10];
        
        if(flipInt == 1)
        {
            yagodaLeft.position = ccp(self.contentSize.width/2-10+3.5,self.contentSize.height/2+20-3);
             yagodaRight.position = ccp(self.contentSize.width/2+5,self.contentSize.height/2+3);
            
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-10+3.5,self.contentSize.height/2+20-3)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-10+3.5,self.contentSize.height/2+20-3)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+5,self.contentSize.height/2+3)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+5,self.contentSize.height/2+3)]
                                          , nil]];
            
             repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            [ yagodaLeft runAction:repeatAction];
            [ yagodaRight runAction:repeatAction2];
            yagodaLeft.opacity = 255;
             yagodaRight.opacity = 255;
        }
        else
        {
            yagodaLeft.position = ccp(self.contentSize.width/2-5,self.contentSize.height/2+3);
            yagodaRight.position = ccp(self.contentSize.width/2+10-3.5,self.contentSize.height/2+15+1);
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-5,self.contentSize.height/2+3)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-5,self.contentSize.height/2+3)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+10-3.5,self.contentSize.height/2+15+1)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+10-3.5,self.contentSize.height/2+15+1)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            
             yagodaLeft.flipX = YES;
             yagodaRight.flipX = YES;
            [ yagodaLeft runAction:repeatAction];
            [ yagodaRight runAction:repeatAction2];
            yagodaLeft.opacity = 255;
             yagodaRight.opacity = 255;
            
        }
        
        
        */
    }
    else if(index == 2)
    {
       
        [self setLifes:1];
         /*
        malinaLeft = [CCSprite spriteWithFile:@"malina_left.png"];
        malinaLeft.scale = 1.0;
        malinaLeft.opacity = 0;
        
        malinaRight = [CCSprite spriteWithFile:@"malina_right.png"];
        malinaRight.scale = 1.0;
        malinaRight.opacity = 0;
        [self addChild: malinaLeft z:10];
        [self addChild: malinaRight z:10];
        
        if(flipInt == 1)
        {
            malinaLeft.position = ccp(self.contentSize.width/2-5-0.4,self.contentSize.height/2-5+1);
            malinaRight.position = ccp(self.contentSize.width/2+5+1.9,self.contentSize.height/2+3-1);
            
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-5-0.4,self.contentSize.height/2-5+1)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-5-0.4,self.contentSize.height/2-5+1)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+5+1.9,self.contentSize.height/2+3-1)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+5+1.9,self.contentSize.height/2+3-1)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            [ malinaLeft runAction:repeatAction];
            [ malinaRight runAction:repeatAction2];
            malinaLeft.opacity = 255;
            malinaRight.opacity = 255;

        }
        else
        {
            malinaLeft.position = ccp(self.contentSize.width/2-7.9,self.contentSize.height/2+1);
            malinaRight.position = ccp(self.contentSize.width/2+10-4.5,self.contentSize.height/2-4+0.6);
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-7.9,self.contentSize.height/2+1)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-7.9,self.contentSize.height/2+1)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+10-4.5,self.contentSize.height/2-4+0.6)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+10-4.5,self.contentSize.height/2-4+0.6)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            malinaLeft.flipX = YES;
            malinaRight.flipX = YES;
            [ malinaLeft runAction:repeatAction];
            [ malinaRight runAction:repeatAction2];
            malinaLeft.opacity = 255;
            malinaRight.opacity = 255;
        }
        */
    }

    else if(index == 3)                   //////////// LEMON EYES ////////////////
    {
        
        [self setLifes:2];
        /*
        limonLeft = [CCSprite spriteWithFile:@"lemon_glaz.png"];
        limonLeft.scale = 1.0;
        limonLeft.opacity = 0;
        
        limonRight = [CCSprite spriteWithFile:@"lemon_glaz.png"];
        limonRight.scale = 1.0;
        limonRight.opacity = 0;
        [self addChild: limonLeft z:10];
        [self addChild: limonRight z:10];
        
        if(flipInt == 1)
        {
            limonLeft.position = ccp(self.contentSize.width/2-10-5.8,self.contentSize.height/2+5);
            limonRight.position = ccp(self.contentSize.width/2+15+4.0,self.contentSize.height/2-1.5);
            
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-10-5.8,self.contentSize.height/2+5)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-10-5.8,self.contentSize.height/2+5)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+15+4.0,self.contentSize.height/2-1.5)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+15+4.0,self.contentSize.height/2-1.5)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            [ limonLeft runAction:repeatAction];
            [ limonRight runAction:repeatAction2];
            limonLeft.opacity = 255;
            limonRight.opacity = 255;
        }
        else
        {
            limonLeft.position = ccp(self.contentSize.width/2-19,self.contentSize.height/2-0.5);
            limonRight.position = ccp(self.contentSize.width/2+15,self.contentSize.height/2+10-4.9);
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-19,self.contentSize.height/2-0.5)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-19,self.contentSize.height/2-0.5)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.02],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+15,self.contentSize.height/2+10-4.9)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.12],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+15,self.contentSize.height/2+10-4.9)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            limonLeft.flipX = YES;
            limonRight.flipX = YES;
            [ limonLeft runAction:repeatAction];
            [ limonRight runAction:repeatAction2];
            limonLeft.opacity = 255;
            limonRight.opacity = 255;
        }
        */
    }
    else if(index == 4)                          //////////// POMIDOR EYES //////////////
    {
        [self setLifes:2];
        /*
        pomidorLeft = [CCSprite spriteWithFile:@"pomidor_left.png"];
        pomidorLeft.scale = 1.0;
        pomidorLeft.opacity = 0;
        
        pomidorRight = [CCSprite spriteWithFile:@"pomidor_right.png"];
        pomidorRight.scale = 1.0;
        pomidorRight.opacity = 0;
        [self addChild: pomidorLeft z:10];
        [self addChild: pomidorRight z:10];
        
        if(flipInt == 1)
        {
            pomidorLeft.position = ccp(self.contentSize.width/2-20-7.2,self.contentSize.height/2+20+2);
            pomidorRight.position = ccp(self.contentSize.width/2+2.2,self.contentSize.height/2+10+3);
            
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-20-7.2,self.contentSize.height/2+20+2)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-20-7.2,self.contentSize.height/2+20+2)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+2.2,self.contentSize.height/2+10+3)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+2.2,self.contentSize.height/2+10+3)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            [ pomidorLeft runAction:repeatAction];
            [ pomidorRight runAction:repeatAction2];
            pomidorLeft.opacity = 255;
            pomidorRight.opacity = 255;
        }
        else
        {
            pomidorLeft.position = ccp(self.contentSize.width/2-2+0.2,self.contentSize.height/2+14-0.7);
            pomidorRight.position = ccp(self.contentSize.width/2+26,self.contentSize.height/2+25);
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-2+0.2,self.contentSize.height/2+14-0.7)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-2+0.2,self.contentSize.height/2+14-0.7)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+26,self.contentSize.height/2+25)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+26,self.contentSize.height/2+25)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            pomidorLeft.flipX = YES;
            pomidorRight.flipX = YES;
            [ pomidorLeft runAction:repeatAction];
            [ pomidorRight runAction:repeatAction2];
            pomidorLeft.opacity = 255;
            pomidorRight.opacity = 255;
        }
        */
    }
    else if(index == 5)
    {
        [self setLifes:3];
        
       /* ananasLeft = [CCSprite spriteWithFile:@"ananas_glaz.png"];
        ananasLeft.scale = 1.0;
        ananasLeft.opacity = 0;
        
        ananasRight = [CCSprite spriteWithFile:@"ananas_glaz.png"];
        ananasRight.scale = 1.0;
        ananasRight.opacity = 0;
        [self addChild: ananasLeft z:10];
        [self addChild: ananasRight z:10];
        
        if(flipInt == 1)
        {
            ananasLeft.position = ccp(self.contentSize.width/2-0.5,self.contentSize.height/2-50+10+3.9);
            ananasRight.position = ccp(self.contentSize.width/2+20+5-2,self.contentSize.height/2-50+20+1);
            
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.06],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-0.5,self.contentSize.height/2-50+10+3.9)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.16],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-0.5,self.contentSize.height/2-50+10+3.9)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.06],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+20+5-2,self.contentSize.height/2-50+20+1)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.16],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+20+5-2,self.contentSize.height/2-50+20+1)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            [ ananasLeft runAction:repeatAction];
            [ ananasRight runAction:repeatAction2];
            ananasLeft.opacity = 255;
            ananasRight.opacity = 255;
        }
        else
        {
            ananasLeft.position = ccp(self.contentSize.width/2-20-5+2,self.contentSize.height/2-50+20+1);
            ananasRight.position = ccp(self.contentSize.width/2+0.5,self.contentSize.height/2-50+10+3.9);
            CCSprite *sequenceAction = [CCSequence actions:
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-20-5+2,self.contentSize.height/2-50+20+1)]
                                         , nil],
                                        
                                        [CCSpawn actions:
                                         [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                         [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                             position:ccp(self.contentSize.width/2-20-5+2,self.contentSize.height/2-50+20+1)]
                                         , nil]];
            
            repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
            CCSprite *sequenceAction2 = [CCSequence actions:
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+0.5,self.contentSize.height/2-50+10+3.9)]
                                          , nil],
                                         
                                         [CCSpawn actions:
                                          [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.15],
                                          [CCMoveTo actionWithDuration:SPEED_PARAM/2 
                                                              position:ccp(self.contentSize.width/2+0.5,self.contentSize.height/2-50+10+3.9)]
                                          , nil]];
            
            repeatAction2 = [CCRepeatForever actionWithAction:sequenceAction2];
            
            ananasLeft.flipX = YES;
            ananasRight.flipX = YES;
            [ananasLeft runAction:repeatAction];
            [ananasRight runAction:repeatAction2];
            ananasLeft.opacity = 255;
            ananasRight.opacity = 255;
        }

        */
    }
    
    
    //else
        if(index == 6)
    {
        bombBonusBOOL = YES;
    }
    else if(index == 7)
    {
        boxBonusBOOL = YES;
    }
    else if(index == 8)
    {
        mechBonusBOOL = YES;
    }
    else if(index == 9)
    {
        boomerangBonusBOOL = YES;
    }
    else if(index == 10)
    {
        monetaSmallBOOL = YES;
    }
    else if(index == 11)
    {
        moneatMiddleBOOL = YES;
    }
    else if(index == 12)
    {
        monetaBigBOOL = YES;
    }
    else if(index == 13)
    {
        budilnikSmallBOOL= YES;
    }
    else if(index == 14)
    {
        budilnikMiddleBOOL = YES;
    }
    else if(index == 15)
    {
        budilnikBigBOOL = YES;
    }
    
    [self setIndex:index];
   
 
        
    if(index >=13 && index <=15)             ///BUDILNIKI
    {
         [self budilnikAppear];
        [self schedule:@selector(budilnikStart:)];
       
    }
    else if(index >=6 && index <=9)         ///BONUSI
    {
           [self bonusAppear];
        [self schedule:@selector(bonusStart:)];
      
    }
    else if(index >=10 && index <=12)        ///MONETI 
    {
        //self.scaleY = 1.5;
        [self monetasAppear];
        [self schedule:@selector(monetaStart:)];
        
    }
    
 
    
  if(index>=0 && index<=5) ///FRUITS (APPEAR ACTION)
    {
        [self fruitsAppear];
    }
    
      /*
    else if(index>=6 && index>=9) ///BONUSI (APPEAR ACTION)
    {
        [self bonusAppear];
    }
    else if(index>=10 && index<=12)  ///MONETI (APPEAR ACTION)
    {
        [self monetasAppear];
    }
    else if(index>=13 && index<=13) /// BUDILNIK (APPEAR ACTION)
    {
        [self budilnikAppear];
    }
   */
    
}


-(void)budilnikAppear
{
    self.rotation = -10;
    self.anchorPoint = ccp(0.5,0.4);
    [self runAction:[CCFadeIn actionWithDuration:SPEED_PARAM]];
    [self runAction:[CCSequence actions:
                     //[CCScaleTo actionWithDuration:SPEED_PARAM /2 scale:1.2],
                     //[CCScaleTo actionWithDuration:SPEED_PARAM /2 scale:0.95],
                     [CCCallFunc actionWithTarget:self selector:@selector(budilnikAction)],
                     nil]];
}
-(void)budilnikAction
{
    //[self stopAllActions];
    //CCRotateTo *rotLeft1 = [CCRotateBy actionWithDuration:0.6 angle:-25.0];
    
    CCRotateTo *rotLeft = [CCRotateBy actionWithDuration:0.115 angle:20.0];
    CCRotateTo *rotRight = [CCRotateBy actionWithDuration:0.115 angle:-20.0];
   
    CCEaseExponentialInOut *easeBudilnik1 = [CCEaseExponentialInOut actionWithAction:rotLeft];
    CCEaseExponentialInOut *easeBudilnik2 = [CCEaseExponentialInOut actionWithAction:rotRight];
     CCSequence *budilnikSeq = [CCSequence actions:easeBudilnik1,easeBudilnik2, nil];
    
    CCRepeatForever *repeatBudilnik = [CCRepeatForever actionWithAction:budilnikSeq];
    
    //[self runAction:[CCSequence actions:rotSeq, repeatBudilnik, nil]];
    [self runAction:repeatBudilnik];
}

/*-(void)budilnikAppear
{
    [self runAction:[CCFadeIn actionWithDuration:SPEED_PARAM/2]];
    
    CCAction *seqBudilnik = [CCSequence actions:
                             [CCScaleTo actionWithDuration:SPEED_PARAM/2 scale:1.3],
                             [CCScaleTo actionWithDuration:SPEED_PARAM/2 scale:1.0],
                             nil];
    CCEaseExponentialInOut *easeBudilnik = [CCEaseExponentialOut actionWithAction:seqBudilnik];
    CCRepeatForever *repeatBudilnik = [CCRepeatForever actionWithAction:easeBudilnik];
    [self runAction:repeatBudilnik];
}*/

-(void)monetasAppear
{
    [self runAction:[CCFadeIn actionWithDuration:SPEED_PARAM/2]];
    
    CCRotateTo *rotationFull = [CCRotateBy actionWithDuration:1.5 angle:-360.0];
    [self runAction:[CCRepeatForever actionWithAction:rotationFull]]; 
    
    [self runAction:[CCSequence actions:
                     [CCScaleTo actionWithDuration:SPEED_PARAM /2 scale:1.3],
                     [CCScaleTo actionWithDuration:SPEED_PARAM /2 scale:1.05],
                     nil]];
   // self.scaleY =1.5;
}

-(void)fruitsAppear
{
    [self runAction:[CCFadeIn actionWithDuration:SPEED_PARAM/2]];
 
    
    [self runAction:[CCSequence actions:
                     [CCScaleTo actionWithDuration:SPEED_PARAM /2 scale:1.2],
                     [CCScaleTo actionWithDuration:SPEED_PARAM/2 scale:1.0],
                     [CCCallFunc actionWithTarget:self selector:@selector(repeatFruitsAction)],
                     nil]];
}

-(void)bonusAppear
{
    [self stopAllActions];
    self.opacity = 0;
    self.scale = 0;
    [self runAction:[CCFadeIn actionWithDuration:SPEED_PARAM]];
    
    CCRotateTo *rotationFull = [CCRotateBy actionWithDuration:3.8 angle:-360.0 ];
    [self runAction:[CCRepeatForever actionWithAction:rotationFull]]; 
    
    [self runAction:[CCSequence actions:
                     //[CCScaleTo actionWithDuration:ANIM_SPEED  scale:0],
                     [CCScaleTo actionWithDuration:SPEED_PARAM*0.5  scale:1.2],
                     [CCScaleTo actionWithDuration:SPEED_PARAM*0.5  scale:0.93],
                     //[CCCallFunc actionWithTarget:self selector:@selector(repeatBonusAction)],
                     nil]];
}


-(void)repeatFruitsAction
{
        CCSprite *sequenceAction = [CCSequence actions:
                                   [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.05],                  
                                   [CCScaleTo actionWithDuration:SPEED_PARAM/2  scale:1.0],
                                    nil];
    CCRepeatForever *repeatAction = [CCRepeatForever actionWithAction:sequenceAction];
    [self runAction:repeatAction];
}


////// GET BONUS BOOL
-(BOOL)getBombBonusBOOL{
    return bombBonusBOOL;
}
-(BOOL)getBoxBonusBOOL{
    return boxBonusBOOL;
}
-(BOOL)getMechBonusBOOL{
    return mechBonusBOOL;
}
-(BOOL)getBoomerangBonusBOOL{
    return boomerangBonusBOOL;
}

///// GET MONETAS BOOL
-(BOOL)getMonetaSmallBOOL{
    return monetaSmallBOOL;
}
-(BOOL)getMonetaMiddleBOOL{
    return moneatMiddleBOOL;
}
-(BOOL)getMonetaBigBOOL{
    return monetaBigBOOL;
}

///// GET BUDILNIK BOOL
-(BOOL)getBudilnikSmallBOOL{
    return budilnikSmallBOOL;
}
-(BOOL)getBudilnikMiddleBOOL{
    return budilnikMiddleBOOL;
}
-(BOOL)getBudilnikBigBOOL{
    return budilnikBigBOOL;
}



-(void)setSPEED_PARAM:(float)index
{
    SPEED_PARAM = index;
}
-(float)getSPEED_PARAM
{
    return SPEED_PARAM;
}

-(void)setBombNum:(int)index{
    bombBonusInt = index;   
}

-(int)getBombNum:(int)index{
    return bombBonusInt;
}


-(void)setBudilnik:(float)time
{
    budilnikStop = time;
   
    [self schedule:@selector(budilnikStart:)];
}
-(void)setBigBOOL
{
    bigBOOL = YES;
}
-(void)budilnikStart:(ccTime)dt
{
    timerBudilnik +=dt;
    CCLOG(@"*** TIMER BUDILNIK START ***");

    if(timerBudilnik >= 3.0)
    {
        budilnikDone = YES;
        [self wasDone];
         CCLOG(@"*** TIMER BUDILNIK FINISH ***");
        timerBudilnik = 0;
        [self unschedule:@selector(budilnikStart:)];
    }
}
 
-(void)monetaStart:(ccTime)dt
{
    timerMoneta +=dt;
    if(timerMoneta >= 1.5)
    {
        monetaDone = YES;
        [self wasDone];
        timerMoneta = 0;
        [self unschedule:@selector(monetaStart:)];
    }
}
-(void)bonusStart:(ccTime)dt
{
    timerBonus +=dt;
    if(timerBonus >= 3.5)
    {
        bonusDone = YES;
        [self wasDone];
        timerBonus = 0;
        [self unschedule:@selector(bonusStart:)];
    }
}
-(BOOL)getBonusDone
{
    return bonusDone;
}

-(BOOL)getMonetaDone
{
    return monetaDone;
}

-(BOOL)getBudilnikDone
{
    return budilnikDone;
}

-(void)setIndex:(int)index
{
    indexInt = index;
}

-(int)getIndex
{
    return indexInt;
}

-(void)setLifes:(int)lifes
{
    lifesInt = lifes;
}

-(int)getLifes
{
    return lifesInt;
}

-(void)displayLifes
{
    if(indexInt >= 0 && indexInt <= 5)
    {
        displayLabel.opacity = 255;
        if(indexInt == 5){
            displayLabel.position = ccp(self.contentSize.width/2,self.contentSize.height*8/10); 
        }
        else{
            displayLabel.position = ccp(self.contentSize.width/2,self.contentSize.height);
        }
        
        if(lifesInt < 0){
              [displayLabel setString:[NSString stringWithString:@"0"]]; //устанавливаем "0"
        }
        else{
        [displayLabel setString:[NSString stringWithFormat:@"%i",lifesInt]];
        }
    }
    else
    {
        displayLabel.opacity = 0;
    }

}


-(void)wasDone
{
    lifesInt = lifesInt-1;
    
    [self displayLifes];
    if (isUp == YES) 
    {
        if([self getLifes] <= 0)
        {
            if(indexInt>=0 && indexInt<=2)
            {
                [self stopAllActions];
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.5 scale:0],
                                 [CCFadeOut actionWithDuration:0.5],
                                nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
            else if(indexInt>=10 && indexInt<=12)             ///MONETI
            {
                [self stopAllActions];
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0],
                                 [CCFadeOut actionWithDuration:0.6],
                                 [CCRotateBy actionWithDuration:0.9 angle:-360.0],nil]];
                
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
            else if(indexInt>=13 && indexInt<=15)             ///BUDILNIKI
            {
                //[self stopAllActions];
                
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0],
                                 [CCFadeOut actionWithDuration:0.6],
                                 nil]];
                
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
            else if(indexInt>=6 && indexInt<=9)             ///BONUSI
            {
                //[self stopAllActions];
                
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0],
                                 [CCFadeOut actionWithDuration:0.6],
                                 nil]];
                
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
        }
    }

}

-(void)wasTapped
{
    lifesInt--;
    
    [self displayLifes];
    if (isUp == YES) 
    {
        if([self getLifes] <= 0)
        {
            if(indexInt>=0 && indexInt<=2)
            {
                [self stopAllActions];
                [self runAction:[CCSpawn actions:
                         [CCScaleTo actionWithDuration:0.5 scale:0],
                         [CCFadeOut actionWithDuration:0.5],nil]];
                [self runAction:[CCSequence actions:
                               [CCDelayTime actionWithDuration:0.7],
                               [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                               nil]];
                isUp = NO;
            }
            else if(indexInt>=3 && indexInt<=9)
            {
                [self stopAllActions];
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0],
                                 [CCFadeOut actionWithDuration:0.6],nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                
                isUp = NO;
            }
            else if (indexInt>= 10 && indexInt<=12)
            {
                //[self stopAllActions];
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0.5],
                                 [CCFadeOut actionWithDuration:1.5],
                                 [CCRotateBy actionWithDuration:0.5 angle:-360.0],
                                 [CCMoveTo actionWithDuration:0.6 position:ccp(30,s.height-20)]
                                 ,nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.9],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
            else if (indexInt>= 13 && indexInt<=15)
            {
                [self runAction:[CCSpawn actions:
                                  [CCScaleTo actionWithDuration:2.5 scale:10.0],
                                  [CCFadeOut actionWithDuration:4]
                                  ,nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:3.5],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                
                //[self stopAllActions];
                /*[self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0.5],
                                 [CCFadeOut actionWithDuration:1.5],
                                 [CCRotateBy actionWithDuration:0.5 angle:-360.0],
                                 [CCMoveTo actionWithDuration:0.6 position:ccp(30,s.height-20)]
                                 ,nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.9],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];*/
                isUp = NO;
            }
        }
    }
}

-(void)allDone
{
    [self removeFromParentAndCleanup:YES];
}

-(void)wasPowerUpTapped
{
    lifesInt = lifesInt-3;
    
    [self displayLifes];
    if (isUp == YES) 
    {
        if([self getLifes] <= 0)
        {
            if(indexInt>=0 && indexInt<=2)
            {
                [self stopAllActions];
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.5 scale:0],
                                 [CCFadeOut actionWithDuration:0.5],nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
            else 
            {
                [self stopAllActions];
                [self runAction:[CCSpawn actions:
                                 [CCScaleTo actionWithDuration:0.6 scale:0],
                                 [CCFadeOut actionWithDuration:0.6],nil]];
                [self runAction:[CCSequence actions:
                                 [CCDelayTime actionWithDuration:0.7],
                                 [CCCallFunc actionWithTarget:self selector:@selector(allDone)],
                                 nil]];
                isUp = NO;
            }
        }
    }
}



-(void)explosionEffect
{
    //------------------- EXPLOTION EFFECT ---------------------
    CCParticleExplosion *explosion = [CCParticleExplosion node];
    explosion.position = explosionPosition;
    explosion.texture = 
    [[CCTextureCache sharedTextureCache]addImage:@"bomb_particle.png"];
    //explosion.color = ccBLACK;
    //[explosion setStartColor:ccc3(255, 255, 255)];
    [explosion setDuration:0.1];
    [explosion setTotalParticles:240];
    [explosion setStartSize:1.5];
    [explosion setEndSize:0.2];
    ccColor4F startColor;
    
    if(indexInt == 0) // vishenka 
    {
    startColor.r = 0.f;
    startColor.g = 205.f;
    startColor.b = 225.f;
    startColor.a = 1.0f;
    }
    else if(indexInt == 1) // yagoda
    {
        startColor.r = 10.f;
        startColor.g = 0.f;
        startColor.b = 255.f;
        startColor.a = 0.99f;
    }
    else if(indexInt == 2) // malina
    {
        startColor.r = 15.f;
        startColor.g = 0.f;
        startColor.b = 0.f;
        startColor.a = 0.99f;
    }
    else if(indexInt == 3 || indexInt == 5) // lemon && ananas
    {
        startColor.r = 225.f;
        startColor.g = 225.f;
        startColor.b = 0.f;
        startColor.a = 1.0f;
    }
    else if(indexInt == 4) //pomidor
    {
        startColor.r = 125.f;
        startColor.g = 0.f;
        startColor.b = 0.f;
        startColor.a = 1.0f;
    }
    
    ccColor4F endColor;
    endColor.r = 0.f;
    endColor.g = 0.f;
    endColor.b = 0.f;
    endColor.a = 0.f;
    
    [explosion setScale:1.5];
    
    [explosion setStartColor:startColor];
    [explosion setEndColor:endColor];
    
    if(indexInt == 5 || indexInt == 4)
    {
        [explosion setSpeed:250];
    }
    else
    {
        [explosion setSpeed:200];
    }
    [explosion setLife:0.001];
    
    [self addChild:explosion z:100 tag:1];
    
    [self runAction:[CCSequence actions:
                     [CCDelayTime actionWithDuration:1.0],
                     [CCCallFunc actionWithTarget:self selector:@selector(explosionDone)],
                     nil]];
}

-(void)explosionDone
{
    [self removeChildByTag:1 cleanup:YES];
}


@end
