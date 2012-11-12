//
//  InputController.h
//  Pippin
//
//  Created by Mark Stultz on 11/10/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MouseInputHandler.h"
#import "TouchInputHandler.h"

@class MouseInputEvent;
@class TouchInputEvent;

@interface InputController : NSObject
{
}

@property (nonatomic, retain, readonly) NSMutableArray *mouseInputHandlers;
@property (nonatomic, retain, readonly) NSMutableArray *touchInputHandlers;

+ (InputController *)sharedController;

- (void)addMouseInputHandler:(id<MouseInputHandler>)mouseInputHandler;
- (void)addTouchInputHandler:(id<TouchInputHandler>)touchInputHandler;

- (void)sendMouseEvent:(MouseInputEvent *)mouseEvent withSelector:(SEL)selector;
- (void)sendTouchEvent:(TouchInputEvent *)touchEvent withSelector:(SEL)selector;

@end
