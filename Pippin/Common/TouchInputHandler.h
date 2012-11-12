//
//  TouchInputHandler.h
//  Pippin
//
//  Created by Mark Stultz on 11/11/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class TouchInputEvent;

@protocol TouchInputHandler <NSObject>
@optional
- (void)touchBegan:(TouchInputEvent *)event;
- (void)touchMoved:(TouchInputEvent *)event;
- (void)touchEnded:(TouchInputEvent *)event;

@end
