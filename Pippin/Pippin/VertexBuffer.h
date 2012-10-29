//
//  VertexBuffer.h
//  Pippin
//
//  Created by Mark Stultz on 10/28/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VertexBuffer : NSObject
{
	GLuint _bufferId;
}

- (id)initWithData:(GLfloat *)data size:(size_t)size;

- (void)update:(GLfloat *)data size:(size_t)size;
- (void)bind;
- (void)unbind;

@end
