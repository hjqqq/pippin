//
//  Scene.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Scene.h"
#import "Camera.h"
#import "Sprite.h"

@implementation Scene

@synthesize bgColor;

- (id)initWithViewportSize:(GLKVector2)size backgroundColor:(Color)backgroundColor;
{
	self = [super init];
	if( self != nil )
	{
		_camera = [[Camera alloc] initWithViewportWidth:size.x height:size.y];
		_sprites = [[NSMutableArray alloc] init];
		self.bgColor = backgroundColor;
	}
	
	return self;
}

- (void)viewportSizeChanged:(GLKVector2)size;
{
	_camera.size = size;
}

- (void)beginFrame;
{
	glClearColor( self.bgColor.r, self.bgColor.g, self.bgColor.b, self.bgColor.a );
	glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
}

- (void)draw;
{
	for( Sprite *sprite in _sprites )
	{
		[sprite drawWithProjectionMatrix:_camera.projectionMatrix];
	}
}

- (void)addSprite:(Sprite *)sprite;
{
	[_sprites addObject:sprite];
}

@end
