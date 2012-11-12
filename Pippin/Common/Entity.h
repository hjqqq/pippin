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
@property (nonatomic) CGRect bounds;

- (id)initWithDictionary:(NSDictionary *)dictionary;

- (void)renderWithCamera:(Camera *)camera;

@end
