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

@class GUIScreen;

@interface GUIController : NSObject <MouseInputHandler, TouchInputHandler>
{
}

@property (strong, nonatomic) GUIScreen *screen;

+ (GUIController *)sharedController;
+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;

- (id)initWithContentsOfFile:(NSString *)path;

- (void)setScreen:(NSString *)screenName;
- (void)viewportSizeChanged:(GLKVector2)size;
- (void)render;

@end
