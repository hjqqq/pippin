//
//  SpriteController.m
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "SpriteController.h"
#import "Sprite.h"

@interface SpriteController ()
{
	NSMutableDictionary *_sprites;
}

- (GLKVector2)parseSize:(NSDictionary *)dict;
- (unsigned int)parseNumFrames:(NSDictionary *)dict;

@end

@implementation SpriteController

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		_sprites = [[NSMutableDictionary alloc] init];
	
		NSString *bundlePath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
		NSData *fileData = [NSData dataWithContentsOfFile:bundlePath];
		NSError *error = nil;
		
		id jsonData = [NSJSONSerialization JSONObjectWithData:fileData options:0 error:&error];
		if( ![jsonData respondsToSelector:@selector(objectForKey:)] )
		{
			// Error, expecting a dictionary with the key "sprites"
		}
		
		NSArray *spritesArray = [jsonData objectForKey:@"sprites"];
		if( spritesArray == nil )
		{
			// Error, expecting a dictionary with the key "sprites"
		}
		
		NSLog( @"SpriteController: Loading %du sprites...\n", [spritesArray count] );
		for( id spriteDict in spritesArray )
		{
			NSString *name = [spriteDict objectForKey:@"name"];
			NSString *texturePath = [spriteDict objectForKey:@"texture"];
			GLKVector2 size = [self parseSize:spriteDict];
			unsigned int numFrames = [self parseNumFrames:spriteDict];
		
			Sprite *sprite = [[Sprite alloc] initWithName:name texturePath:texturePath size:size numFrames:numFrames];
			[_sprites setObject:sprite forKey:sprite.name];
			
			NSLog( @"...%@\n", sprite.name );
		}
	}
	
	return self;
}

- (Sprite *)spriteNamed:(NSString *)name;
{
	return [_sprites objectForKey:name];
}

- (GLKVector2)parseSize:(NSDictionary *)dict;
{
	GLKVector2 size = GLKVector2Make( 0.0f, 0.0f );
	
	NSNumber *number = nil;
	if( ( number = [dict objectForKey:@"width"] ) != nil ) { size.x = [number floatValue]; }
	if( ( number = [dict objectForKey:@"height"] ) != nil ) { size.y = [number floatValue]; }
	
	return size;
}

- (unsigned int)parseNumFrames:(NSDictionary *)dict;
{
	int numFrames = 1;
	
	NSNumber *number = nil;
	if( ( number = [dict objectForKey:@"frames"] ) != nil ) { numFrames = [number unsignedIntValue]; }
	
	return numFrames;
}

@end
