//
//  Game.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Game.h"
#import "Scene.h"
#import "Sprite.h"

@implementation Game

- (id)init;
{
	self = [super init];
	if( self != nil )
	{
		_scene = [[Scene alloc] initWithBackgroundColor:ColorMake( ( 31.0f / 255.0f ), ( 31.0f / 255.0f ), ( 43.0f / 255.0f ), 1.0f )];
		
		Sprite *sprite = [[Sprite alloc] init];
		sprite.position = GLKVector3Make( 100.0f, 100.0f, 0.0f );
		sprite.size = GLKVector3Make( 100.0f, 100.0f, 1.0f );
		[_scene addSprite:sprite];
	}
	
	return self;
}

- (void)draw;
{
	[_scene beginFrame];
	[_scene draw];
}

@end
