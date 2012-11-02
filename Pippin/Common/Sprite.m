//
//  Sprite.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Sprite.h"
#import "VertexArrayObject.h"
#import "VertexBuffer.h"
#import "IndexBuffer.h"

@implementation Sprite

@synthesize vertexArrayObject;
@synthesize vertexBuffer;
@synthesize indexBuffer;
@synthesize position = _position;
@synthesize size = _size;
@synthesize transform;

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
		self.position = GLKVector3Make( 0.0f, 0.0f, 0.0f );
		self.size = GLKVector3Make( 0.0f, 0.0f, 0.0f );
		self.transform = GLKMatrix4Identity;
		
		NSError *error;
		NSString *path = [[NSBundle mainBundle] pathForResource:@"data/textures/grid_background.png" ofType:nil];
		self.texture = [GLKTextureLoader textureWithContentsOfFile:path options:nil error:&error];
	}
	
	return self;
}

- (void)setPosition:(GLKVector3)position_;
{
	if( !GLKVector3AllEqualToVector3( _position, position_ ) )
	{
		_position = position_;
		
		self.transform = GLKMatrix4MakeTranslation( _position.x, _position.y, _position.z );
	}
}

- (void)setSize:(GLKVector3)size_;
{
	if( !GLKVector3AllEqualToVector3( _size, size_ ) )
	{
		_size = size_;
		
		_vertexData[ 5 ] = size_.x;
		_vertexData[ 11 ] = size_.y;
		_vertexData[ 15 ] = size_.x;
		_vertexData[ 16 ] = size_.y;

		[self.vertexBuffer update:_vertexData size:sizeof( _vertexData )];
	}
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

- (void)drawWithProjectionMatrix:(const GLKMatrix4*)projectionMatrix;
{
	[self.vertexArrayObject bind];

	_effect.texture2d0.name = self.texture.name;
	_effect.texture2d0.enabled = YES;
	_effect.transform.modelviewMatrix = self.transform;
	_effect.transform.projectionMatrix = *projectionMatrix;
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
