//
//  NSApplication-BWAppKit.m
//  UberProject
//
//  Created by Brian Webster on 10/13/09.
//  Copyright 2009 Fat Cat Software. All rights reserved.
//

#import "NSApplication+SheetBlocks.h"


@implementation NSApplication(SheetBlocks)

- (void)sb_beginSheet:(NSWindow*)sheet modalForWindow:(NSWindow*)modalWindow completionHandler:(void (^)(NSInteger returnCode))handler
{
	//The handler that's passed in may very well be a stack based block literal.  Since we're
	//hanging on to it beyond the scope of this method call, we make a copy of it.
	//Additionally, if we're running under garbage collection, passing the block into a void*
	//parameter will not alert the collector, so we CFRetain it to make sure it doesn't get
	//collected prematurely.
	[self beginSheet:sheet modalForWindow:modalWindow modalDelegate:self didEndSelector:@selector(sb_sheetDidEnd:returnCode:contextInfo:) contextInfo:(void*)CFRetain([handler copy])];
}

- (void)sb_sheetDidEnd:(NSWindow*)sheet returnCode:(int)returnCode contextInfo:(void*)contextInfo
{
	void (^handler)(NSInteger returnCode) = (void (^)(NSInteger returnCode))contextInfo;
	
	handler(returnCode);
	CFRelease(handler); //balance the CFRetain from above
	[handler release]; //balance the copy from above
	[sheet orderOut:nil];
}

@end
