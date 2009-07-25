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
    // reference to Model
    IBOutlet PolygonShape *myPolygonShape;

}

@end
