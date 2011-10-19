//
//  SheetOwner.m
//  NumbWindow
//
//  Created by Peter Hosey on 2011-10-19.
//  Copyright (c) 2011 Peter Hosey. All rights reserved.
//

#import "SheetOwner.h"

@interface SheetOwner ()
- (void) sheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo;
@end

@implementation SheetOwner

@synthesize sheetPanel;

- (id) init {
	if ((self = [super init])) {
		[NSBundle loadNibNamed:@"Sheet" owner:self];
	}
	return self;
}
- (void) dealloc {
	[NSApp endSheet:sheetPanel];
	[sheetPanel release];
	[super dealloc];
}

- (void) showSheetOnWindow:(NSWindow *)window {
	[NSApp beginSheet:self.sheetPanel
	   modalForWindow:window
		modalDelegate:self
	   didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:)
		  contextInfo:NULL];
}

- (void) sheetDidEnd:(NSWindow *)sheet returnCode:(NSInteger)returnCode contextInfo:(void *)contextInfo {
	[sheet close];
}

- (IBAction) ok:(id)sender {
	[NSApp endSheet:self.sheetPanel returnCode:NSOKButton];
}
- (IBAction) cancel:(id)sender {
	[NSApp endSheet:self.sheetPanel returnCode:NSCancelButton];
}

@end
