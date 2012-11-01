//
//  Scene.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camera;
@class Sprite;

@interface Scene : NSObject
{
	Camera *_camera;
	NSMutableArray *_sprites;
}

@property (nonatomic) Color bgColor;

- (id)initWithViewportSize:(GLKVector2)size backgroundColor:(Color)backgroundColor;

- (void)viewportSizeChanged:(GLKVector2)size;

- (void)beginFrame;
- (void)draw;

- (void)addSprite:(Sprite *)sprite;

@end
