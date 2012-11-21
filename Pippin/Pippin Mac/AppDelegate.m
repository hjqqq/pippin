//
//  AppDelegate.m
//  Pippin Mac
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "AppDelegate.h"
#import "EditorWindowController.h"

@implementation AppDelegate

@synthesize editorWindowController;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	self.editorWindowController = [[EditorWindowController alloc] initWithWindowNibName:@"EditorWindow"];
	[self.editorWindowController showWindow:self];
}

@end
