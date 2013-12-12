//
//  Game+AdditionalMethods.h
//  Touch_Project
//
//  Created by Артур on 20.09.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@interface Game (AdditionalMethods)


-(void)blackForeground;
-(void)boundaryBox;
-(void)setAdsBanner;

-(void)didScore;
-(void)didCountFruits;

-(void)enableTouch;
-(void)disableTouch;


@end
