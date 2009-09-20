//
//  SheetBlocksAppDelegate.m
//  SheetBlocks
//
//  Created by Brian Webster on 10/19/09.
//  Copyright 2009 Fat Cat Software. All rights reserved.
//

#import "SheetBlocksAppDelegate.h"
#import "NSApplication+SheetBlocks.h"

@implementation SheetBlocksAppDelegate

@synthesize window, numOK, numCancel;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	// Insert code here to initialize your application 
}

- (IBAction)startSheet:(id)sender
{
	[NSApp sb_beginSheet:sheet modalForWindow:window completionHandler:^(NSInteger returnCode) {
		[sheet orderOut:nil];
		if (returnCode == NSOKButton)
			self.numOK = self.numOK + 1;
		else
			self.numCancel = self.numCancel + 1;
	}];
}

- (IBAction)acceptSheet:(id)sender
{
	[NSApp endSheet:sheet returnCode:NSOKButton];
}

- (IBAction)cancelSheet:(id)sender
{
	[NSApp endSheet:sheet returnCode:NSCancelButton];
}

@end
