#import "Controller.h"
#import "PolygonShape.h"
#import "PolygonView.h"

@implementation Controller
- (void)awakeFromNib {

    [myPolygonShape initWithNumberOfSides:5 
                     minimumNumberOfSides:3 maximumNumberOfSides:12];
    
    //[myPolygonView initWithFrame:CGRectMake(200., 200., 150., 200.)];
    // TODO [myPolygonView init];  // this caused iphone screen to not redraw poly
    [self updateInterface];
}

// override deault dealloc method
// see http://stackoverflow.com/questions/1030766/call-release-in-class-or-subclass
// Never call dealloc explicitly except in [super dealloc]. Let the system call it.
- (void)dealloc { 
    // Do any cleanup that’s necessary
    NSLog(@"Deallocating %@", self.description);
    // Explicitly release objects that self was using such as instance variables
    // Release any instance variables declared as IBOutlets.  See 0607-FollowUpNotes.pdf
    // Don't need to release int types, they aren't objects.
    // Defensive programming - set pointer to nil after release instance.
    // After everyone releases references, that portion of heap memory may be written to by anyone.
    // Accidentally using the pointer to the old location could work or could crash.
    // These bugs can show up intermittently/infrequently and can be very hard to debug.
    [decreaseButton release];
    decreaseButton = nil;
    [increaseButton release];
    increaseButton = nil;
    [myPolygonShape release];
    myPolygonShape = nil;
    [myPolygonView release];
    myPolygonView = nil;

    // Last, dealloc super class
    [super dealloc];
}

- (IBAction)decrease {
    NSLog(@"Controller decrease method");
    myPolygonShape.numberOfSides--;
    [self updateInterface];
}

- (IBAction)increase {
    NSLog(@"Controller increase method");
    myPolygonShape.numberOfSides++;
    [self updateInterface];
}

- (void)updateInterface { 
    NSLog([myPolygonShape description]);
    [myPolygonView setNeedsDisplay];
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", myPolygonShape.numberOfSides];
    
    if (myPolygonShape.numberOfSides > myPolygonShape.minimumNumberOfSides) {
        decreaseButton.enabled = YES;
        decreaseButton.alpha = 1.0f;
    }
    else {
        decreaseButton.enabled = NO;
        decreaseButton.alpha = 0.5f;
    }
    if (myPolygonShape.numberOfSides < myPolygonShape.maximumNumberOfSides) {
        increaseButton.enabled = YES;
        increaseButton.alpha = 1.0f;
    }
    else {
        increaseButton.enabled = NO;
        increaseButton.alpha = 0.5f;
    }
}

@end
