#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class PolygonShape;
@class PolygonView;

@interface Controller : NSObject {
    // Controller references to View
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;
    IBOutlet UISlider *numberOfSidesSlider;
    
    // Controller reference to part of View
    IBOutlet PolygonView *myPolygonView;

    // Controller reference to Model
    IBOutlet PolygonShape *myPolygonShape;
}

- (IBAction)decrease;
- (IBAction)increase;
- (IBAction)sliderAction;
- (void)updateInterface;

// TODO should I delete these from header, only visible from inside .m?
// override default dealloc method
//- (void)dealloc;
//- (void)awakeFromNib;

@end
