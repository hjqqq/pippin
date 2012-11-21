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

@synthesize game;

- (id)initWithDefaultFBO:(GLuint)defaultFBOName width:(unsigned int)width height:(unsigned int)height;
{
	self = [super init];
	if( self != nil )
	{
		NSLog( @"%s %s", glGetString( GL_RENDERER ), glGetString( GL_VERSION ) );
		NSLog( @"%d, %d", width, height );
		
		_defaultFBOName = defaultFBOName;
		
		[self resizeWithWidth:width height:height];

		glEnable( GL_DEPTH_TEST );
		glEnable( GL_CULL_FACE );
		glEnable( GL_BLEND );
		glBlendFunc( GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA );
		
		[self render];
	}
	
	return self;
}

- (void)render;
{
	[self.game draw];
}

- (void)resizeWithWidth:(GLuint)width height:(GLuint)height;
{
	glViewport( 0, 0, width, height );
	
	_viewWidth = width;
	_viewHeight = height;
	
	[self.game viewportSizeChanged:GLKVector2Make( width, height )];
}

@end
