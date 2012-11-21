//
//  AppDelegate.h
//  Pippin Mac
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class EditorWindowController;

@interface AppDelegate : NSObject <NSApplicationDelegate>
{
}

@property (strong, nonatomic) EditorWindowController *editorWindowController;

@end
