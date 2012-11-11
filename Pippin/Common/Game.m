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
#import "Entity.h"
#import "TextureController.h"
#import "SpriteController.h"
#import "EntityController.h"

@implementation Game

@synthesize scene;

- (id)initWithViewportSize:(GLKVector2)size;
{
	self = [super init];
	if( self != nil )
	{
		[SpriteController initSharedControllerWithContentsOfFile:@"data/json/sprites.json"];
		[EntityController initSharedControllerWithContentsOfFile:@"data/json/entities.json"];
		
		Color bgColor = ColorMake( 0.0f, 0.0f, 0.0f, 1.0f );
		self.scene = [[Scene alloc] initWithViewportSize:size backgroundColor:bgColor];
		
		[self.scene addEntity:[[EntityController sharedController] entityNamed:@"button"]];
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

/*
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
{
	for( UITouch *touch in touches )
	{
		CGPoint location = [touch locationInView: [touch view]];
		location.y = [touch view].bounds.size.height - location.y;
	
		for( Entity *entity in self.scene.entities )
		{
			if( CGRectContainsPoint( entity.bounds, location ) )
			{
				// Hit
			}
		}
	}
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
{
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
{
	
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
{
	
}
*/

@end
