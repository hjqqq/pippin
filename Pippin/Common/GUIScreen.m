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

@implementation GUIScreen

@synthesize name;
@synthesize rootEntity;

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		self.rootEntity = [[Entity alloc] init];
		self.rootEntity.size = GLKVector3Make( 2.0f, 2.0f, 1.0f );
		
		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			[EntityParser parse:[dict objectForKey:@"entities"] entityParsed:^(Entity *entity)
			{
				[self.rootEntity addChild:entity];
			}];
		}];
	}
	
	return self;
}

- (Entity *)traceInput:(GLKVector2)position;
{
	__block Entity *hitEntity = nil;

	[Entity yieldChildren:self.rootEntity childEntity:^(Entity *childEntityX)
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
	[self.rootEntity renderWithCamera:camera];
}

@end
