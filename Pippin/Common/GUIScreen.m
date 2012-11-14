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
	Entity *_rootEntity;
}

@end

@implementation GUIScreen

@synthesize name;

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		_rootEntity = [[Entity alloc] init];
		_rootEntity.size = GLKVector3Make( 2.0f, 2.0f, 1.0f );
		
		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			[EntityParser parse:[dict objectForKey:@"entities"] entityParsed:^(Entity *entity)
			{
				[_rootEntity addChild:entity];
			}];
		}];
	}
	
	return self;
}

- (Entity *)traceInput:(GLKVector2)position;
{
	__block Entity *hitEntity = nil;

	[Entity yieldChildren:_rootEntity childEntity:^(Entity *childEntityX)
	{
		if( CGRectContainsPoint( childEntityX.worldBounds, CGPointMake( position.x, position.y ) ) )
		{
			hitEntity = childEntityX;
			// TODO: Break
		}
	}];

	return hitEntity;
}

- (void)renderWithCamera:(Camera *)camera;
{
	[_rootEntity renderWithCamera:camera];
}

@end
