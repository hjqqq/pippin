//
//  EditorWindow.h
//  Pippin
//
//  Created by Mark Stultz on 11/15/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditorSourceView.h"

@class Game;
@class EditorMainView;
@class EntityEditor;
@class Entity;

@interface EditorWindow : NSWindowController <NSWindowDelegate, NSSplitViewDelegate, EntitySelector>
{
}

@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) EditorSourceView *sourceView;
@property (strong, nonatomic) EditorMainView *mainView;
@property (strong, nonatomic) EntityEditor *entityEditor;
@property (strong, nonatomic) Entity *selectedEntity;
@property (weak) IBOutlet NSSplitView *splitView;

@end
