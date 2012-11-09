//
//  EAGLView.m
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EAGLView.h"
#import "OpenGLES2Renderer.h"

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
	[_renderer touchesBegan:touches withEvent:event];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
{
	[_renderer touchesCancelled:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
	[_renderer touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
	[_renderer touchesMoved:touches withEvent:event];
}

@end
