//
//  InputController.h
//  Pippin
//
//  Created by Mark Stultz on 11/10/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputController : NSObject
{
}

+ (InputController *)sharedController;

- (void)mouseDown:(GLKVector2)position;
- (void)mouseUp:(GLKVector2)position;
- (void)mouseMoved:(GLKVector2)position;

@end
