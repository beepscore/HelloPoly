#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface Controller : NSObject {
    // Controller references to View
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;

    // Controller reference to Model
    IBOutlet PolygonShape *myPolygonShape;
}

- (void)awakeFromNib;
// override default dealloc method
- (void)dealloc;
- (IBAction)decrease;
- (IBAction)increase;
- (void)updateInterface;

@end
