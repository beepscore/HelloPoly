//
//  PolygonView.h
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PolygonShape;

@interface PolygonView : UIView {
    // instance variables 
    // reference to Model
    IBOutlet PolygonShape *myPolygonShape;

    IBOutlet UILabel *polygonNameLabel;
}

// properties

// methods
+ (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides; 

@end
