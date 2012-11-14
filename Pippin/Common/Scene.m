//
//  Scene.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Scene.h"
#import "Camera.h"
#import "Entity.h"

@implementation Scene

@synthesize bgColor;

- (id)initWithViewportSize:(GLKVector2)size backgroundColor:(Color)backgroundColor;
{
	self = [super init];
	if( self != nil )
	{
		_camera = [[Camera alloc] initWithViewportWidth:size.x height:size.y];
		_camera.scale = GLKVector3Make( 2.0f, 2.0f, 1.0f );
		_entities = [[NSMutableArray alloc] init];
		self.bgColor = backgroundColor;
	}
	
	return self;
}

- (NSArray *)entities;
{
	return _entities;
}

- (void)viewportSizeChanged:(GLKVector2)size;
{
	_camera.size = size;
}

- (void)render;
{
	glClearColor( self.bgColor.r, self.bgColor.g, self.bgColor.b, self.bgColor.a );
	glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );

	for( Entity *entity in _entities )
	{
		[entity renderWithCamera:_camera];
	}
}

- (void)addEntity:(Entity *)entity;
{
	[_entities addObject:entity];
}

@end
