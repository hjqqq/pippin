//
//  GUIController.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EntityController.h"
#import "MouseInputHandler.h"
#import "TouchInputHandler.h"

@interface GUIController : NSObject <MouseInputHandler, TouchInputHandler>
{
}

+ (GUIController *)sharedController;
+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;

- (id)initWithContentsOfFile:(NSString *)path;

- (void)setScreen:(NSString *)screenName;
- (void)viewportSizeChanged:(GLKVector2)size;
- (void)render;

@end
