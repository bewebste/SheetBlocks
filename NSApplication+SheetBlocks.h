//
//  NSApplication-BWAppKit.h
//  UberProject
//
//  Created by Brian Webster on 10/13/09.
//  Copyright 2009 Fat Cat Software. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface NSApplication(SheetBlocks)

- (void)sb_beginSheet:(NSWindow*)sheet modalForWindow:(NSWindow*)modalWindow completionHandler:(void (^)(NSInteger returnCode))handler;


@end
