//
//  MeshRenderer.m
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "MeshRenderer.h"
#import "VertexArrayObject.h"
#import "VertexBuffer.h"
#import "IndexBuffer.h"
#import "Camera.h"
#import "Sprite.h"

@implementation MeshRenderer

@synthesize vertexArrayObject;
@synthesize vertexBuffer;
@synthesize indexBuffer;

GLfloat gVertexData[ 20 ] =
{
	0.0f, 0.0f, 0.0f,		0.0f, 1.0f,
	1.0f, 0.0f, 0.0f,		1.0f, 1.0f,
	0.0f, 1.0f, 0.0f,		0.0f, 0.0f,
	1.0f, 1.0f, 0.0f,		1.0f, 0.0f
};

unsigned short gIndexData[ 4 ] =
{
	0, 1, 2, 3
};

- (id)init;
{
	self = [super init];
	if( self != nil )
	{
		_effect = [[GLKBaseEffect alloc] init];
		memcpy( _vertexData, gVertexData, sizeof( gVertexData ) );
		self.vertexArrayObject = [[VertexArrayObject alloc] init];
		self.vertexBuffer = [[VertexBuffer alloc] initWithData:gVertexData size:sizeof( gVertexData )];
		self.indexBuffer = [[IndexBuffer alloc] initWithData:gIndexData size:sizeof( gIndexData )];
	}
	
	return self;
}

- (void)setTexCoordsMin:(GLKVector2)min max:(GLKVector2)max;
{
	_vertexData[ 3 ] = min.x;
	_vertexData[ 13 ] = min.x;
	_vertexData[ 14 ] = min.y;
	_vertexData[ 19 ] = min.y;
	
	_vertexData[ 8 ] = max.x;
	_vertexData[ 18 ] = max.x;
	_vertexData[ 4 ] = max.y;
	_vertexData[ 9 ] = max.y;
	
	[self.vertexBuffer update:_vertexData size:sizeof( _vertexData )];
}

- (void)renderWithCamera:(Camera *)camera modelViewMatrix:(GLKMatrix4)modelViewMatrix sprite:(Sprite *)sprite;
{
	[self.vertexArrayObject bind];

	_effect.texture2d0.name = sprite.texture.name;
	_effect.texture2d0.enabled = YES;
	_effect.transform.modelviewMatrix = modelViewMatrix;
	_effect.transform.projectionMatrix = camera.projectionMatrix;
	[_effect prepareToDraw];
	
	glEnable( GL_TEXTURE_2D );
	glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT );
	glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT );
			glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);

	glDrawElements( GL_TRIANGLE_STRIP, 4, GL_UNSIGNED_SHORT, 0 );

	[self.vertexArrayObject unbind];
}

@end
