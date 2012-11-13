//
//  GUIScreen.m
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "GUIScreen.h"

@implementation GUIScreen

@synthesize name;

- (id)initWithDictionary:(NSDictionary *)dictionary;
{
	self = [super init];
	if( self != nil )
	{
		self.name = [dictionary objectForKey:@"name"];
	}
	
	return self;
}

@end
