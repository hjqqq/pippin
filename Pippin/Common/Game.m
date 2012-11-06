//
//  Game.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Game.h"
#import "Scene.h"
#import "Sprite.h"
#import "TextureController.h"
#import "SpriteController.h"
#import "EntityController.h"

@implementation Game

@synthesize textureController;
@synthesize spriteController;
@synthesize entityController;
@synthesize scene;

- (id)initWithViewportSize:(GLKVector2)size;
{
	self = [super init];
	if( self != nil )
	{
		Color bgColor = ColorMake( 0.0f, 0.0f, 0.0f, 1.0f );
		self.textureController = [[TextureController alloc] init];
		self.spriteController = [[SpriteController alloc] initWithContentsOfFile:@"data/json/sprites.json" textureController:self.textureController];
		self.entityController = [[EntityController alloc] initWithContentsOfFile:@"data/json/entities.json" spriteController:self.spriteController];
		self.scene = [[Scene alloc] initWithViewportSize:size backgroundColor:bgColor];
		
		[self.scene addEntity:[self.entityController entityNamed:@"button"]];
	}
	
	return self;
}

- (void)draw;
{
	[self.scene beginFrame];
	[self.scene render];
}

- (void)viewportSizeChanged:(GLKVector2)size;
{
	[self.scene viewportSizeChanged:size];
}

@end
