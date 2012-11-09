//
//  Scene.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camera;
@class Entity;

@interface Scene : NSObject
{
	Camera *_camera;
	NSMutableArray *_entities;
}

@property (nonatomic) Color bgColor;
@property (readonly) NSArray *entities;

- (id)initWithViewportSize:(GLKVector2)size backgroundColor:(Color)backgroundColor;

- (void)viewportSizeChanged:(GLKVector2)size;

- (void)beginFrame;
- (void)render;

- (void)addEntity:(Entity *)entity;

@end
