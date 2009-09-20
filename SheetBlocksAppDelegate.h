//
//  SheetBlocksAppDelegate.h
//  SheetBlocks
//
//  Created by Brian Webster on 10/19/09.
//  Copyright 2009 Fat Cat Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface SheetBlocksAppDelegate : NSObject <NSApplicationDelegate> 
{
    IBOutlet NSWindow *window;
	IBOutlet NSWindow *sheet;
	
	NSInteger numOK;
	NSInteger numCancel;
}

@property (assign) IBOutlet NSWindow *window;
@property (assign) NSInteger numOK;
@property (assign) NSInteger numCancel;

- (IBAction)startSheet:(id)sender;
- (IBAction)acceptSheet:(id)sender;
- (IBAction)cancelSheet:(id)sender;

@end
