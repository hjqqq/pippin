//
//  SpriteController.h
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sprite;

@interface SpriteController : NSObject
{
}

- (id)initWithContentsOfFile:(NSString *)path;

- (Sprite *)spriteNamed:(NSString *)name;

@end
