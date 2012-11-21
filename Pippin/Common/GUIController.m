//
//  GUIController.m
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "GUIController.h"
#import "GUIScreen.h"
#import "Camera.h"
#import "Button.h"
#import "Entity.h"
#import "MouseInputEvent.h"
#import "TouchInputEvent.h"
#import "MeshRenderer.h"

static GUIController *_sharedController;

@interface GUIController ()
{
	NSMutableDictionary *_screens;
	Camera *_camera;
	Button *_hitButton;
}

@end

@implementation GUIController

@synthesize screen = _screen;

+ (GUIController *)sharedController
{
	return _sharedController;
}

+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;
{
	_sharedController = [[GUIController alloc] initWithContentsOfFile:path];
	return _sharedController;
}

- (id)initWithContentsOfFile:(NSString *)path;
{
	self = [super init];
	if( self != nil )
	{
		_screens = [[NSMutableDictionary alloc] init];
		_camera = [[Camera alloc] initWithViewportWidth:1.0f height:1.0f ];

		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			NSLog( @"GUIController: Loading %d screens...\n", (int)[dict count] );
			[dict enumerateKeysAndObjectsUsingBlock: ^( id key, id obj, BOOL *stop )
			{
				NSString *screenName = key;
				NSString *screenPath = obj;
				
				GUIScreen *screen = [[GUIScreen alloc] initWithContentsOfFile:screenPath];
				[_screens setObject:screen forKey:screenName];
			}];
		}];
	}
	
	return self;
}

- (void)setScreen:(NSString *)screenName;
{
	GUIScreen *screen = [_screens objectForKey:screenName];
	if( screen == nil )
	{
		// Error
	}
	
	if( _screen != screen )
	{
		_screen = screen;
	}
}

- (void)viewportSizeChanged:(GLKVector2)size;
{
	_camera.size = size;
}

- (void)render;
{
	if( _screen != nil )
	{
		[_screen renderWithCamera:_camera];
	}
}

#pragma mark MouseInputHandler

- (void)mouseDown:(MouseInputEvent *)event;
{
	_hitButton = nil;

	if( _screen != nil )
	{
		Entity *hitEntity = [_screen traceInput:event.position];
		if( hitEntity != nil )
		{
			// TODO: Factor out this casting
			if( [hitEntity isKindOfClass:[Button class]] )
			{
				_hitButton = (Button *)hitEntity;
				_hitButton.meshRenderer.sprite = _hitButton.pressedSprite;
			}
		}
	}
}

- (void)mouseUp:(MouseInputEvent *)event;
{
	if( _screen != nil )
	{
		_hitButton.meshRenderer.sprite = _hitButton.idleSprite;
		_hitButton = nil;
	}
	else
	{
		_hitButton = nil;
	}
}

- (void)mouseMoved:(MouseInputEvent *)event;
{
	if( _screen != nil )
	{
		if( _hitButton != nil )
		{
			if( CGRectContainsPoint( _hitButton.worldBounds, CGPointMake( event.position.x, event.position.y ) )  )
			{
				_hitButton.meshRenderer.sprite = _hitButton.pressedSprite;
			}
			else
			{
				_hitButton.meshRenderer.sprite = _hitButton.idleSprite;
			}
		}
	}
	else
	{
		_hitButton = nil;
	}
}

#pragma mark TouchInputHandler

- (void)touchBegan:(TouchInputEvent *)event;
{
	_hitButton = nil;

	if( _screen != nil )
	{
		Entity *hitEntity = [_screen traceInput:event.position];
		if( hitEntity != nil )
		{
			// TODO: Factor out this casting
			if( [hitEntity isKindOfClass:[Button class]] )
			{
				_hitButton = (Button *)hitEntity;
				_hitButton.meshRenderer.sprite = _hitButton.pressedSprite;
			}
		}
	}
}

- (void)touchMoved:(TouchInputEvent *)event;
{
	if( _screen != nil )
	{
		if( _hitButton != nil )
		{
			if( CGRectContainsPoint( _hitButton.worldBounds, CGPointMake( event.position.x, event.position.y ) )  )
			{
				_hitButton.meshRenderer.sprite = _hitButton.pressedSprite;
			}
			else
			{
				_hitButton.meshRenderer.sprite = _hitButton.idleSprite;
			}
		}
	}
	else
	{
		_hitButton = nil;
	}
}

- (void)touchEnded:(TouchInputEvent *)event;
{
	if( _screen != nil )
	{
		_hitButton.meshRenderer.sprite = _hitButton.idleSprite;
		_hitButton = nil;
	}
	else
	{
		_hitButton = nil;
	}
}

@end
