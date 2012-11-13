//
//  GUIController.m
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "GUIController.h"
#import "GUIScreen.h"
#import "EntityParser.h"

static GUIController *_sharedController;

@interface GUIController ()
{
	NSMutableDictionary *_screens;
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

		[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
		{
			NSLog( @"GUIController: Loading %d screens...\n", (int)[dict count] );
			[dict enumerateKeysAndObjectsUsingBlock: ^( id key, id obj, BOOL *stop )
			{
				NSString *name = key;
				NSString *path = obj;
				
				[JSONParser parseContentsOfFile:path jsonObjectParsed:^(NSDictionary *dict)
				{
					[EntityParser parse:[dict objectForKey:@"entities"] entityParsed:^(Entity *entity)
					{
						entity = entity;
					}];
				}];
			}];
		}];
	}
	
	return self;
}

@end
