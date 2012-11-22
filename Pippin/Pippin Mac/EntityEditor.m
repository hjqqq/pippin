//
//  EntityEditor.m
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EntityEditor.h"
#import "EntityTableCellView.h"
#import "Entity.h"

@implementation EntityEditor

@synthesize entity = _entity;

- (void)setEntity:(Entity *)entity;
{
	if( entity != _entity )
	{
		_entity = entity;
		[self.tableView reloadData];
	}
}

#pragma mark NSTableViewDataSource

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView;
{
	return ( self.entity != nil ) ? 1 :  0;
}

#pragma NSTableViewDelegate

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row;
{
	EntityTableCellView *cell = [tableView makeViewWithIdentifier:@"EntityTableCellView" owner:self];
 
 	// There is no existing cell to reuse so we will create a new one
	if( cell == nil )
	{
		NSArray *topLevelObjects = nil;
		[[NSBundle mainBundle] loadNibNamed:@"EntityTableCellView" owner:self topLevelObjects:&topLevelObjects];
		cell = (EntityTableCellView *)[topLevelObjects objectAtIndex:0];
		cell.identifier = @"EntityTableCellView";
		cell.entity = self.entity;
	}
	
	return cell;
}

// We make the "group rows" have the standard height, while all other image rows have a larger height
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row;
{
	return 89.0f;
}

@end
