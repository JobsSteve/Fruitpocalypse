//
//  Game+Grenade.h
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game (Grenade)

-(void)grenadeActionUpdate:(ccTime)dt;
-(void)startGrenade;
-(void)closeGrenade;
-(void)grenadeExplosion;
-(void)explosionDone;

@end
