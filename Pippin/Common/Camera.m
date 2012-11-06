//
//  Camera.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Camera.h"

@implementation Camera

@synthesize projectionMatrix;
@synthesize size = _size;
@synthesize scale = _scale;

- (id)initWithViewportWidth:(float)width height:(float)height;
{
	self = [super init];
	if( self != nil )
	{
		_size = GLKVector2Make( width, height );
		_scale = GLKVector3Make( 1.0f, 1.0f, 1.0f );
		_projectionMatrix = GLKMatrix4MakeOrtho( 0.0f, _size.x, 0.0f, _size.y, 1.0f, -1.0f );
	}
	
	return self;
}

- (GLKMatrix4)projectionMatrix;
{
	return _projectionMatrix;
}

- (void)setSize:(GLKVector2)aSize;
{
	if( !GLKVector2AllEqualToVector2( _size, aSize ) )
	{
		_size = aSize;
		_projectionMatrix = GLKMatrix4MakeOrtho( 0.0f, _size.x, 0.0f, _size.y, 1.0f, -1.0f );
		_projectionMatrix = GLKMatrix4ScaleWithVector3( _projectionMatrix, _scale );
	}
}

- (void)setScale:(GLKVector3)aScale;
{
	if( !GLKVector3AllEqualToVector3( _scale, aScale ) )
	{
		_scale = aScale;
		_projectionMatrix = GLKMatrix4ScaleWithVector3( _projectionMatrix, _scale );
	}
}

@end
