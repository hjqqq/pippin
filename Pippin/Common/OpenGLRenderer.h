//
//  OpenGLRenderer.h
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;

@interface OpenGLRenderer : NSObject
{
	GLuint _defaultFBOName;
	Game *_game;
}

- (id)initWithDefaultFBO:(GLuint)defaultFBOName width:(unsigned int)width height:(unsigned int)height;

- (void)render;
- (void)resizeWithWidth:(GLuint)width height:(GLuint)height;

@end
