//
//  Camera.m
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Camera.h"

@implementation Camera

@synthesize projectionMatrix;

- (id)initWithViewportWidth:(float)width height:(float)height;
{
	self = [super init];
	if( self != nil )
	{
		_projectionMatrix = GLKMatrix4MakeOrtho( 0.0f, width, 0.0f, height, 1.0f, -1.0f );
	}
	
	return self;
}

- (GLKMatrix4 *)projectionMatrix;
{
	return &_projectionMatrix;
}

@end
