//
//  VertexBuffer.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "VertexBuffer.h"

@implementation VertexBuffer

- (id)initWithData:(GLfloat *)data size:(size_t)size;
{
	self = [super init];
	if( self != nil )
	{
		glGenBuffers( 1, &_bufferId );
		glBindBuffer( GL_ARRAY_BUFFER, _bufferId );
		glBufferData( GL_ARRAY_BUFFER, size, data, GL_STATIC_DRAW );
	}
	
	return self;
}

- (void)dealloc;
{
	glDeleteBuffers( 1, &_bufferId );
}

- (void)update:(GLfloat *)data  size:(size_t)size;
{
	glBufferSubData( GL_ARRAY_BUFFER, 0, size, data );
}

- (void)bind;
{
	glBindBuffer( GL_ARRAY_BUFFER, _bufferId );
}

- (void)unbind;
{
	glBindBuffer( GL_ARRAY_BUFFER, 0 );
}

@end
