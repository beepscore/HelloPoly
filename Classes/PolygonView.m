//
//  PolygonView.m
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//
#import "PolygonView.h"
#import "PolygonShape.h"
#import "CGPointUtils.h"

@implementation PolygonView

// properties
@synthesize gestureStartPoint;
@synthesize initialDistance;

//methods

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    NSLog(@"drawRect method. myPolygonShape.numberOfSides = %d", myPolygonShape.numberOfSides);
    CGContextRef context = UIGraphicsGetCurrentContext();
    // draw background
    // background fill was set in IB
    // stroke border
    //[[UIColor blackColor] setStroke]; 
    //UIRectFrame(rect);
    
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
    
    // draw label
    polygonNameLabel.text = myPolygonShape.name; 
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

- (void)rotatePolygonView:(float)angleInDegrees {    
    // see http://iphonedevelopment.blogspot.com/2008/10/demystifying-cgaffinetransform.html
    self.transform = CGAffineTransformRotate(self.transform, degreesToRadians(angleInDegrees));
}

- (void)scalePolygonView:(float)scaleFactor {
    // range scale from 0.1 to 1
    float scaleRanged = MIN(MAX(scaleFactor, 0.9), 1.1);
    self.transform = CGAffineTransformScale(self.transform, scaleRanged, scaleRanged);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 2) {
        NSArray *twoTouches = [touches allObjects];
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        initialDistance = distanceBetweenPoints(
            [first locationInView:self], [second locationInView:self]);
    }
    else {
        UITouch *touch = [touches anyObject];
       gestureStartPoint = [touch locationInView:self];
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if ([touches count] == 2) {
        NSArray *twoTouches = [touches allObjects];
        UITouch *first = [twoTouches objectAtIndex:0];
        UITouch *second = [twoTouches objectAtIndex:1];
        CGFloat currentDistance = distanceBetweenPoints(
            [first locationInView:self], [second locationInView:self]);
        NSLog(@"touches count = %d  currentDistance = %3.2f", [touches count], currentDistance);
        if (initialDistance == 0)
            initialDistance = currentDistance;
        else if (currentDistance - initialDistance > kMinimumPinchDelta) {
            // outward pinch
            [self scalePolygonView:1.05]; 
        }
        else if (currentDistance - initialDistance <  -kMinimumPinchDelta) {
             //inward pinch
             [self scalePolygonView:0.95]; 
        }   

    }
    else {
        UITouch *touch = [touches anyObject];
        CGPoint currentPosition = [touch locationInView:self];
        CGFloat deltaX = (gestureStartPoint.x - currentPosition.x);
        if (fabsf(deltaX) >= kMinimumGestureLength) {
        [self rotatePolygonView: (-10*(int)(deltaX/10.))];
        }
    }
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
