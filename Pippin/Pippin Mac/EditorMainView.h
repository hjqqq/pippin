//
//  EditorMainView.h
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MacOpenGLView;

@interface EditorMainView : NSViewController
{
}

@property (weak) IBOutlet MacOpenGLView *glView;
@property (weak) IBOutlet NSView *detailView;

@end
