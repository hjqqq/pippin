//
//  EditorSourceView.m
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EditorSourceView.h"

#import "GUIController.h"
#import "GUIScreen.h"
#import "Entity.h"

@implementation EditorSourceView

- (IBAction)addEntity:(id)sender;
{
	GUIScreen *screen = [GUIController sharedController].screen;
	if( screen != nil )
	{
		Entity *entity = [[Entity alloc] init];
		entity.name = @"Untitled Entity";
		[screen.rootEntity addChild:entity];
		[self reloadData];
	}
}

- (void)reloadData;
{
	[self.sourceList reloadData];
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
	GUIScreen *screen = [GUIController sharedController].screen;
	if( screen == nil )
	{
		return 0;
	}

	Entity *entity = [screen.rootEntity.children objectAtIndex:row];
	return entity.name;
}

#pragma mark NSTableViewDelegate

- (void)tableViewSelectionDidChange:(NSNotification *)notification;
{
	Entity *selectedEntity = nil;

	GUIScreen *screen = [GUIController sharedController].screen;
	if( screen != nil )
	{
		selectedEntity = [screen.rootEntity.children objectAtIndex:[self.sourceList selectedRow]];
	}

	if( self.delegate != nil )
	{
		[self.delegate entityWasSelected:selectedEntity];
	}
}

@end
