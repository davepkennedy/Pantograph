//
//  AppDelegate.m
//  Pantograph
//
//  Created by Dave Kennedy on 18/12/2014.
//  Copyright (c) 2014 Dave Kennedy. All rights reserved.
//

#import "AppDelegate.h"
#import "math.h"

#define PI (3.141529)
#define RADIANS (180.0 / PI)
#define TO_RAD(x) (x/RADIANS)

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

@synthesize points;

float leftAngle;
float rightAngle;

- (instancetype) init {
    self = [super init];
    if (self) {
        leftAngle = rightAngle = 0;
        
        points = [[NSMutableArray alloc] init];
        timer = [NSTimer scheduledTimerWithTimeInterval:0.03
                                                 target:self
                                               selector:@selector(tick:)
                                               userInfo:nil
                                                repeats:true];
    }
    return self;
}

- (NSPoint) createPointFromController:(NSSlider*) slider
                            withAngle:(float) angle
                          withXOffset:(float) x
                          withYOffset:(float) y
{
    float hyp = [slider floatValue];
    angle = TO_RAD(angle);
    float dx = cos(angle) * hyp;
    float dy = sin(angle) * hyp;
    
    return CGPointMake(x+dx, y+dy);
}

- (NSPoint) nextPoint {
    NSPoint leftPoint = [self createPointFromController:[self leftRadiusController] withAngle:leftAngle withXOffset:100 withYOffset:100];
    NSPoint rightPoint = [self createPointFromController:[self rightRadiusController] withAngle:rightAngle withXOffset:200 withYOffset:100];
    
    float dx = (rightPoint.x - leftPoint.x) / 2.0f;
    float dy = (rightPoint.y - leftPoint.y) / 2.0f;
    
    return CGPointMake(leftPoint.x + dx, leftPoint.y + dy);
}

- (void) tick:(NSTimer*)timer {
    leftAngle += ([[self leftSpeedController] floatValue] / 10.0f);
    rightAngle += ([[self rightSpeedController] floatValue] / 10.0f);
    
    NSLog(@"Left angle: %f", leftAngle);
    
    while ([points count] > 1000) {
        [points removeObjectAtIndex:0];
    }
    [points addObject:[NSValue valueWithPoint:[self nextPoint]]];
    [self.view setNeedsDisplay:YES];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (IBAction)leftRadiusChanged:(id)sender
{
    NSLog(@"Value: %ld", [self.leftRadiusController integerValue]);
}

- (IBAction)rightRadiusChanged:(id)sender
{
    NSLog(@"Value: %ld", [self.rightRadiusController integerValue]);
}

- (IBAction)leftSpeedChanged:(id)sender
{
    NSLog(@"Value: %ld", [self.leftSpeedController integerValue]);
}

- (IBAction)rightSpeedChanged:(id)sender
{
    NSLog(@"Value: %ld", [self.rightSpeedController integerValue]);
}

@end
