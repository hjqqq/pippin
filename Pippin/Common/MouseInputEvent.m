//
//  MouseInputEvent.m
//  Pippin
//
//  Created by Mark Stultz on 11/11/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "MouseInputEvent.h"

@implementation MouseInputEvent

@synthesize position = _position;

- (id)initWithPosition:(GLKVector2)position;
{
	self = [super init];
	if( self != nil )
	{
		_position = position;
	}
	
	return self;
}

@end
