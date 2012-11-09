//
//  Entity.m
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Entity.h"
#import "MeshRenderer.h"
#import "Sprite.h"
#import "SpriteFrame.h"
#import "Parser.h"

@interface Entity ()

- (void)updateBounds;

@end

@implementation Entity

@synthesize name;
@synthesize position = _position;
@synthesize size = _size;
@synthesize transform;
@synthesize bounds = _bounds;
@synthesize meshRenderer;
@synthesize sprite;

- (id)initWithDictionary:(NSDictionary *)dictionary;
{
	self = [super init];
	if( self != nil )
	{
		self.name = [dictionary objectForKey:@"sprite"];
		self.position = [Parser parsePosition:dictionary];
		self.size = [Parser parseVec3Size:dictionary];
		self.sprite = [Parser parseSprite:dictionary];
	}
	
	return self;
}

- (id)initWithName:(NSString *)aName sprite:(Sprite *)aSprite position:(GLKVector3)position size:(GLKVector3)size;
{
	self = [super init];
	if( self != nil )
	{
		self.name = aName;
		self.meshRenderer = [[MeshRenderer alloc] init];
		self.sprite = aSprite;
		self.transform = GLKMatrix4Identity;
		self.position = position;
		self.size = size;
		
		[self.meshRenderer setTexCoordsMin:self.sprite.frame.texMins max:self.sprite.frame.texMaxs];
	}
	
	return self;
}

- (void)setPosition:(GLKVector3)position_;
{
	if( !GLKVector3AllEqualToVector3( _position, position_ ) )
	{
		_position = position_;
		self.transform = GLKMatrix4TranslateWithVector3( self.transform, _position );
		[self updateBounds];
	}
}

- (void)setSize:(GLKVector3)size_;
{
	if( !GLKVector3AllEqualToVector3( _size, size_ ) )
	{
		_size = size_;
		self.transform = GLKMatrix4ScaleWithVector3( self.transform, _size );
		[self updateBounds];
	}
}

- (void)renderWithCamera:(Camera *)camera;
{
	[self.meshRenderer renderWithCamera:camera modelViewMatrix:self.transform sprite:self.sprite];
}

- (void)updateBounds;
{
	_bounds.origin = CGPointMake( self.position.x, self.position.y );
	_bounds.size = CGSizeMake( self.size.x, self.size.y );
}

@end
