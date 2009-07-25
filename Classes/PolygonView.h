//
//  PolygonView.h
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
    // instance variables 
    // reference to Model
    IBOutlet PolygonShape *myPolygonShape;
}

// properties

// methods
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides; 

@end
