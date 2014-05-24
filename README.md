MTAnimation Mac Example
=======================

An example of MTAnimation at work in AppKit.

```objc
- (void)mouseUp:(NSEvent *)theEvent
{
    [NSView mt_animateWithViews:[self.window.contentView mt_allSubviews]
                       duration:self.duration
                 timingFunction:self.timingFunction
                        options:MTViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         NSPoint locationInView = [self convertPoint:theEvent.locationInWindow fromView:nil];
                         NSRect frame = self.logoImageView.frame;
                         frame.origin.x = ceil(locationInView.x - (frame.size.width / 2.0));
                         frame.origin.y = ceil(locationInView.y - (frame.size.height / 2.0));
                         self.logoImageView.frame = frame;
                     } completion:nil];
}
```
