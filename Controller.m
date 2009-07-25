#import "Controller.h"

@implementation Controller
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

- (void)awakeFromNib { 
    [myPolygonShape initWithNumberOfSides:5 
                      minimumNumberOfSides:3 maximumNumberOfSides:12];
    [self updateInterface];
}

- (void)updateInterface { 
    numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", myPolygonShape.numberOfSides];
    NSLog([myPolygonShape description]);
    
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
