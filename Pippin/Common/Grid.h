//
//  Grid.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Grid : NSObject
{
}

@property (nonatomic) CGSize gridSize;
@property (nonatomic) CGColorRef bgColor;

- (id)initWithGridSize:(CGSize)gridSize_ bgColor:(CGColorRef)bgColor_;

@end
