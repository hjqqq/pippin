//
//  Parser.m
//  Pippin
//
//  Created by Mark Stultz on 11/6/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Parser.h"
#import "SpriteController.h"
#import "Sprite.h"

@implementation Parser

+ (GLKVector3)parsePosition:(NSDictionary *)dict;
{
	GLKVector3 position = GLKVector3Make( 0.0f, 0.0f, 0.0f );
	
	NSArray *positionArray = [dict objectForKey:@"position"];
	if( positionArray != nil )
	{
		position.x = [[positionArray objectAtIndex:0] floatValue];
		position.y = [[positionArray objectAtIndex:1] floatValue];
		if( [positionArray count] > 2 ) { position.z = [[positionArray objectAtIndex:2] floatValue]; }
	}
	else
	{
		NSNumber *number = nil;
		if( ( number = [dict objectForKey:@"x"] ) != nil ) { position.x = [number floatValue]; }
		if( ( number = [dict objectForKey:@"y"] ) != nil ) { position.y = [number floatValue]; }
		if( ( number = [dict objectForKey:@"z"] ) != nil ) { position.z = [number floatValue]; }
	}
	
	return position;
}

+ (GLKVector2)parseVec2Size:(NSDictionary *)dict;
{
	GLKVector2 size = GLKVector2Make( 0.0f, 0.0f );
	
	NSArray *sizeArray = [dict objectForKey:@"size"];
	if( sizeArray != nil )
	{
		size.x = [[sizeArray objectAtIndex:0] floatValue];
		size.y = [[sizeArray objectAtIndex:1] floatValue];
	}
	else
	{
		NSNumber *number = nil;
		if( ( number = [dict objectForKey:@"width"] ) != nil ) { size.x = [number floatValue]; }
		if( ( number = [dict objectForKey:@"height"] ) != nil ) { size.y = [number floatValue]; }
	}
	
	return size;
}

+ (GLKVector3)parseVec3Size:(NSDictionary *)dict;
{
	GLKVector3 size = GLKVector3Make( 0.0f, 0.0f, 1.0f );
	
	NSArray *sizeArray = [dict objectForKey:@"size"];
	if( sizeArray != nil )
	{
		size.x = [[sizeArray objectAtIndex:0] floatValue];
		size.y = [[sizeArray objectAtIndex:1] floatValue];
	}
	else
	{
		NSNumber *number = nil;
		if( ( number = [dict objectForKey:@"width"] ) != nil ) { size.x = [number floatValue]; }
		if( ( number = [dict objectForKey:@"height"] ) != nil ) { size.y = [number floatValue]; }
	}
	
	return size;
}

+ (GLKVector2)parseTexMins:(NSDictionary *)dict;
{
	GLKVector2 texMins = GLKVector2Make( 0.0f, 0.0f );
	
	NSArray *texMinsArray = [dict objectForKey:@"texMins"];
	if( texMinsArray != nil )
	{
		texMins.x = [[texMinsArray objectAtIndex:0] floatValue];
		texMins.y = [[texMinsArray objectAtIndex:1] floatValue];
	}
	
	return texMins;
}

+ (GLKVector2)parseTexMaxs:(NSDictionary *)dict;
{
	GLKVector2 texMaxs = GLKVector2Make( 1.0f, 1.0f );
	
	NSArray *texMaxsArray = [dict objectForKey:@"texMaxs"];
	if( texMaxsArray != nil )
	{
		texMaxs.x = [[texMaxsArray objectAtIndex:0] floatValue];
		texMaxs.y = [[texMaxsArray objectAtIndex:1] floatValue];
	}

	return texMaxs;
}

+ (Sprite *)parseSprite:(NSDictionary *)dict forKey:(NSString *)key;
{
	NSString *spriteName = [dict objectForKey:key];
	return [[SpriteController sharedController] spriteNamed:spriteName];
}

+ (unsigned int)parseNumFrames:(NSDictionary *)dict;
{
	int numFrames = 1;
	
	NSNumber *number = nil;
	if( ( number = [dict objectForKey:@"frames"] ) != nil ) { numFrames = [number unsignedIntValue]; }
	
	return numFrames;
}

@end
