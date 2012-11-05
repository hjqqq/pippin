//
//  MeshRenderer.h
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VertexArrayObject;
@class VertexBuffer;
@class IndexBuffer;
@class Camera;
@class Sprite;

@interface MeshRenderer : NSObject
{
	GLKBaseEffect *_effect;
	GLfloat _vertexData[ 20 ];
}

@property (strong, nonatomic) VertexArrayObject *vertexArrayObject;
@property (strong, nonatomic) VertexBuffer *vertexBuffer;
@property (strong, nonatomic) IndexBuffer *indexBuffer;

- (void)setTexCoordsMin:(GLKVector2)min max:(GLKVector2)max;

- (void)renderWithCamera:(Camera *)camera modelViewMatrix:(GLKMatrix4)modelViewMatrix sprite:(Sprite *)sprite;

@end
