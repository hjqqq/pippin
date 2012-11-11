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
#import "Parser.h"

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
	
		NSString *bundlePath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
		NSData *fileData = [NSData dataWithContentsOfFile:bundlePath];
		NSError *error = nil;
		
		id jsonData = [NSJSONSerialization JSONObjectWithData:fileData options:0 error:&error];
		if( ![jsonData respondsToSelector:@selector(objectForKey:)] )
		{
			// Error, expecting a dictionary with the key "entities"
		}
		
		NSArray *entitiesArray = [jsonData objectForKey:@"entities"];
		if( entitiesArray == nil )
		{
			// Error, expecting a dictionary with the key "entities"
		}
		
		NSLog( @"EntityController: Loading %d entities...\n", (int)[entitiesArray count] );
		for( id entityDict in entitiesArray )
		{
			NSString *type = [entityDict objectForKey:@"type"];
			if( type == nil )
			{
				// Error, require a type
			}
			
			Class entityClass = NSClassFromString( type );
			Entity *entity = [[entityClass alloc] initWithDictionary:entityDict];
			[_entities setObject:entity forKey:entity.name];
			
			NSLog( @"...%@\n", entity.name );
		}
	}
	
	return self;
}

- (Entity *)entityNamed:(NSString *)name;
{
	return [_entities objectForKey:name];
}

@end
