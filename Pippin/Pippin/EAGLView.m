//
//  EAGLView.m
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EAGLView.h"
#import "OpenGLES2Renderer.h"
#import "InputController.h"
#import "TouchInputEvent.h"

@interface EAGLView ()

- (void)drawView:(id)sender;

@end

@implementation EAGLView

+ (Class)layerClass
{
	return [CAEAGLLayer class];
}

- (id)initWithCoder:(NSCoder *)aDecoder;
{
	self = [super initWithCoder:aDecoder];
	if( self != nil )
	{
		CAEAGLLayer *eaglLayer = (CAEAGLLayer *)self.layer;
		eaglLayer.opaque = YES;
		eaglLayer.drawableProperties = [NSDictionary dictionaryWithObjectsAndKeys:
			[NSNumber numberWithBool:FALSE], kEAGLDrawablePropertyRetainedBacking,
			kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, nil];
			
		_context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
		if( !_context || ![EAGLContext setCurrentContext:_context] )
		{
			return nil;
		}
		
		_renderer = [[OpenGLES2Renderer alloc] initWithContext:_context drawable:(id<EAGLDrawable>)self.layer];
		if( !_renderer )
		{
			return nil;
		}

		_displayLink = [NSClassFromString( @"CADisplayLink" ) displayLinkWithTarget:self selector:@selector(drawView:)];
		[_displayLink setFrameInterval:1];
		[_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
	}
	
	return self;
}

- (void)dealloc;
{
	if( [EAGLContext currentContext] == _context )
	{
		[EAGLContext setCurrentContext:nil];
	}
}

- (void)layoutSubviews
{
	[_renderer resizeFromLayer:(CAEAGLLayer*)self.layer];
	[self drawView:nil];
}

- (void)drawView:(id)sender;
{
	[EAGLContext setCurrentContext:_context];
	[_renderer render];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
{
	for( UITouch *touch in touches )
	{
		CGPoint location = [touch locationInView: [touch view]];
		location.y = [touch view].bounds.size.height - location.y;
		GLKVector2 position = GLKVector2Make( location.x, location.y );

		TouchInputEvent *touchEvent = [[TouchInputEvent alloc] initWithPosition:position tapCount:touch.tapCount];
		[[InputController sharedController] sendTouchEvent:touchEvent withSelector:@selector(touchBegan:)];
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
{
	for( UITouch *touch in touches )
	{
		CGPoint location = [touch locationInView: [touch view]];
		location.y = [touch view].bounds.size.height - location.y;
		GLKVector2 position = GLKVector2Make( location.x, location.y );

		TouchInputEvent *touchEvent = [[TouchInputEvent alloc] initWithPosition:position tapCount:touch.tapCount];
		[[InputController sharedController] sendTouchEvent:touchEvent withSelector:@selector(touchEnded:)];
	}
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
	for( UITouch *touch in touches )
	{
		CGPoint location = [touch locationInView: [touch view]];
		location.y = [touch view].bounds.size.height - location.y;
		GLKVector2 position = GLKVector2Make( location.x, location.y );

		TouchInputEvent *touchEvent = [[TouchInputEvent alloc] initWithPosition:position tapCount:touch.tapCount];
		[[InputController sharedController] sendTouchEvent:touchEvent withSelector:@selector(touchEnded:)];
	}
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
	for( UITouch *touch in touches )
	{
		CGPoint location = [touch locationInView: [touch view]];
		location.y = [touch view].bounds.size.height - location.y;
		GLKVector2 position = GLKVector2Make( location.x, location.y );

		TouchInputEvent *touchEvent = [[TouchInputEvent alloc] initWithPosition:position tapCount:touch.tapCount];
		[[InputController sharedController] sendTouchEvent:touchEvent withSelector:@selector(touchMoved:)];
	}
}

@end
