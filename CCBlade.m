//
//  CCBlade.m
//  Touch_Project
//
//  Created by Артур on 19.07.12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "CCBlade.h"

inline float fangle(CGPoint vect){
	if (vect.x == 0.0 && vect.y == 0.0) {
		return 0;
	}
	
	if (vect.x == 0.0) {
		return vect.y > 0 ? M_PI/2 : -M_PI/2;
	}
	
	if (vect.y == 0.0 && vect.x < 0) {
		return -M_PI;
	}
	
	float angle = atan(vect.y / vect.x);
    
	return vect.x < 0 ? angle + M_PI : angle;
}

inline void f1(CGPoint p1, CGPoint p2, float d, CGPoint *o1, CGPoint *o2){
	float l = ccpDistance(p1, p2);
	float angle = fangle(ccpSub(p2, p1));
	*o1 = ccpRotateByAngle(ccp(p1.x + l,p1.y + d), p1, angle);
	*o2 = ccpRotateByAngle(ccp(p1.x + l,p1.y - d), p1, angle);
}

inline float lagrange1(CGPoint p1, CGPoint p2, float x){
	return (x-p1.x)/(p2.x - p1.x)*p2.y + (x-p2.x)/(p1.x - p2.x)*p1.y ;
}

inline void CGPointSet(CGPoint *v, float x, float y){
	v->x = x;
	v->y = y;
}

@implementation CCBlade
@synthesize texture = _texture;
@synthesize pointLimit;
@synthesize width;
@synthesize autoDim;

+ (id) bladeWithMaximumPoint:(int) limit{
    return [[[self alloc] initWithMaximumPoint:limit] autorelease];    
}

- (id) initWithMaximumPoint:(int) limit{
    self = [super init];
    
    pointLimit = limit;
	self.width = 5;
	
    vertices = (CGPoint *)calloc(2*limit+5, sizeof(vertices[0]));
    coordinates = (CGPoint *)calloc(2*limit+5, sizeof(coordinates[0]));
    
    CGPointSet(coordinates+0, 0.00, 0.5);
    reset = NO;
    
    path = [[NSMutableArray alloc] init];
    
    return self;
}

- (void) dealloc{
    [_texture release];
    free(vertices);
    free(coordinates);
    
    [path release];	
	[super dealloc];
}

- (void) populateVertices{
    vertices[0] = [[path objectAtIndex:0] CGPointValue];
    CGPoint pre = vertices[0];
    
    unsigned int i = 0;
    CGPoint it = [[path objectAtIndex:1] CGPointValue];
	float dd = width / [path count];
	while (i < [path count] - 2){
		f1(pre, it, width - i * dd , vertices+2*i+1, vertices+2*i+2);
		CGPointSet(coordinates+2*i+1, .5, 1.0);
		CGPointSet(coordinates+2*i+2, .5, 0.0);
		
		i++;
		pre = it;
		
		it = [[path objectAtIndex:i+1] CGPointValue];
	}
    
    CGPointSet(coordinates+1, 0.25, 1.0); 
	CGPointSet(coordinates+2, 0.25, 0.0);
	
	vertices[2*[path count]-3] = it;
	CGPointSet(coordinates+2*[path count]-3, 0.75, 0.5);
}

- (void) shift{
	int index = 2 * pointLimit - 1;
	for (int i = index; i > 3; i -= 2) {
		vertices[i] = vertices[i-2];
		vertices[i-1] = vertices[i-3];
	}
}

- (void) setWidth:(float)width_{
    width = width_ * CC_CONTENT_SCALE_FACTOR();
}

#define DISTANCE_TO_INTERPOLATE 10

- (void) push:(CGPoint) v{
    _willPop = NO;
    
	if (reset) {
		return;
	}
    if (CC_CONTENT_SCALE_FACTOR() != 1.0f) {
        v = ccpMult(v, CC_CONTENT_SCALE_FACTOR());
    }
    
#if USE_LAGRANGE
    
    if ([path count] == 0) {
        [path insertObject:[NSValue valueWithCGPoint:v] atIndex:0];
        return;
    }
    
    CGPoint first = [[path objectAtIndex:0] CGPointValue];
    if (ccpDistance(v, first) < DISTANCE_TO_INTERPOLATE) {
        [path insertObject:[NSValue valueWithCGPoint:v] atIndex:0];
        if ([path count] > pointLimit) {
            [path removeLastObject];
        }
    }else{
        int num = ccpDistance(v, first) / DISTANCE_TO_INTERPOLATE;
        CGPoint iv = ccpMult(ccpSub(v, first), (float)1./(num + 1));
		for (int i = 1; i <= num + 1; i++) {
            [path insertObject:[NSValue valueWithCGPoint:ccpAdd(first, ccpMult(iv, i))] atIndex:0];
		}
		while ([path count] > pointLimit) {
			[path removeLastObject];
		}
    }
#else // !USE_LAGRANGE
	path.push_front(v);
	if (path.size() > pointLimit) {
		path.pop_back();
	}
#endif // !USE_LAGRANGE
    
	
	[self populateVertices];
}

- (void) pop:(int) n{
    while ([path count] > 0 && n > 0) {
        [path removeLastObject];
        n--;
    }
    
    if ([path count] > 2) {
        [self populateVertices];
    }
}

- (void) clear{
    [path removeAllObjects];
	reset = NO;
    if (_finish)
        [self removeFromParentAndCleanup:YES];
} 

- (void) reset{
	reset = TRUE;
}

- (void) dim:(BOOL) dim{
	reset = dim;
}

- (void) draw{
    if ((reset && [path count] > 0) || (self.autoDim && _willPop)) {
        [self pop:1];
        if ([path count] < 3) {
            [self clear];
        }
    }
    
    if ([path count] < 3) {
        return;
    }
    
    _willPop = YES;
	
    glDisableClientState(GL_COLOR_ARRAY);
    NSAssert(_texture, @"NO TEXTURE SET");
    
    glBindTexture(GL_TEXTURE_2D, _texture.name);
    glVertexPointer(2, GL_FLOAT, 0, vertices);
    glTexCoordPointer(2, GL_FLOAT, 0, coordinates);
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 2*[path count]-2);
	glEnableClientState(GL_COLOR_ARRAY);
}

- (void) finish
{
    _finish = YES;
}

@end