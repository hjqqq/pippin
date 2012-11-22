//
//  AppDelegate.m
//  Pippin Mac
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "AppDelegate.h"
#import "EditorWindow.h"

@implementation AppDelegate

@synthesize editorWindow;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.editorWindow = [[EditorWindow alloc] initWithWindowNibName:@"EditorWindow"];
	[self.editorWindow showWindow:self];
}

@end
