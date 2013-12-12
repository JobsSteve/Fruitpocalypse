//
//  Random_Test.m
//  Touch_Project
//
//  Created by Артур on 04.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Random_Test.h"

#import "Fruit.h"

@implementation Random_Test

- (void)dealloc
{
    [super dealloc];
}


-(id)init
{
    if((self=[super init]))
    {
        //upTime = 2.0f;
        //type = MOLE_TYPE_A;
        //delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        
    }
    return self;
}

-(void)onEnterTransitionDidFinish
{
    [[CCTouchDispatcher sharedDispatcher] addStandardDelegate:self priority:0];
    [[[CCDirector sharedDirector] openGLView] setMultipleTouchEnabled:YES];
    
    [self initializeGame];
}

-(void)initializeGame
{
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[CCDirector sharedDirector] resume];
    s = [[CCDirector sharedDirector] winSize];
 

     //Fruit *fruit =  [Fruit spriteWithFile:image];
}

-(void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self addIndex];
    
}

-(void)addIndex
{
    
    fruitTypes = [NSArray arrayWithObjects:@"vishenka.png",@"yagoda.png",@"malina.png",@"ananas.png",nil]; 
   
    int i = CCRANDOM_0_1()*4;
    CCLOG(@"i = %d",i);
    
    CCLOG(@"count = %d",fruitTypes.count);
    
    NSString *image =[fruitTypes objectAtIndex:i];
 CCLOG(@" i = %@",image);
    
   
    
    
    
    Fruit *fruit =  [Fruit spriteWithFile:image];
    
    fruit.position = ccp(s.width/2,s.height/2);

    [self addChild:fruit];
    
   // fruit.position = ccp(xInt,yInt);
    
   
    
}


@end
