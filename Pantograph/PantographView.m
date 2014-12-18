//
//  PantographView.m
//  Pantograph
//
//  Created by Dave Kennedy on 18/12/2014.
//  Copyright (c) 2014 Dave Kennedy. All rights reserved.
//

#import "PantographView.h"
#import "AppDelegate.h"

@implementation PantographView

- (AppDelegate*) appDelegate {
    return (AppDelegate*)[self delegate];
}

- (BOOL) isFlipped {
    return YES;
}

- (void) drawCircle: (NSPoint) center {
    float radius = 1.5;
    [[NSBezierPath bezierPathWithOvalInRect:CGRectMake(
                                                       center.x - (radius/2),
                                                       center.y - (radius/2),
                                                       radius,
                                                       radius)] fill];
}

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    for (NSValue* value in [[self appDelegate] points]) {
        [self drawCircle:[value pointValue]];
    }
}

@end
