//
//  EntityController.m
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EntityController.h"
#import "SpriteController.h"
#import "Sprite.h"
#import "Entity.h"
#import "EntityParser.h"

static EntityController *_sharedController;

@interface EntityController ()
{
	NSMutableDictionary *_entities;
}

@end

@implementation EntityController

+ (EntityController *)sharedController
{
	return _sharedController;
}

+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;
{
	_sharedController = [[EntityController alloc] initWithContentsOfFile:path];
	return _sharedController;
}

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		_entities = [[NSMutableDictionary alloc] init];
		
		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			[EntityParser parse:[dict objectForKey:@"entities"] entityParsed:^(Entity *entity)
			{
				[_entities setObject:entity forKey:entity.name];
			}];
		}];
	}
	
	return self;
}

- (Entity *)entityNamed:(NSString *)name;
{
	return [_entities objectForKey:name];
}

@end
