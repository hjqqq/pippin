//
//  Sprite.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SpriteFrame;

@interface Sprite : NSObject
{
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) GLKTextureInfo *texture;
@property (strong, nonatomic) SpriteFrame *frame;

- (id)initWithName:(NSString *)aName texture:(GLKTextureInfo *)aTexture size:(GLKVector2)aSize numFrames:(unsigned int)numFrames;
- (id)initWithName:(NSString *)aName texture:(GLKTextureInfo *)aTexture size:(GLKVector2)aSize texMins:(GLKVector2)aTexMins texMaxs:(GLKVector2)aTexMaxs;

@end
