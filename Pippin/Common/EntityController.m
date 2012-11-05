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

@interface EntityController ()
{
	NSMutableDictionary *_entities;
}

- (GLKVector3)parsePosition:(NSDictionary *)dict;
- (GLKVector3)parseSize:(NSDictionary *)dict;

@end

@implementation EntityController

- (id)initWithContentsOfFile:(NSString *)path spriteController:(SpriteController *)spriteController;
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
		
		NSLog( @"EntityController: Loading %du entities...\n", [entitiesArray count] );
		for( id entityDict in entitiesArray )
		{
			NSString *spriteName = [entityDict objectForKey:@"sprite"];
			Sprite *sprite = [spriteController spriteNamed:spriteName];
			if( sprite == nil )
			{
				// Error, expecting sprite
				continue;
			}
		
			NSString *name = [entityDict objectForKey:@"name"];
			GLKVector3 position = [self parsePosition:entityDict];
			GLKVector3 size = [self parsePosition:entityDict];
			
			Entity *entity = [[Entity alloc] initWithName:name sprite:sprite position:position size:size];
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

- (GLKVector3)parsePosition:(NSDictionary *)dict;
{
	GLKVector3 position = GLKVector3Make( 0.0f, 0.0f, 0.0f );
	
	NSNumber *number = nil;
	if( ( number = [dict objectForKey:@"x"] ) != nil ) { position.x = [number floatValue]; }
	if( ( number = [dict objectForKey:@"y"] ) != nil ) { position.y = [number floatValue]; }
	if( ( number = [dict objectForKey:@"z"] ) != nil ) { position.z = [number floatValue]; }
	
	return position;
}

- (GLKVector3)parseSize:(NSDictionary *)dict;
{
	GLKVector3 size = GLKVector3Make( 0.0f, 0.0f, 1.0f );
	
	NSNumber *number = nil;
	if( ( number = [dict objectForKey:@"width"] ) != nil ) { size.x = [number floatValue]; }
	if( ( number = [dict objectForKey:@"height"] ) != nil ) { size.y = [number floatValue]; }
	
	return size;
}

@end
