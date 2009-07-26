//
//  PolygonView.m
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//
#import "PolygonView.h"

@implementation PolygonView

// properties

//methods

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

//  TODO program draws pentagon, drawing doesn't update for new numberOfSides.
//  Need to initialize myPolyPoints array at each call?
//  [myPolyPoints release];  // I tried this at end of drawRect method, it gave error
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // fill background
    [[UIColor yellowColor] set]; 
    UIRectFill (rect);
    
    NSArray *myPolyPoints = [PolygonView pointsForPolygonInRect: rect
                                numberOfSides: myPolygonShape.numberOfSides];
    
    CGContextBeginPath (context);
    // first vertex at index 0
    CGContextMoveToPoint (context, 
                          [[myPolyPoints objectAtIndex:0] CGPointValue].x,
                          [[myPolyPoints objectAtIndex:0] CGPointValue].y); 

    int count = [myPolyPoints count];
    // start at second vertex at index 1
    for (int i = 1; i < count; i++) { 
        CGContextAddLineToPoint (context, 
                                 [[myPolyPoints objectAtIndex:i] CGPointValue].x, 
                                 [[myPolyPoints objectAtIndex:i] CGPointValue].y); 
    }
    CGContextClosePath (context); 
    [[UIColor redColor] setFill]; 
    [[UIColor blackColor] setStroke]; 
    CGContextDrawPath (context, kCGPathFillStroke);
}

+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
    float radius = 0.9 * center.x; 
    NSMutableArray *result = [NSMutableArray array]; 
    float angle = (2.0 * M_PI) / numberOfSides; 
    float exteriorAngle = M_PI - angle; 
    float rotationDelta = angle - (0.5 * exteriorAngle); 
    
    for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
        float newAngle = (angle * currentAngle) - rotationDelta; 
        float curX = cos(newAngle) * radius; 
        float curY = sin(newAngle) * radius; 
        [result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
                                                                    center.y + curY)]]; 
    } 
    return result; 
} 

// override default dealloc method
- (void)dealloc { 
    // Do any cleanup that’s necessary
    [myPolygonShape release];
    myPolygonShape = nil;
    
    // Last, dealloc super class
    [super dealloc];
}

@end