//
//  Entity.m
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Entity.h"
#import "MeshRenderer.h"

@implementation Entity

@synthesize name;
@synthesize position = _position;
@synthesize size = _size;
@synthesize transform;
@synthesize meshRenderer;
@synthesize sprite;

- (id)initWithName:(NSString *)aName sprite:(Sprite *)aSprite position:(GLKVector3)position size:(GLKVector3)size;
{
	self = [super init];
	if( self != nil )
	{
		self.name = name;
		self.meshRenderer = [[MeshRenderer alloc] init];
		self.sprite = sprite;
		self.transform = GLKMatrix4Identity;
		self.position = position;
		self.size = size;
	}
	
	return self;
}

- (void)setPosition:(GLKVector3)position_;
{
	if( !GLKVector3AllEqualToVector3( _position, position_ ) )
	{
		_position = position_;
		
		self.transform = GLKMatrix4TranslateWithVector3( self.transform, _position );
	}
}

- (void)setSize:(GLKVector3)size_;
{
	if( !GLKVector3AllEqualToVector3( _size, size_ ) )
	{
		_size = size_;
		
		self.transform = GLKMatrix4ScaleWithVector3( self.transform, _size );
	}
}

- (void)renderWithCamera:(Camera *)camera;
{
	[self.meshRenderer renderWithCamera:camera modelViewMatrix:self.transform sprite:self.sprite];
}

@end
