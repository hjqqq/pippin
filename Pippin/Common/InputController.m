//
//  InputController.m
//  Pippin
//
//  Created by Mark Stultz on 11/10/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "InputController.h"
#import "MouseInputEvent.h"
#import "TouchInputEvent.h"

static InputController *_sharedController;

@implementation InputController

@synthesize mouseInputHandlers = _mouseInputHandlers;
@synthesize touchInputHandlers = _touchInputHandlers;

+ (InputController *)sharedController
{
	if( _sharedController == nil )
	{
		_sharedController = [[InputController alloc] init];
	}
	
	return _sharedController;
}

- (id)init;
{
	self = [super init];
	if( self != nil )
	{
		_mouseInputHandlers = [[NSMutableArray alloc] init];
		_touchInputHandlers = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (void)addMouseInputHandler:(id<MouseInputHandler>)mouseInputHandler;
{
	[_mouseInputHandlers addObject:mouseInputHandler];
}

- (void)addTouchInputHandler:(id<TouchInputHandler>)touchInputHandler;
{
	[_touchInputHandlers addObject:touchInputHandler];
}

- (void)sendMouseEvent:(MouseInputEvent *)mouseEvent withSelector:(SEL)selector;
{
	for( id<MouseInputHandler> handler in self.mouseInputHandlers )
	{
		if( [handler respondsToSelector:selector] )
		{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
			[handler performSelector:selector withObject:mouseEvent];
#pragma clang pop
		}
	}
}

- (void)sendTouchEvent:(TouchInputEvent *)touchEvent withSelector:(SEL)selector;
{
	for( id<TouchInputHandler> handler in self.touchInputHandlers )
	{
		if( [handler respondsToSelector:selector] )
		{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
			[handler performSelector:selector withObject:touchEvent];
#pragma clang pop
		}
	}
}

@end
