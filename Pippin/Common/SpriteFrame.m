//
//  SpriteFrame.m
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "SpriteFrame.h"

@implementation SpriteFrame

@synthesize texMins;
@synthesize texMaxs;

- (id)initWithTexMins:(GLKVector2)aTexMins texMaxs:(GLKVector2)aTexMaxs;
{
	self = [super init];
	if( self != nil )
	{
		self.texMins = aTexMins;
		self.texMaxs = aTexMaxs;
	}
	
	return self;
}

@end
