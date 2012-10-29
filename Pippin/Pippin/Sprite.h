//
//  Sprite.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>

@class VertexBuffer;
@class IndexBuffer;

@interface Sprite : NSObject
{
	GLfloat _vertexData[ 20 ];
}

@property (strong, nonatomic) VertexBuffer *vertexBuffer;
@property (strong, nonatomic) IndexBuffer *indexBuffer;
@property (nonatomic) GLKVector3 position;
@property (nonatomic) GLKVector3 size;
@property (nonatomic) GLKMatrix4 transform;

- (void)draw;

@end
