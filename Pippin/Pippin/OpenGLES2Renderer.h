//
//  OpenGLES2Renderer.h
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "OpenGLRenderer.h"

@interface OpenGLES2Renderer : OpenGLRenderer
{
}

- (id)initWithContext:(EAGLContext *)context drawable:(id<EAGLDrawable>)drawable;

- (void)render;
- (BOOL)resizeFromLayer:(CAEAGLLayer*)layer;

@end
