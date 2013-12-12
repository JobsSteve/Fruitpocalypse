//
//  CCBlade.h
//  Touch_Project
//
//  Created by Артур on 19.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "cocos2d.h"

#define USE_LAGRANGE    1
#define USE_STL_LIST    0

inline float fangle(CGPoint vect);
inline float lagrange1(CGPoint p1, CGPoint p2, float x);

inline void CGPointSet(CGPoint *v, float x, float y);
inline void f1(CGPoint p1, CGPoint p2, float d, CGPoint *o1, CGPoint *o2);

@interface CCBlade : CCNode {
    NSMutableArray *path;
	unsigned int pointLimit;
	int count;
	CGPoint *vertices;
	CGPoint *coordinates;
	BOOL reset;
	CCTexture2D *_texture;	
	float width;
    BOOL _finish;
    BOOL _willPop;
}
@property (readonly)unsigned int pointLimit;
@property(retain) CCTexture2D *texture;
@property(nonatomic) float width;
@property (nonatomic, assign) BOOL autoDim;

+ (id) bladeWithMaximumPoint:(int) limit;
- (id) initWithMaximumPoint:(int) limit;
- (void) push:(CGPoint) v;
- (void) pop:(int) n;
- (void) clear;
- (void) reset;
- (void) dim:(BOOL) dim;
- (void) finish;

@end