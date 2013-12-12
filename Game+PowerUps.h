//
//  Game+PowerUpsPanel.h
//  Touch_Project
//
//  Created by Артур on 19.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game (PowerUps)

-(void)setPowerUps;
-(void)powerUpsMoveDown;
-(void)powerUpsMoveBack;
-(void)hidePowerUps;
-(void)showPowerUps;

-(void)setBonusIndicators;

@end
