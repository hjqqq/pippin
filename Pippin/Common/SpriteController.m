//
//  SpriteController.m
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "SpriteController.h"
#import "TextureController.h"
#import "Sprite.h"

@interface SpriteController ()
{
	NSMutableDictionary *_sprites;
}

- (GLKVector2)parseSize:(NSDictionary *)dict;
- (GLKVector2)parseTexMins:(NSDictionary *)dict;
- (GLKVector2)parseTexMaxs:(NSDictionary *)dict;
- (unsigned int)parseNumFrames:(NSDictionary *)dict;

@end

@implementation SpriteController

- (id)initWithContentsOfFile:(NSString *)path textureController:(TextureController *)textureController;
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
			Sprite *sprite;
			NSString *name = [spriteDict objectForKey:@"name"];
			GLKVector2 size = [self parseSize:spriteDict];
			
			NSString *texturePath = [spriteDict objectForKey:@"texture"];
			GLKTextureInfo *texture = [textureController textureNamed:texturePath];
			if( texture == nil )
			{
				// Error, no texture found
			}
			
			unsigned int numFrames = [self parseNumFrames:spriteDict];
			if( numFrames > 1 )
			{
				sprite = [[Sprite alloc] initWithName:name texture:texture size:size numFrames:numFrames];
			}
			else
			{
				GLKVector2 texMins = [self parseTexMins:spriteDict];
				GLKVector2 texMaxs = [self parseTexMaxs:spriteDict];
				sprite = [[Sprite alloc] initWithName:name texture:texture size:size texMins:texMins texMaxs:texMaxs];
			}
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
	
	NSArray *sizeArray = [dict objectForKey:@"size"];
	if( sizeArray != nil )
	{
		size.x = [[sizeArray objectAtIndex:0] floatValue];
		size.y = [[sizeArray objectAtIndex:1] floatValue];
	}
	else
	{
		NSNumber *number = nil;
		if( ( number = [dict objectForKey:@"width"] ) != nil ) { size.x = [number floatValue]; }
		if( ( number = [dict objectForKey:@"height"] ) != nil ) { size.y = [number floatValue]; }
	}
	
	return size;
}

- (GLKVector2)parseTexMins:(NSDictionary *)dict;
{
	GLKVector2 texMins = GLKVector2Make( 0.0f, 0.0f );
	
	NSArray *texMinsArray = [dict objectForKey:@"texMins"];
	if( texMinsArray != nil )
	{
		texMins.x = [[texMinsArray objectAtIndex:0] floatValue];
		texMins.y = [[texMinsArray objectAtIndex:1] floatValue];
	}
	
	return texMins;
}

- (GLKVector2)parseTexMaxs:(NSDictionary *)dict;
{
	GLKVector2 texMaxs = GLKVector2Make( 1.0f, 1.0f );
	
	NSArray *texMaxsArray = [dict objectForKey:@"texMaxs"];
	if( texMaxsArray != nil )
	{
		texMaxs.x = [[texMaxsArray objectAtIndex:0] floatValue];
		texMaxs.y = [[texMaxsArray objectAtIndex:1] floatValue];
	}

	return texMaxs;
}

- (unsigned int)parseNumFrames:(NSDictionary *)dict;
{
	int numFrames = 1;
	
	NSNumber *number = nil;
	if( ( number = [dict objectForKey:@"frames"] ) != nil ) { numFrames = [number unsignedIntValue]; }
	
	return numFrames;
}

@end
