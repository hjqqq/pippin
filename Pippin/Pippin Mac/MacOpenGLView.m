//
//  MacOpenGLView.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "MacOpenGLView.h"
#import "OpenGLRenderer.h"
#import "InputController.h"
#import "MouseInputEvent.h"

@interface MacOpenGLView ()

- (void)initializeOpenGL;
- (void)draw;
- (CVReturn)getFrameForTime:(const CVTimeStamp *)outputTime;

@end

@implementation MacOpenGLView

@synthesize renderer;

// This is the renderer output callback function
static CVReturn OnDisplayLink( CVDisplayLinkRef displayLink, const CVTimeStamp *now, const CVTimeStamp *outputTime,
	CVOptionFlags flagsIn, CVOptionFlags *flagsOut, void *displayLinkContext )
{
    CVReturn result = [(__bridge MacOpenGLView*)displayLinkContext getFrameForTime:outputTime];
    return result;
}

- (CVReturn)getFrameForTime:(const CVTimeStamp *)outputTime;
{
	@autoreleasepool
	{
		[self draw];
	}

	return kCVReturnSuccess;
}

- (void) dealloc
{	
	// Stop the display link BEFORE releasing anything in the view
	// otherwise the display link thread may call into the view and crash
	// when it encounters something that has been release
	CVDisplayLinkStop( _displayLink );
	CVDisplayLinkRelease( _displayLink );
}

- (void)awakeFromNib;
{
	NSOpenGLPixelFormatAttribute pixelAttributes[] =
	{
		NSOpenGLPFADoubleBuffer,
		NSOpenGLPFADepthSize, 24,
		// Must specify the 3.2 Core Profile to use OpenGL 3.2
		NSOpenGLPFAOpenGLProfile,
		NSOpenGLProfileVersion3_2Core,
		0
	};

	NSOpenGLPixelFormat *pixelFormat = [[NSOpenGLPixelFormat alloc] initWithAttributes:pixelAttributes];
	if( !pixelFormat )
	{
		NSLog( @"No OpenGL pixel format" );
	}
	
	[self setPixelFormat:pixelFormat];

	NSOpenGLContext *context = [[NSOpenGLContext alloc] initWithFormat:pixelFormat shareContext:nil];
	[self setOpenGLContext:context];
}

- (void)prepareOpenGL;
{
	[super prepareOpenGL];
	
	[self initializeOpenGL];
	
	// Create a display link capable of being used with all active displays
	CVDisplayLinkCreateWithActiveCGDisplays( &_displayLink );
	
	// Set the renderer output callback function
	CVDisplayLinkSetOutputCallback( _displayLink, &OnDisplayLink, (__bridge void*)self );
	
	// Set the display link for the current renderer
	CGLContextObj cglContext = [[self openGLContext] CGLContextObj];
	CGLPixelFormatObj cglPixelFormat = [[self pixelFormat] CGLPixelFormatObj];
	CVDisplayLinkSetCurrentCGDisplayFromOpenGLContext( _displayLink, cglContext, cglPixelFormat );
	
	// Activate the display link
	CVDisplayLinkStart( _displayLink );
}

- (void)initializeOpenGL;
{
	// Make this openGL context current to the thread
	// (i.e. all openGL on this thread calls will go to this context)
	[[self openGLContext] makeCurrentContext];
	
	// Synchronize buffer swaps with vertical refresh rate
	GLint swapInt = 1;
	[[self openGLContext] setValues:&swapInt forParameter:NSOpenGLCPSwapInterval];
	
	// Init our renderer.  Use 0 for the defaultFBO which is appropriate for MacOS (but not iOS)
	self.renderer = [[OpenGLRenderer alloc] initWithDefaultFBO:0 width:self.frame.size.width height:self.frame.size.height];
}

- (void)draw;
{	 
	[[self openGLContext] makeCurrentContext];

	// We draw on a secondary thread through the display link
	// When resizing the view, -reshape is called automatically on the main thread
	// Add a mutex around to avoid the threads accessing the context simultaneouslywhen resizing
	CGLLockContext( [[self openGLContext] CGLContextObj] );
	
	[self.renderer render];
	
	CGLFlushDrawable( [[self openGLContext] CGLContextObj] );
	CGLUnlockContext( [[self openGLContext] CGLContextObj] );
}

#pragma mark NSResponder Methods

- (void)mouseDown:(NSEvent *)theEvent;
{
	NSPoint location = [self convertPoint:[theEvent locationInWindow] fromView:nil];
	MouseInputEvent *mouseEvent = [[MouseInputEvent alloc] initWithPosition:GLKVector2Make( location.x, location.y )];	
	[[InputController sharedController] sendMouseEvent:mouseEvent withSelector:@selector(mouseDown:)];
}

- (void)mouseUp:(NSEvent *)theEvent;
{
	NSPoint location = [self convertPoint:[theEvent locationInWindow] fromView:nil];
	MouseInputEvent *mouseEvent = [[MouseInputEvent alloc] initWithPosition:GLKVector2Make( location.x, location.y )];
	[[InputController sharedController] sendMouseEvent:mouseEvent withSelector:@selector(mouseUp:)];
}

- (void)mouseMoved:(NSEvent *)theEvent;
{
	NSPoint location = [self convertPoint:[theEvent locationInWindow] fromView:nil];
	MouseInputEvent *mouseEvent = [[MouseInputEvent alloc] initWithPosition:GLKVector2Make( location.x, location.y )];
	[[InputController sharedController] sendMouseEvent:mouseEvent withSelector:@selector(mouseMoved:)];
}

- (void)mouseDragged:(NSEvent *)theEvent;
{
	NSPoint location = [self convertPoint:[theEvent locationInWindow] fromView:nil];
	MouseInputEvent *mouseEvent = [[MouseInputEvent alloc] initWithPosition:GLKVector2Make( location.x, location.y )];
	[[InputController sharedController] sendMouseEvent:mouseEvent withSelector:@selector(mouseMoved:)];
}

- (void)keyDown:(NSEvent *)theEvent;
{
}

- (void)keyUp:(NSEvent *)theEvent;
{
}

- (void)flagsChanged:(NSEvent *)theEvent;
{
}

@end
