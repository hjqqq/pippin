//
//  EditorWindowController.m
//  Pippin
//
//  Created by Mark Stultz on 11/15/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EditorWindowController.h"
#import "MacOpenGLView.h"
#import "OpenGLRenderer.h"
#import "Game.h"
#import "GUIController.h"
#import "GUIScreen.h"
#import "Entity.h"

@implementation EditorWindowController

@synthesize game;

- (void)windowDidLoad;
{
	CGSize size = self.glView.frame.size;
	self.game = [[Game alloc] initWithViewportSize:GLKVector2Make( size.width, size.height )];
	self.glView.renderer.game = self.game;
	
	[self.sourceList reloadData];
}

#pragma mark NSWindowDelegate

- (void)windowDidResize:(NSNotification *)notification;
{
	
}

#pragma mark NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;
{
	GUIScreen *screen = [GUIController sharedController].screen;
	if( screen == nil )
	{
		return 0;
	}
	
	return [screen.rootEntity.children count];
}

- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;
{
	return @"hi";
}

@end
