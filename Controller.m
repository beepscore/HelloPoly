#import "Controller.h"
#import "PolygonShape.h"
#import "PolygonView.h"

@implementation Controller
- (void)awakeFromNib {

    // see icodeblog.com iPhone Programming Tutorial – Saving/Retrieving Data Using NSUserDefaults
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    // if running app for first time, prefs hasn't been set and the integer value defaults to 0
    if ([prefs integerForKey: @"numberOfSides"] == 0) {
        [prefs setInteger:5 forKey: @"numberOfSides"];
    }
    
    [myPolygonShape initWithNumberOfSides:[prefs integerForKey: @"numberOfSides"] 
                     minimumNumberOfSides:3 maximumNumberOfSides:12];
    
    numberOfSidesSlider.minimumValue = myPolygonShape.minimumNumberOfSides;
    numberOfSidesSlider.maximumValue = myPolygonShape.maximumNumberOfSides;
    numberOfSidesSlider.value = myPolygonShape.numberOfSides;

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
    [decreaseButton release], decreaseButton = nil;
    [increaseButton release], increaseButton = nil;
    [myPolygonShape release], myPolygonShape = nil;
    [myPolygonView release], myPolygonView = nil;

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

- (IBAction)sliderChanged:(id)sender{
    NSLog(@"Controller sliderChanged method");
    myPolygonShape.numberOfSides = numberOfSidesSlider.value;
    [self updateInterface];
}

- (void)updateInterface { 
    NSLog(@"%@", [myPolygonShape description]);
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", myPolygonShape.numberOfSides];
    numberOfSidesSlider.value = myPolygonShape.numberOfSides;
    
    // see icodeblog.com iPhone Programming Tutorial – Saving/Retrieving Data Using NSUserDefaults 
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:myPolygonShape.numberOfSides forKey: @"numberOfSides"];

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
    
    [myPolygonView setNeedsDisplay];
}

@end
