//
//  TutorScene.m
//  Touch_Project
//
//  Created by Артур on 19.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TutorScene.h"
#import "LoaderScene.h"

@implementation TutorScene
@synthesize scrollLayer;

/*+(id) scene{
 CCScene *scene = [CCScene node];
 Game *layer = [Game node];
 [scene addChild: layer];
 return scene;
 }*/


- (void) dealloc{
	[super dealloc];
}

-(id) init
{
	if((self=[super init])) 
    {
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];
		size = [[CCDirector sharedDirector] winSize];
		label.position =  ccp( size.width+50 , size.height+50 );
        //label.opacity = 0;
		[self addChild: label z:1000];
		
		self.scrollLayer = [ScrollLayer node];
		self.scrollLayer.contentSize = CGSizeMake(320, 480);
		self.scrollLayer.position = ccp( size.width /2 , size.height/2 );
		self.scrollLayer.pageSize = 4;
		NSMutableArray* array = [NSMutableArray arrayWithCapacity:0];
		CCSprite* temp;
		
        temp = [CCSprite node];
        temp = [CCSprite spriteWithFile:@"TUTORS_1.png"];
		//temp.color = ccRED;
		temp.textureRect = CGRectMake(0, 0, 320, 480);
		[array addObject:temp];
        
		temp = [CCSprite node];
        temp = [CCSprite spriteWithFile:@"TUTORS_2.png"];
		//temp.color = ccBLUE;
		temp.textureRect = CGRectMake(0, 0, 320, 480);
		[array addObject:temp];
        
		/*temp = [CCSprite node];
         temp.color = ccWHITE;
         temp.textureRect = CGRectMake(0, 0, 250, 200);
         [array addObject:temp];
         */
        
		temp = [CCSprite node];
        temp = [CCSprite spriteWithFile:@"TUTORS_3.png"];
		//temp.color = ccGRAY;
		temp.textureRect = CGRectMake(0, 0, 320, 480);
		[array addObject:temp];
        
		temp = [CCSprite node];
        temp = [CCSprite spriteWithFile:@"TUTORS_4.png"];
		//temp.color = ccGREEN;
		temp.textureRect = CGRectMake(0, 0, 320, 480);
		[array addObject:temp];
		
		scrollLayer.arrayPages = array;
		scrollLayer.pageSize = 4;
		scrollLayer.currentPage = 0;
		[scrollLayer makePages];
		[self addChild:self.scrollLayer];
        
        tutor0BOOL = YES;
        tut0BOOL = YES;
        
        tutor3BOOL = YES;
        tut3BOOL = YES;
		
        //i = 0;
        
        //[self setPageNumberLabel];
        [self setSlideToContinue];
        // [self setTouchTestSprite];
        [self setSlideIndicator];
        
        [self schedule:@selector(conditionUpdate:) interval:0.5];
        [self schedule:@selector(pageNumberUpdate:) interval:0.1];
        
	}
	return self;
}

-(void)setSlideIndicator
{
    CCSprite *slotInterface;
    slotInterface = [CCSprite spriteWithFile:@"blank.png"];
    //slotInterface.position = ccp(size.width*0.5,size.height);
    [self addChild:slotInterface];
    
    slideIndicator = [CCSprite spriteWithFile:@"slider_indicator.png"];
    //slideIndicator.position = ccp();
    [slotInterface addChild:slideIndicator z:11];
    
    for(int i=0;i<3;i++)
    {
        slot = [CCSprite spriteWithFile:@"slider_slot.png"];
        //slot.position = ccp(slotInterface.position.x/2,slotInterface.position.y/2);
        slot.position = ccp(size.width*0.5 +i*slot.contentSize.width*1.25,size.height*0.06);
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

-(void)setPageNumberLabel
{
    /*pageLabel = [CCLabelTTF labelWithString:@"page:0" fontName:@"Marker Felt" fontSize:25];
     pageLabel.color = ccWHITE;
     pageLabel.position = ccp(size.width*0.5,size.height*0.6);
     [self addChild:pageLabel z:100];*/
    
    [self schedule:@selector(pageNumberUpdate:) interval:0.5];
}

-(void)setSlideToContinue
{
    slideToSprite = [CCSprite spriteWithFile:@"slideto.png"];
    slideToSprite.position = ccp(size.width - [slideToSprite contentSize].width*0.45,0+[slideToSprite contentSize].height*0.59);
    slideToSprite.scale = 0.9;
    [self addChild:slideToSprite z: 101];
    slideToSprite.opacity = 0;
    [self runSlideToContinueAction];
}

-(void)runSlideToContinueAction
{
    slideToSprite.opacity = 205;
    CCBlink *slideBlink = [CCBlink actionWithDuration:2.0 blinks:1];
    CCDelayTime *slideDelay = [CCDelayTime actionWithDuration:0.5];
    CCSequence *slideSequence = [CCSequence actions:
                                 slideDelay,slideBlink, nil];
    CCRepeatForever *blinkForever = [CCRepeatForever actionWithAction:slideSequence];
    [slideToSprite runAction: blinkForever];
}


-(void)conditionUpdate:(ccTime)dt
{
    conditionTimer += dt;
    //CCLOG(@"CONDITION_TIMER == %f",conditionTimer);
    /* if (scrollLayer.currentPage == 0 && tutor0BOOL == YES)
     {
     //[tempSprite disableTouch];
     if  (conditionTimer >= 5.0f) {
     //[tempSprite enableTouch];
     [self runSlideToContinueAction];
     conditionTimer = 0;
     tutor0BOOL = NO;
     } }
    */
    
    if (scrollLayer.currentPage == 3 && tutor3BOOL == YES)
    {
        //[tempSprite disableTouch];
        if  (conditionTimer >= 1.5f) {
            //[tempSprite enableTouch];
            //[self runSlideToContinueAction];
            
            [self runAction:[CCSequence actions:
                             [CCDelayTime actionWithDuration:0.5],
                             [CCCallFunc actionWithTarget:self selector:@selector(transitionToGameplay)],nil]];
            conditionTimer = 0;
            tutor3BOOL = NO;
        } 
    }
}

/*-(void)setTouchTestSprite
 {
 tempSprite = [CCSprite spriteWithFile:@"TUTORS_4.png"];
 //tempSprite.color = ccBLACK;
 //tempSprite.textureRect = CGRectMake(0, 0, 320, 480);
 tempSprite.position = ccp(size.width/2,size.height/2);
 tempSprite.opacity = 50;
 //[self addObject:tempSprite z:1001];
 [self addChild:tempSprite z: 1001];
 }*/

-(void)transitionToGameplay
{
    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:1.5 scene:[LoaderScene node] withColor:ccBLACK]];
    
}

-(void)pageNumberUpdate:(ccTime)dt
{
    if (scrollLayer.currentPage < 3 && tut0BOOL == YES)
    {    
        slideIndicator.position = ccp(size.width*0.5 +scrollLayer.currentPage*slot.contentSize.width*1.25 ,size.height*0.06);
    }
    
    CCLOG(@"PAGE NUMBER = %d",scrollLayer.currentPage);
    
    /*
    if(scrollLayer.currentPage == 1)
    {
        page1Bool = YES;
        
    }

    if(page1Bool == YES && scrollLayer.currentPage < 1)
    {
        scrollLayer.currentPage = 1;
    }

    if(scrollLayer.currentPage == 2)
    {
        page2Bool = YES;
    
    }

    if(page2Bool == YES && scrollLayer.currentPage < 2)
    {
        scrollLayer.currentPage = 2;
    }
    */


}


@end
