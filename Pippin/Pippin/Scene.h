//
//  Scene.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Scene : NSObject
{
}

@property (nonatomic) Color bgColor;

- (id)initWithBackgroundColor:(Color)backgroundColor;

- (void)beginFrame;

@end
