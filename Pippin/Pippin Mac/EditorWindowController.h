//
//  EditorWindowController.h
//  Pippin
//
//  Created by Mark Stultz on 11/15/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Game;
@class MacOpenGLView;

@interface EditorWindowController : NSWindowController <NSWindowDelegate, NSSplitViewDelegate, NSTableViewDelegate, NSTableViewDataSource>
{
}

@property (strong, nonatomic) Game *game;
@property (weak) IBOutlet NSSplitView *splitView;
@property (weak) IBOutlet NSTableView *sourceList;
@property (weak) IBOutlet MacOpenGLView *glView;

@end
