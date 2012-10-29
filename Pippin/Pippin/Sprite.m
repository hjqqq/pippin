//
//  Sprite.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Sprite.h"
#import "VertexBuffer.h"
#import "IndexBuffer.h"

@implementation Sprite

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
		memcpy( _vertexData, gVertexData, sizeof( gVertexData ) );
		self.vertexBuffer = [[VertexBuffer alloc] initWithData:gVertexData size:sizeof( gVertexData )];
		self.indexBuffer = [[IndexBuffer alloc] initWithData:gIndexData size:sizeof( gIndexData )];
		self.position = GLKVector3Make( 0.0f, 0.0f, 0.0f );
		self.size = GLKVector3Make( 0.0f, 0.0f, 0.0f );
		self.transform = GLKMatrix4Identity;
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

- (void)draw;
{
	[self.vertexBuffer bind];
	[self.indexBuffer bind];
}

@end
