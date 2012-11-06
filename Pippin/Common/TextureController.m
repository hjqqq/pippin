//
//  TextureController.m
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "TextureController.h"

static TextureController *_sharedController;

@interface TextureController ()
{
	NSMutableDictionary *_textures;
}

@end

@implementation TextureController

+ (TextureController *)sharedController;
{
	if( _sharedController == nil )
	{
		_sharedController = [[TextureController alloc] init];
	}
	
	return _sharedController;
}

- (id)init;
{
	self = [super init];
	if( self != nil )
	{
		_textures = [[NSMutableDictionary alloc] init];
	}
	
	return self;
}

- (GLKTextureInfo *)textureNamed:(NSString *)name;
{
	GLKTextureInfo *texture = [_textures objectForKey:name];
	if( texture == nil )
	{
		NSError *error;
		NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
		texture = [GLKTextureLoader textureWithContentsOfFile:path options:nil error:&error];
		[_textures setObject:texture forKey:name];
	}

	return texture;
}

@end
