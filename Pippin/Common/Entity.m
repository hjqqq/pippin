//
//  Entity.m
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Entity.h"
#import "Sprite.h"
#import "SpriteFrame.h"

@interface Entity ()
{
	NSMutableArray *_children;
}

- (void)updateTransform;

@end

@implementation Entity

@synthesize name;
@synthesize position = _position;
@synthesize size = _size;
@synthesize transform;
@synthesize worldTransform;
@synthesize worldBounds = _worldBounds;
@synthesize parent;
@synthesize children;

+ (void)yieldChildren:(Entity *)entity childEntity:(void (^)( Entity *childEntity ) )childEntity;
{
	for( Entity *child in entity.children )
	{
		[Entity yieldChildren:child childEntity:childEntity];
	}
	
	childEntity( entity );
}

- (id)init;
{
	self = [super init];
	if( self != nil )
	{
		self.name = @"Entity";
		self.transform = GLKMatrix4Identity;
		self.worldTransform = GLKMatrix4Identity;
		self.position = GLKVector3Make( 0.0f, 0.0f, 0.0f );
		self.size = GLKVector3Make( 1.0f, 1.0f, 1.0f );
		_children = [[NSMutableArray alloc] init];
	}
	
	return self;
}

- (id)initWithDictionary:(NSDictionary *)dictionary;
{
	self = [self init];
	if( self != nil )
	{
		self.name = [dictionary objectForKey:@"name"];
		self.position = [Parser parsePosition:dictionary];
		self.size = [Parser parseVec3Size:dictionary];
	}
	
	return self;
}

- (void)setPosition:(GLKVector3)position_;
{
	if( !GLKVector3AllEqualToVector3( _position, position_ ) )
	{
		_position = position_;
		[self updateTransform];
	}
}

- (void)setSize:(GLKVector3)size_;
{
	if( !GLKVector3AllEqualToVector3( _size, size_ ) )
	{
		_size = size_;
		[self updateTransform];
	}
}

- (NSArray *)children;
{
	return _children;
}

- (void)addChild:(Entity *)child;
{
	child.parent = self;
	[_children addObject:child];
	[child updateTransform];
}

- (void)removeChild:(Entity *)child;
{
	child.parent = nil;
	[_children removeObject:child];
	[child updateTransform];
}

- (void)renderWithCamera:(Camera *)camera;
{
	for( Entity *child in _children )
	{
		[child renderWithCamera:camera];
	}
}

#pragma mark Private Methods

- (void)updateTransform;
{
	self.transform = GLKMatrix4Identity;
	self.transform = GLKMatrix4TranslateWithVector3( self.transform, _position );
	self.transform = GLKMatrix4ScaleWithVector3( self.transform, _size );

	if( self.parent != nil )
	{
		self.worldTransform = GLKMatrix4Multiply( self.transform, self.parent.transform );
	}
	else
	{
		self.worldTransform = self.transform;
	}
	
	float x = self.worldTransform.m[ 12 ];
	float y = self.worldTransform.m[ 13 ];
	//float z = self.worldTransform.m[ 14 ];

	float width = self.worldTransform.m[ 0 ];
	float height = self.worldTransform.m[ 5 ];
	//float depth = self.worldTransform.m[ 10 ];

	_worldBounds.origin = CGPointMake( x, y );
	_worldBounds.size = CGSizeMake( width, height );
}

@end
