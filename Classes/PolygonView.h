//
//  PolygonView.h
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//
#define kMinimumGestureLength 10.
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
}

// properties
@property CGPoint gestureStartPoint;

// methods
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
- (void)rotatePolygonView:(float)angleInDegrees;



@end
