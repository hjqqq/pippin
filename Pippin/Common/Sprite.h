//
//  Sprite.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Sprite : NSObject
{
}

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) GLKTextureInfo *texture;

- (id)initWithName:(NSString *)aName texturePath:(NSString *)texturePath size:(GLKVector2)size numFrames:(unsigned int)numFrames;

@end
