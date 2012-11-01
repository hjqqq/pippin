//
//  Camera.h
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Camera : NSObject
{
	GLKMatrix4 _projectionMatrix;
}

@property (readonly) GLKMatrix4 *projectionMatrix;
@property (nonatomic) GLKVector2 size;

- (id)initWithViewportWidth:(float)width height:(float)height;

@end
