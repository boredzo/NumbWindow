//
//  AppDelegate.m
//  NumbWindow
//
//  Created by Peter Hosey on 2011-10-19.
//  Copyright (c) 2011 Peter Hosey. All rights reserved.
//

#import "AppDelegate.h"

#import "SheetOwner.h"

@interface AppDelegate ()
@property(retain) SheetOwner *sheetOwner;
@end

@implementation AppDelegate

@synthesize window = _window;

@synthesize sheetOwner;

- (void) applicationWillFinishLaunching:(NSNotification *)notification {
	self.sheetOwner = [[[SheetOwner alloc] init] autorelease];
}
- (void) applicationWillTerminate:(NSNotification *)notification {
	self.sheetOwner = nil;
}

- (IBAction)showSheet:(id)sender {
	[self.sheetOwner showSheetOnWindow:self.window];
}

@end
