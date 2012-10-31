//
//  Sprite.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VertexArrayObject;
@class VertexBuffer;
@class IndexBuffer;

@interface Sprite : NSObject
{
	GLKBaseEffect *_effect;
	GLfloat _vertexData[ 20 ];
}

@property (strong, nonatomic) VertexArrayObject *vertexArrayObject;
@property (strong, nonatomic) VertexBuffer *vertexBuffer;
@property (strong, nonatomic) IndexBuffer *indexBuffer;
@property (nonatomic) GLKVector3 position;
@property (nonatomic) GLKVector3 size;
@property (nonatomic) GLKMatrix4 transform;

- (void)drawWithProjectionMatrix:(const GLKMatrix4*)projectionMatrix;

@end
