//
//  Game.h
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Scene;
@class TextureController;
@class SpriteController;
@class EntityController;

@interface Game : NSObject
{
}

@property (strong, nonatomic) Scene *scene;

- (id)initWithViewportSize:(GLKVector2)size;

- (void)draw;

- (void)viewportSizeChanged:(GLKVector2)size;

@end
