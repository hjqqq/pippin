//
//  SpriteFrame.h
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpriteFrame : NSObject
{
}

@property (nonatomic) GLKVector2 texMins;
@property (nonatomic) GLKVector2 texMaxs;

- (id)initWithTexMins:(GLKVector2)texMins texMaxs:(GLKVector2)texMaxs;

@end
