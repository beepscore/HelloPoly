//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Steve Baker on 7/19/09.
//  Copyright Beepscore LLC 2009. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}

@end
