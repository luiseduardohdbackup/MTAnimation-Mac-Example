//
//  MTExampleWindowController.m
//  MTAnimationMacExample
//
//  Created by Adam Kirk on 5/16/14.
//  Copyright (c) 2014 Mysterious Trousers. All rights reserved.
//

#import "MTExampleWindowController.h"
#import "MTExampleView.h"


@interface MTExampleWindowController ()
@property (weak) IBOutlet NSPopUpButton *easingFunctionPopUpButton;
@property (weak) IBOutlet MTExampleView *animationView;
@end


@implementation MTExampleWindowController

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self.easingFunctionPopUpButton.menu removeAllItems];
    for (NSDictionary *functionDict in [self functionMap]) {
        NSMenuItem *item = [[NSMenuItem alloc] initWithTitle:[[functionDict allKeys] lastObject]
                                                      action:@selector(easingFunctionWasChanged:)
                                               keyEquivalent:@""];
        item.representedObject = functionDict;
        [self.easingFunctionPopUpButton.menu addItem:item];
    }
}




#pragma mark - Action

- (IBAction)easingFunctionWasChanged:(NSMenuItem *)item
{
    NSDictionary *functionDict = [item representedObject];
    self.animationView.timingFunction = [[[functionDict allValues] lastObject] pointerValue];
}

- (IBAction)durationSliderWasSlid:(NSSlider *)sender
{
    self.animationView.duration = [sender floatValue];
}



#pragma mark - Private

- (NSArray *)functionMap
{
    static NSArray *functions;
    functions = @[
                  @{  @"EaseInQuad"         : [NSValue valueWithPointer:&MTTimingFunctionEaseInQuad       ] },
                  @{  @"EaseOutQuad"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutQuad      ] },
                  @{  @"EaseInOutQuad"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutQuad    ] },

                  @{  @"EaseInCubic"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInCubic      ] },
                  @{  @"EaseOutCubic"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutCubic     ] },
                  @{  @"EaseInOutCubic"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutCubic   ] },

                  @{  @"EaseInQuart"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInQuart      ] },
                  @{  @"EaseOutQuart"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutQuart     ] },
                  @{  @"EaseInOutQuart"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutQuart   ] },

                  @{  @"EaseInQuint"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInQuint      ] },
                  @{  @"EaseOutQuint"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutQuint     ] },
                  @{  @"EaseInOutQuint"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutQuint   ] },

                  @{  @"EaseInSine"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInSine       ] },
                  @{  @"EaseOutSine"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutSine      ] },
                  @{  @"EaseInOutSine"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutSine    ] },

                  @{  @"EaseInExpo"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInExpo       ] },
                  @{  @"EaseOutExpo"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutExpo      ] },
                  @{  @"EaseInOutExpo"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutExpo    ] },

                  @{  @"EaseInCirc"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInCirc       ] },
                  @{  @"EaseOutCirc"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutCirc      ] },
                  @{  @"EaseInOutCirc"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutCirc    ] },

                  @{  @"EaseInElastic"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInElastic    ] },
                  @{  @"EaseOutElastic"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutElastic   ] },
                  @{  @"EaseInOutElastic"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutElastic ] },

                  @{  @"EaseInBack"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInBack       ] },
                  @{  @"EaseOutBack"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutBack      ] },
                  @{  @"EaseInOutBack"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutBack    ] },

                  @{  @"EaseInBounce"     	: [NSValue valueWithPointer:&MTTimingFunctionEaseInBounce     ] },
                  @{  @"EaseOutBounce"    	: [NSValue valueWithPointer:&MTTimingFunctionEaseOutBounce    ] },
                  @{  @"EaseInOutBounce"  	: [NSValue valueWithPointer:&MTTimingFunctionEaseInOutBounce  ] }
                  
                  ];
    return functions;
}


@end
