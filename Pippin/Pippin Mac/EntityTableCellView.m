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

- (void)controlTextDidEndEditing:(NSNotification *)obj;
{
	id control = [obj object];
	if( control == self.nameTextField )
	{
		self.entity.name = self.nameTextField.stringValue;
	}
	else if( control == self.xPositionTextField )
	{
		GLKVector3 pos = self.entity.position;
		pos.x = [control floatValue];
		self.entity.position = pos;
	}
	else if( control == self.yPositionTextField )
	{
		GLKVector3 pos = self.entity.position;
		pos.y = [control floatValue];
		self.entity.position = pos;
	}
	else if( control == self.xSizeTextField )
	{
		GLKVector3 size = self.entity.size;
		size.x = [control floatValue];
		self.entity.size = size;
	}
	else if( control == self.ySizeTextField )
	{
		GLKVector3 size = self.entity.size;
		size.y = [control floatValue];
		self.entity.size = size;
	}
}

@end
