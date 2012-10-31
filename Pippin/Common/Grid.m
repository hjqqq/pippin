//
//  Grid.m
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "Grid.h"

@implementation Grid

@synthesize gridSize;
@synthesize bgColor;

- (id)initWithGridSize:(CGSize)gridSize_ bgColor:(CGColorRef)bgColor_;
{
	self = [super init];
	if( self != nil )
	{
		self.gridSize = gridSize_;
		self.bgColor = bgColor_;
	}
	
	return self;
}

@end
