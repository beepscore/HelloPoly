//
//  PolygonShape.m
//
//  Created by Steve Baker on 7/12/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.

// Statements in a .h header file are exposed.  Others can see properties, methods, imports.
// Statements in a .m implementation file are encapsulated.  Others can't see instance variables.
// To #import framework classes, delimit with < >.
// To #import user header, delimit with " ".
// .m file imports .h file of the same name.
#import "PolygonShape.h"

@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

+ (NSString*)polygonNameWithNumberOfSides:(int)numSides {
    // array index equals number of sides.
    // setting index 0,1,2 to nil gave out of bounds error.  Maybe the first nil terminated the array.
    NSArray *polygonNames = [NSArray arrayWithObjects: @"noZeroPoly", @"noOnePoly", @"noTwoPoly", 
                             @"Triangle", @"Square", @"Pentagon", @"Hexagon", @"Septagon", @"Octagon", 
                             @"Nonagon", @"Decagon", @"Hendecagon", @"Dodecagon", nil];
    return [polygonNames objectAtIndex: numSides];
}

- (id)init {    
    // allow superclass to initialize its state first
    self = [super init];
    if (self) {
        [self initWithNumberOfSides:5];        
    }
    return self;
}

- (id)initWithNumberOfSides:(int)sides { 
    // allow superclass to initialize its state first
    self = [super init];    
    if (self) {
        [self initWithNumberOfSides:sides minimumNumberOfSides:3 maximumNumberOfSides:10];
    }
    return self;
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {    
    // allow superclass to initialize its state first
    self = [super init];    
    if (self) {
        [self setMinimumNumberOfSides: min];
        [self setMaximumNumberOfSides: max];
        [self setNumberOfSides: sides];
    }
    return self;
}

// override default dealloc method
// Never call dealloc explicitly except in [super dealloc]. Let the system call it.
- (void)dealloc { 
    // Do any cleanup that’s necessary
    NSLog(@"Deallocating %@", self.name);
    // TODO explicitly release objects that self was using such as instance variables
    [self.name release];
    //self.name = nil;  // this gives error - either readonly property or no setter found
    [self.description release];
    //self.description = nil;  // this gives error - either readonly property or no setter found
    // TODO release polygonNames array?

    // Don't need to release int types, they aren't objects?
    // [numberOfSides release];   // this gives error- invalid receiver type 'int'

    // Last, dealloc super class
    // see http://stackoverflow.com/questions/1030766/call-release-in-class-or-subclass
    [super dealloc];
}

- (void)setMinimumNumberOfSides:(int)minSides { 
    #define MIN_SIDES 3
    if (minSides < MIN_SIDES) {
        NSLog(@"Invalid minimum number of sides: %i is less than the minimum of %i allowed",
              minSides, (int)MIN_SIDES);
    }
    else minimumNumberOfSides = minSides;
}

- (void)setMaximumNumberOfSides:(int)maxSides { 
    #define MAX_SIDES 12
    if (maxSides > MAX_SIDES) {
        NSLog(@"Invalid maximum number of sides: %i is greater than the maximum of %i allowed",
              maxSides, (int)MAX_SIDES);
    }
    else maximumNumberOfSides = maxSides;
}

- (void)setNumberOfSides:(int)numSides { 
    bool numbersOfSidesSatisfyConstraints = TRUE;
    
    if (numSides < self.minimumNumberOfSides) {
        numbersOfSidesSatisfyConstraints = FALSE;
        NSLog(@"Invalid number of sides: %i is less than the minimum of %i allowed",
              numSides, self.minimumNumberOfSides);
    }
    if (numSides > self.maximumNumberOfSides) {
        numbersOfSidesSatisfyConstraints = FALSE;
        NSLog(@"Invalid number of sides: %i is greater than the maximum of %i allowed",
              numSides, self.maximumNumberOfSides);
    }
    if (self.minimumNumberOfSides > self.maximumNumberOfSides) {
        numbersOfSidesSatisfyConstraints = FALSE;
        NSLog(@"Minimum number of sides must be less than or equal to maximum");
    }    
    
    if (numbersOfSidesSatisfyConstraints) {
        numberOfSides = numSides;
    }
}

- (float)angleInDegrees {    
    return (180. * (self.numberOfSides-2) / self.numberOfSides);    
} 

- (float)angleInRadians {    
    return (M_PI * (self.angleInDegrees / 180.));    
}

- (NSString*)name { 
    //      receiver == PolygonShape class
    //                   message == action == (polygonNameWithNumberOfSides method + argument)
    return [PolygonShape polygonNameWithNumberOfSides: self.numberOfSides];
}

- (NSString*)description {
    return [NSString stringWithFormat: 
            @"Hello I am a %d-sided polygon (aka a %@) with angles of %1.0f degrees (%1.6f radians)", 
            self.numberOfSides, self.name, self.angleInDegrees, self.angleInRadians];
} 

@end
