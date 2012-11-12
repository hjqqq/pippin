//
//  MouseInputHandler.h
//  Pippin
//
//  Created by Mark Stultz on 11/11/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MouseInputEvent;

@protocol MouseInputHandler <NSObject>
@optional
- (void)mouseDown:(MouseInputEvent *)event;
- (void)mouseUp:(MouseInputEvent *)event;
- (void)mouseMoved:(MouseInputEvent *)event;

@end
