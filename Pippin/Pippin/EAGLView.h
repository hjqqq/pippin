//
//  EAGLView.h
//  Pippin
//
//  Created by Mark Stultz on 10/31/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OpenGLES2Renderer;

@interface EAGLView : UIView
{
	EAGLContext *_context;
	OpenGLES2Renderer *_renderer;
	id _displayLink;
}

@end
