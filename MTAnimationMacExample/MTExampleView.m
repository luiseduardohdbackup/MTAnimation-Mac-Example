//
//  MTExampleView.m
//  MTAnimationMacExample
//
//  Created by Adam Kirk on 5/16/14.
//  Copyright (c) 2014 Mysterious Trousers. All rights reserved.
//

#import "MTExampleView.h"


@interface MTExampleView ()
@property (weak) IBOutlet NSImageView *logoImageView;
@end


@implementation MTExampleView

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setWantsLayer:YES];
    self.duration = 0.25;
    self.timingFunction = kMTEaseOutBack;
}

- (void)mouseUp:(NSEvent *)theEvent
{
    [NSView mt_animateWithDuration:self.duration
                    timingFunction:self.timingFunction
                        animations:^{
                            NSPoint locationInView = [self convertPoint:theEvent.locationInWindow fromView:nil];
                            NSRect frame = self.logoImageView.frame;
                            frame.origin.x = ceil(locationInView.x - (frame.size.width / 2.0));
                            frame.origin.y = ceil(locationInView.y - (frame.size.height / 2.0));
                            self.logoImageView.frame = frame;
                        } completion:nil];
}

@end
