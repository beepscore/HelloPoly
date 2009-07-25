//  PolygonShape.h
//
//  Created by Steve Baker on 7/12/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//
//#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>
//  TODO  I thought to import Controller.h to access text label.  It made a build error.  Why?
// #import "Controller.h"

@interface PolygonShape : NSObject {
    // instance variables 
    int numberOfSides;
    int minimumNumberOfSides;
    int maximumNumberOfSides;
}

// properties
@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

// methods
+ (NSString*)polygonNameWithNumberOfSides:(int)numSides;

// override default init method inherited fromm superclass NSObject
- (id)init;
- (id)initWithNumberOfSides:(int)sides;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;

// override default dealloc method
- (void)dealloc;

- (void)setMinimumNumberOfSides:(int)minSides;
- (void)setMaximumNumberOfSides:(int)maxSides;
- (void)setNumberOfSides:(int)numSides;

- (NSString*)description;

@end

