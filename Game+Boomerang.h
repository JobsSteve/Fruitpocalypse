//
//  Game+Boomerang.h
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game (Boomerang) 


-(void)startBoomerang;
-(void)closeBoomerang;
-(void)boomerangKick;
-(void)bezierAction2;
-(void)stopBoomerangAction;
-(void)boomerangUpdate:(ccTime)dt;

@end
