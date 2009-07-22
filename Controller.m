#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    NSLog(@"Controller decrease method"); 
}

- (IBAction)increase {
    NSLog(@"Controller increase method");     
}

- (void)awakeFromNib { 
    // configure your polygon here
    [myPolygonOutlet initWithNumberOfSides: numberOfSidesLabel.text.integerValue 
                      minimumNumberOfSides:3 maximumNumberOfSides:12];
    NSLog(@"My polygon: %@", myPolygonOutlet);
} 

@end
