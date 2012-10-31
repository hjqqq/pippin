//
//  OpenGLES2Renderer.m
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "OpenGLES2Renderer.h"

@interface OpenGLES2Renderer ()
{
	EAGLContext *_context;
	GLuint _colorRenderbuffer;
	GLuint _depthRenderbuffer;
}

@end

@implementation OpenGLES2Renderer

- (id) initWithContext:(EAGLContext *)context drawable:(id<EAGLDrawable>)drawable;
{
	glGenFramebuffers( 1, &_defaultFBOName );

	// Create default framebuffer object. The backing will be allocated for the
	// current layer in -resizeFromLayer
	glGenRenderbuffers( 1, &_colorRenderbuffer );
	glBindFramebuffer( GL_FRAMEBUFFER, _defaultFBOName );
	glBindRenderbuffer( GL_RENDERBUFFER, _colorRenderbuffer );
	_context = context;

	// This call associates the storage for the current render buffer with the
	// EAGLDrawable (our CAEAGLLayer) allowing us to draw into a buffer that will
	// later be rendered to the screen wherever the layer is (which corresponds with our view).
	[_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:drawable];

	glFramebufferRenderbuffer( GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, _colorRenderbuffer );
	
	GLint backingWidth;
	GLint backingHeight;
	glGetRenderbufferParameteriv( GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &backingWidth );
	glGetRenderbufferParameteriv( GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &backingHeight );
	
	glGenRenderbuffers( 1, &_depthRenderbuffer );
	glBindRenderbuffer( GL_RENDERBUFFER, _depthRenderbuffer );
	glRenderbufferStorage( GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, backingWidth, backingHeight );
	glFramebufferRenderbuffer( GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, _depthRenderbuffer );
	
	if( glCheckFramebufferStatus( GL_FRAMEBUFFER ) != GL_FRAMEBUFFER_COMPLETE )
	{
		NSLog( @"failed to make complete framebuffer object %x", glCheckFramebufferStatus( GL_FRAMEBUFFER ) );
		return nil;
	}
	
	self = [super initWithDefaultFBO:_defaultFBOName];
	if( self == nil )
	{
		glDeleteFramebuffers( 1, &_defaultFBOName );
		glDeleteRenderbuffers( 1, &_colorRenderbuffer );
		glDeleteRenderbuffers( 1, &_depthRenderbuffer );
	}
	
	return self;
}

- (void)dealloc;
{
	if( _defaultFBOName )
	{
		glDeleteFramebuffers( 1, &_defaultFBOName );
		_defaultFBOName = 0;
	}
	
	if( _colorRenderbuffer )
	{
		glDeleteRenderbuffers(1, &_colorRenderbuffer );
		_colorRenderbuffer = 0;
	}
}

- (void)render;
{
	glBindFramebuffer( GL_FRAMEBUFFER, _defaultFBOName );

	[super render];
	    
	glBindRenderbuffer( GL_RENDERBUFFER, _colorRenderbuffer );
	[_context presentRenderbuffer:GL_RENDERBUFFER];
}

- (BOOL)resizeFromLayer:(CAEAGLLayer*)layer;
{
	// Allocate color buffer backing based on the current layer size
	glBindRenderbuffer( GL_RENDERBUFFER, _colorRenderbuffer );
	[_context renderbufferStorage:GL_RENDERBUFFER fromDrawable:layer];
	 
	GLint backingWidth;
	GLint backingHeight;
	glGetRenderbufferParameteriv( GL_RENDERBUFFER, GL_RENDERBUFFER_WIDTH, &backingWidth );
	glGetRenderbufferParameteriv( GL_RENDERBUFFER, GL_RENDERBUFFER_HEIGHT, &backingHeight );
	
	glGenRenderbuffers( 1, &_depthRenderbuffer );
	glBindRenderbuffer( GL_RENDERBUFFER, _depthRenderbuffer );
	glRenderbufferStorage( GL_RENDERBUFFER, GL_DEPTH_COMPONENT16, backingWidth, backingHeight );
	glFramebufferRenderbuffer( GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, _depthRenderbuffer );
	
	[super resizeWithWidth:backingWidth height:backingHeight];
	
	if( glCheckFramebufferStatus( GL_FRAMEBUFFER ) != GL_FRAMEBUFFER_COMPLETE )
	{
		NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatus( GL_FRAMEBUFFER ) );
		return NO;
	}

	return YES;
}

@end
