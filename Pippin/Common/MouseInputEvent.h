//
//  MouseInputEvent.h
//  Pippin
//
//  Created by Mark Stultz on 11/11/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MouseInputEvent : NSObject
{
}

@property (nonatomic, readonly) GLKVector2 position;

- (id)initWithPosition:(GLKVector2)position;

@end
