//
//  Button.h
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entity.h"
#import "MouseInputHandler.h"

@class Sprite;

@interface Button : Entity
{
}

@property (strong, nonatomic) Sprite *idleSprite;
@property (strong, nonatomic) Sprite *pressedSprite;
@property (strong, nonatomic) MeshRenderer *meshRenderer;

- (id)initWithDictionary:(NSDictionary *)dict;

- (void)renderWithCamera:(Camera *)camera;

@end
