//
//  Game+Mech.h
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game (Mech)


-(void)setMoveSprite;
-(void)mechUpdate:(ccTime)dt;
-(void)startMech;
-(void)closeMech;

@end
