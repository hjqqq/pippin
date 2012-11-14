//
//  GUIScreen.m
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "GUIScreen.h"
#import "Camera.h"
#import "Entity.h"

@interface GUIScreen ()
{
	NSMutableArray *_entities;
}

@end

@implementation GUIScreen

@synthesize name;

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		_entities = [[NSMutableArray alloc] init];
	
		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			[EntityParser parse:[dict objectForKey:@"entities"] entityParsed:^(Entity *entity)
			{
				[_entities addObject:entity];
			}];
		}];
	}
	
	return self;
}

- (void)renderWithCamera:(Camera *)camera;
{
	for( Entity *entity in _entities )
	{
		[entity renderWithCamera:camera];
	}
}

@end
