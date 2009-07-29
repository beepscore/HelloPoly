//
//  PolygonView.h
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//
#define kMinimumGestureLength 10
#define kMinimumPinchDelta 20

#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>
@class PolygonShape;

#define degreesToRadians(x) (M_PI * x / 180.0)

@interface PolygonView : UIView {
    // instance variables 
    // reference to Model
    IBOutlet PolygonShape *myPolygonShape;

    IBOutlet UILabel *polygonNameLabel;
    CGPoint gestureStartPoint;
    CGFloat initialDistance;
}

// properties
@property CGPoint gestureStartPoint;
@property CGFloat initialDistance;

// methods
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
- (void)rotatePolygonView:(float)angleInDegrees;
- (void)scalePolygonView:(float)scaleFactor;

@end
