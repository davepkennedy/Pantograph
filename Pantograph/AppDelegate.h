//
//  AppDelegate.h
//  Pantograph
//
//  Created by Dave Kennedy on 18/12/2014.
//  Copyright (c) 2014 Dave Kennedy. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PantographView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
    NSMutableArray* points;
    NSTimer* timer;
}

@property IBOutlet PantographView* view;
@property IBOutlet NSSlider* leftRadiusController;
@property IBOutlet NSSlider* rightRadiusController;
@property IBOutlet NSSlider* leftSpeedController;
@property IBOutlet NSSlider* rightSpeedController;

@property (readonly) NSArray* points;

- (IBAction)leftRadiusChanged:(id)sender;
- (IBAction)rightRadiusChanged:(id)sender;
- (IBAction)leftSpeedChanged:(id)sender;
- (IBAction)rightSpeedChanged:(id)sender;



@end

