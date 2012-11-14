//
//  Entity.h
//  Pippin
//
//  Created by Mark Stultz on 11/4/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camera;
@class MeshRenderer;
@class Sprite;

@interface Entity : NSObject
{
}

@property (strong, nonatomic) NSString *name;
@property (nonatomic) GLKVector3 position;
@property (nonatomic) GLKVector3 size;
@property (nonatomic) GLKMatrix4 transform;
@property (nonatomic) GLKMatrix4 worldTransform;
@property (nonatomic) CGRect worldBounds;
@property (nonatomic, assign) Entity *parent;
@property (nonatomic, readonly) NSArray *children;

+ (void)yieldChildren:(Entity *)entity childEntity:(void (^)( Entity *childEntity ) )childEntity;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (void)addChild:(Entity *)child;
- (void)removeChild:(Entity *)child;

- (void)renderWithCamera:(Camera *)camera;

@end
