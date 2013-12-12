//
//  PopUp.h
//  Touch_Project
//
//  Created by Артур on 12.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface PopUp : CCSprite
{
    CCSprite *window,*bg;
    CCNode *container;
}


+(id)popUpWithSprite:(CCNode *)sprite andWindow:(CCNode*)sprite2;
- (id)initWithSprite:(CCNode *)sprite andWindow:(CCNode*)sprite2;

-(void)closePopUp;


@end
