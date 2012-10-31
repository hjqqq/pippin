//
//  VertexArrayObject.m
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "VertexArrayObject.h"

#if ( TARGET_OS_IPHONE || 	TARGET_IPHONE_SIMULATOR )
	#define glBindVertexArray glBindVertexArrayOES
	#define glGenVertexArrays glGenVertexArraysOES
	#define glDeleteVertexArrays glDeleteVertexArraysOES
#endif

@implementation VertexArrayObject

- (id)init;
{
	self = [super init];
	if( self != nil )
	{
		glGenVertexArrays( 1, &_arrayId );
		glBindVertexArray( _arrayId );
	}
	
	return self;
}

- (void)dealloc;
{
	glDeleteVertexArrays( 1, &_arrayId );
}

- (void)bind;
{
	glBindVertexArray( _arrayId );
}

- (void)unbind;
{
	glBindVertexArray( 0 );
}

@end
