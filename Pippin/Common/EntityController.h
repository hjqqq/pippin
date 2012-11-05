//
//  EntityController.h
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entity;
@class SpriteController;

@interface EntityController : NSObject
{
}

- (id)initWithContentsOfFile:(NSString *)path spriteController:(SpriteController *)spriteController;

- (Entity *)entityNamed:(NSString *)name;

@end
