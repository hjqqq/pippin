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

static SpriteController *_sharedController;

@interface SpriteController ()
{
	NSMutableDictionary *_sprites;
}

@end

@implementation SpriteController

+ (SpriteController *)sharedController
{
	return _sharedController;
}

+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;
{
	_sharedController = [[SpriteController alloc] initWithContentsOfFile:path];
	return _sharedController;
}

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		_sprites = [[NSMutableDictionary alloc] init];

		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			NSArray *spritesArray = [dict objectForKey:@"sprites"];
			if( spritesArray == nil )
			{
				// Error, expecting a dictionary with the key "sprites"
			}

			NSLog( @"SpriteController: Loading %d sprites...\n", (int)[spritesArray count] );
			for( id spriteDict in spritesArray )
			{
				Sprite *sprite;
				NSString *name = [spriteDict objectForKey:@"name"];
				GLKVector2 size = [Parser parseVec2Size:spriteDict];
				
				NSString *texturePath = [spriteDict objectForKey:@"texture"];
				GLKTextureInfo *texture = [[TextureController sharedController] textureNamed:texturePath];
				if( texture == nil )
				{
					// Error, no texture found
				}
				
				unsigned int numFrames = [Parser parseNumFrames:spriteDict];
				if( numFrames > 1 )
				{
					sprite = [[Sprite alloc] initWithName:name texture:texture size:size numFrames:numFrames];
				}
				else
				{
					GLKVector2 texMins = [Parser parseTexMins:spriteDict];
					GLKVector2 texMaxs = [Parser parseTexMaxs:spriteDict];
					sprite = [[Sprite alloc] initWithName:name texture:texture size:size texMins:texMins texMaxs:texMaxs];
				}
				[_sprites setObject:sprite forKey:sprite.name];

				NSLog( @"...%@\n", sprite.name );
			}
		}];
	}
	
	return self;
}

- (Sprite *)spriteNamed:(NSString *)name;
{
	return [_sprites objectForKey:name];
}

@end
