//
//  PolygonView.m
//  HelloPoly
//
//  Created by Steve Baker on 7/25/09.
//  Copyright 2009 Beepscore LLC. All rights reserved.
//

#import "PolygonView.h"


@implementation PolygonView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
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
