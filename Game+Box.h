//
//  Game+Box.h
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game (Box)


-(void)startBox;
-(void)closeBox;
-(void)boxKick:(ccTime)dt;

@end
