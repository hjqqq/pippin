//
//  VertexArrayObject.h
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VertexArrayObject : NSObject
{
	GLuint _arrayId;
}

- (void)bind;
- (void)unbind;

@end
