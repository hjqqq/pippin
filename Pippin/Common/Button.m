//
//  Button.m
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Button.h"
#import "Parser.h"
#import "MeshRenderer.h"

@implementation Button

@synthesize idleSprite;
@synthesize pressedSprite;
@synthesize meshRenderer;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super initWithDictionary:dictionary];
	if( self != nil )
	{
		self.idleSprite = [Parser parseSprite:dictionary forKey:@"idleSprite"];
		self.pressedSprite = [Parser parseSprite:dictionary forKey:@"pressedSprite"];
		self.meshRenderer = [[MeshRenderer alloc] init];
		
		self.meshRenderer.sprite = idleSprite;
	}
	
	return self;
}

- (void)renderWithCamera:(Camera *)camera;
{
	[self.meshRenderer renderWithCamera:camera modelViewMatrix:self.transform];
}

@end
