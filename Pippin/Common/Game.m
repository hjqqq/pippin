//
//  Game.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Game.h"
#import "Scene.h"
#import "TextureController.h"
#import "SpriteController.h"
#import "EntityController.h"
#import "GUIController.h"
#import "InputController.h"

@implementation Game

@synthesize scene;

- (id)initWithViewportSize:(GLKVector2)size;
{
	self = [super init];
	if( self != nil )
	{
		[SpriteController initSharedControllerWithContentsOfFile:@"data/json/sprites.json"];
		[EntityController initSharedControllerWithContentsOfFile:@"data/json/entities.json"];
		[GUIController initSharedControllerWithContentsOfFile:@"data/json/ui.json"];
		
		GUIController *guiController = [GUIController sharedController];
		[guiController viewportSizeChanged:size];
		[guiController setScreen:@"main"];
		[[InputController sharedController] addMouseInputHandler:guiController];
		
		Color bgColor = ColorMake( 0.0f, 0.0f, 0.0f, 1.0f );
		self.scene = [[Scene alloc] initWithViewportSize:size backgroundColor:bgColor];
	}
	
	return self;
}

- (void)draw;
{
	[self.scene render];
	[[GUIController sharedController] render];
}

- (void)viewportSizeChanged:(GLKVector2)size;
{
	[self.scene viewportSizeChanged:size];
	[[GUIController sharedController] viewportSizeChanged:size];
}

@end
