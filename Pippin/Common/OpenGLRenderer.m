//
//  OpenGLRenderer.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "OpenGLRenderer.h"
#import "Game.h"

@interface OpenGLRenderer ()
{
	GLuint _viewWidth;
	GLuint _viewHeight;
}

@end

@implementation OpenGLRenderer

- (id)initWithDefaultFBO:(GLuint)defaultFBOName width:(unsigned int)width height:(unsigned int)height;
{
	self = [super init];
	if( self != nil )
	{
		NSLog( @"%s %s", glGetString( GL_RENDERER ), glGetString( GL_VERSION ) );
		NSLog( @"%d, %d", width, height );
		
		_defaultFBOName = defaultFBOName;
		
		[self resizeWithWidth:width height:height];

		//glEnable( GL_DEPTH_TEST );
		//glEnable( GL_CULL_FACE );
		
		_game = [[Game alloc] initWithViewportSize:GLKVector2Make( (float)width, (float)height )];
		
		[self render];
	}
	
	return self;
}

- (void)render;
{
	[_game draw];
}

- (void)resizeWithWidth:(GLuint)width height:(GLuint)height;
{
	glViewport( 0, 0, width, height );
	
	_viewWidth = width;
	_viewHeight = height;
	
	[_game viewportSizeChanged:GLKVector2Make( width, height )];
}

@end
