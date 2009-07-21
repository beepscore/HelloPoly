#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    NSLog(@"controller class decrease method");
}

- (IBAction)increase {
    NSLog(@"controller class increase method");    
}

- (void)awakeFromNib { 
    // configure your polygon here
    PolygonShape *myPolygon = [PolygonShape alloc];
    [myPolygon initWithNumberOfSides:numberOfSidesLabel.text.integerValue
              minimumNumberOfSides:3 maximumNumberOfSides:12];
    NSLog(@"My polygon: %@", myPolygon);
} 

@end
