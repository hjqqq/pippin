//
//  TouchInputEvent.m
//  Pippin
//
//  Created by Mark Stultz on 11/11/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "TouchInputEvent.h"

@implementation TouchInputEvent

@synthesize position = _position;
@synthesize tapCount = _tapCount;

- (id)initWithPosition:(GLKVector2)position tapCount:(NSUInteger)tapCount;
{
	self = [super init];
	if( self != nil )
	{
		_position = position;
		_tapCount = tapCount;
	}
	
	return self;
}

@end
