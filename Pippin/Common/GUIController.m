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

static GUIController *_sharedController;

@interface GUIController ()
{
	NSMutableDictionary *_screens;
	GUIScreen *_screen;
	Camera *_camera;
}

@end

@implementation GUIController

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

@end
