//
//  Scene.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Scene.h"

@implementation Scene

@synthesize bgColor;

- (id)initWithBackgroundColor:(CGColorRef)backgroundColor;
{
	self = [super init];
	if( self != nil )
	{
		self.bgColor = backgroundColor;
	}
	
	return self;
}

- (void)beginFrame;
{
	glClearColor( 0.65f, 0.65f, 0.65f, 1.0f );
	glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
}

@end
