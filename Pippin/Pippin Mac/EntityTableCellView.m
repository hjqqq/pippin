//
//  EntityTableCellView.m
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EntityTableCellView.h"
#import "Entity.h"

@implementation EntityTableCellView

@synthesize entity = _entity;

- (void)setEntity:(Entity *)entity
{
	if( entity != _entity )
	{
		_entity = entity;
		self.nameTextField.stringValue = _entity.name;
		self.xPositionTextField.stringValue = [[NSNumber numberWithFloat:entity.position.x] stringValue];
		self.yPositionTextField.stringValue = [[NSNumber numberWithFloat:entity.position.y] stringValue];
		self.xSizeTextField.stringValue = [[NSNumber numberWithFloat:entity.size.x] stringValue];
		self.ySizeTextField.stringValue = [[NSNumber numberWithFloat:entity.size.y] stringValue];
	}
}

#pragma mark NSTextFieldDelegate

- (BOOL)control:(NSControl *)control textShouldEndEditing:(NSText *)fieldEditor;
{
	return NO;
}

@end
