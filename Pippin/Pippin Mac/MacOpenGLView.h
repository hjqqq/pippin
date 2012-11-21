//
//  MacOpenGLView.h
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/CVDisplayLink.h>

@class OpenGLRenderer;

@interface MacOpenGLView : NSOpenGLView
{
	CVDisplayLinkRef _displayLink;
}

@property OpenGLRenderer *renderer;

@end
