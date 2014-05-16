//
//  MTExampleView.h
//  MTAnimationMacExample
//
//  Created by Adam Kirk on 5/16/14.
//  Copyright (c) 2014 Mysterious Trousers. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <UIView+MTAnimation.h>

@interface MTExampleView : NSView
@property (assign) NSTimeInterval   duration;
@property (assign) MTTimingFunction timingFunction;
@end
