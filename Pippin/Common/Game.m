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

- (id)initWithViewportSize:(GLKVector2)size;
{
	self = [super init];
	if( self != nil )
	{
		Color bgColor = ColorMake( 0.0f, 0.0f, 0.0f, 1.0f );
		_scene = [[Scene alloc] initWithViewportSize:size backgroundColor:bgColor];
		
		Sprite *sprite = [[Sprite alloc] init];
		sprite.position = GLKVector3Make( 0.0f, 0.0f, 0.0f );
		sprite.size = GLKVector3Make( 800.0f, 600.0f, 1.0f );
		[sprite setTexCoordsMin:GLKVector2Make( 0.0f, 0.0f ) max:GLKVector2Make( 50.0f, 37.5f )];
		[_scene addSprite:sprite];
	}
	
	return self;
}

- (void)draw;
{
	[_scene beginFrame];
	[_scene draw];
}

- (void)viewportSizeChanged:(GLKVector2)size;
{
	[_scene viewportSizeChanged:size];
}

@end
