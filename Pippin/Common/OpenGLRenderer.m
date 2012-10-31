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

- (id)initWithDefaultFBO:(GLuint)defaultFBOName
{
	self = [super init];
	if( self != nil )
	{
		NSLog( @"%s %s", glGetString( GL_RENDERER ), glGetString( GL_VERSION ) );
		_defaultFBOName = defaultFBOName;
		
		//glEnable( GL_DEPTH_TEST );
		//glEnable( GL_CULL_FACE );
		
		_game = [[Game alloc] init];
		
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
}

@end
