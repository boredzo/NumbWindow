//
//  SheetOwner.h
//  NumbWindow
//
//  Created by Peter Hosey on 2011-10-19.
//  Copyright (c) 2011 Peter Hosey. All rights reserved.
//

@interface SheetOwner : NSObject

@property(retain) IBOutlet NSPanel *sheetPanel;

- (void) showSheetOnWindow:(NSWindow *)window;

@end
