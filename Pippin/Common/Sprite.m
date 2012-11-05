//
//  Sprite.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite

@synthesize name;
@synthesize texture;

- (id)initWithName:(NSString *)aName texturePath:(NSString *)texturePath size:(GLKVector2)size numFrames:(unsigned int)numFrames;
{
	self = [super init];
	if( self != nil )
	{
		self.name = name;
	
		NSError *error;
		NSString *path = [[NSBundle mainBundle] pathForResource:texturePath ofType:nil];
		self.texture = [GLKTextureLoader textureWithContentsOfFile:path options:nil error:&error];
	}
	
	return self;
}

@end
