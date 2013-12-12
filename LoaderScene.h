//
//  LoaderScene.h
//  Touch_Project
//
//  Created by Артур on 19.10.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface LoaderScene : CCLayer
{
    CGSize size;
    
    CCSprite *slideIndicator;
    
    CCSprite* slot;
    
    float loadTimer;
    float loadEndTimer;
    
    int num;
    
   // NSArray *fruitTypes;
    CCSprite *fruit;
    
    CCSprite *slotInterface;
    
    NSInteger loaderIndex;
}

+(CCScene*)scene;

@end
