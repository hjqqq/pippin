//
//  TouchInputEvent.h
//  Pippin
//
//  Created by Mark Stultz on 11/11/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TouchInputEvent : NSObject
{
}

@property (nonatomic, readonly) GLKVector2 position;
@property (nonatomic, readonly) NSUInteger tapCount;

- (id)initWithPosition:(GLKVector2)position tapCount:(NSUInteger)tapCount;

@end
