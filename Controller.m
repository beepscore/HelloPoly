#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    NSLog(@"Controller decrease method");
    myPolygonOutlet.numberOfSides--;
    [self updateInterface];
}

- (IBAction)increase {
    NSLog(@"Controller increase method");
    myPolygonOutlet.numberOfSides++;
    [self updateInterface];
}

- (void)awakeFromNib { 
    [myPolygonOutlet initWithNumberOfSides:5 
                      minimumNumberOfSides:3 maximumNumberOfSides:12];
    [self updateInterface];
}

- (void)updateInterface { 
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", myPolygonOutlet.numberOfSides];
    NSLog([myPolygonOutlet description]);
    
    if (myPolygonOutlet.numberOfSides > myPolygonOutlet.minimumNumberOfSides) {
        decreaseButton.enabled = YES;
        decreaseButton.alpha = 1.0f;
    }
    else {
        decreaseButton.enabled = NO;
        decreaseButton.alpha = 0.5f;
    }
    if (myPolygonOutlet.numberOfSides < myPolygonOutlet.maximumNumberOfSides) {
        increaseButton.enabled = YES;
        increaseButton.alpha = 1.0f;
    }
    else {
        increaseButton.enabled = NO;
        increaseButton.alpha = 0.5f;
    }
}

@end
