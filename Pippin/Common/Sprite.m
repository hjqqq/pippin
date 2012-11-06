//
//  Sprite.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Sprite.h"
#import "SpriteFrame.h"

@interface Sprite ()
{
	NSMutableArray *_frames;
}

@end

@implementation Sprite

@synthesize name;
@synthesize texture;
@synthesize frame;

- (id)initWithName:(NSString *)aName texture:(GLKTextureInfo *)aTexture size:(GLKVector2)size numFrames:(unsigned int)numFrames;
{
	self = [super init];
	if( self != nil )
	{
		self.name = aName;
		self.texture = aTexture;
		
		_frames = [[NSMutableArray alloc] init];
		
		int processedFrames;
		GLKVector2 pos = GLKVector2Make( 0.0f, 0.0f );
		GLKVector2 texSize = GLKVector2Make( self.texture.width, self.texture.height );
		for( processedFrames = 0; processedFrames < numFrames; ++processedFrames )
		{
			// TODO: Clamp, error check
			GLKVector2 texMins = GLKVector2Make( pos.x / texSize.x, pos.y / texSize.y );
			GLKVector2 texMaxs = GLKVector2Make( ( pos.x + size.x ) / texSize.x, ( pos.y + size.y ) / texSize.y );
			SpriteFrame *spriteFrame = [[SpriteFrame alloc] initWithTexMins:texMins texMaxs:texMaxs];
			[_frames addObject:spriteFrame];

			pos.x += size.x;
			if( pos.x >= texSize.x )
			{
				pos.x = 0.0f;
				pos.y += size.y;
				if( pos.y >= texSize.y )
				{
					++processedFrames;
					break;
				}
			}
		}
		
		if( processedFrames < numFrames )
		{
			// Error, we didn't process all of the frames. The texture was too small.
		}
		
		self.frame = [_frames objectAtIndex:0];
	}
	
	return self;
}

- (id)initWithName:(NSString *)aName texture:(GLKTextureInfo *)aTexture size:(GLKVector2)aSize texMins:(GLKVector2)aTexMins texMaxs:(GLKVector2)aTexMaxs;
{
	self = [super init];
	if( self != nil )
	{
		self.name = aName;
		self.texture = aTexture;
		
		_frames = [[NSMutableArray alloc] init];
		SpriteFrame *spriteFrame = [[SpriteFrame alloc] initWithTexMins:aTexMins texMaxs:aTexMaxs];
		[_frames addObject:spriteFrame];
		
		self.frame = [_frames objectAtIndex:0];
	}
	
	return self;
}

@end
