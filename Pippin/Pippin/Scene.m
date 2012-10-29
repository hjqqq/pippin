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

- (id)initWithBackgroundColor:(Color)backgroundColor;
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
	glClearColor( self.bgColor.r, self.bgColor.g, self.bgColor.b, self.bgColor.a );
	glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
}

@end
