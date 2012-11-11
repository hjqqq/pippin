//
//  Parser.h
//  Pippin
//
//  Created by Mark Stultz on 11/6/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Sprite;

@interface Parser : NSObject
{
}

+ (GLKVector3)parsePosition:(NSDictionary *)dict;
+ (GLKVector2)parseVec2Size:(NSDictionary *)dict;
+ (GLKVector3)parseVec3Size:(NSDictionary *)dict;
+ (GLKVector2)parseTexMins:(NSDictionary *)dict;
+ (GLKVector2)parseTexMaxs:(NSDictionary *)dict;
+ (Sprite *)parseSprite:(NSDictionary *)dict forKey:(NSString *)key;
+ (unsigned int)parseNumFrames:(NSDictionary *)dict;

@end
