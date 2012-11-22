//
//  EditorSourceView.h
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol EntitySelector;

@interface EditorSourceView : NSViewController <NSTableViewDataSource, NSTableViewDelegate>
{
}

@property (weak) IBOutlet NSTableView *sourceList;
@property (assign) id<EntitySelector> delegate;

- (IBAction)addEntity:(id)sender;

- (void)reloadData;

@end

@protocol EntitySelector <NSObject>
@optional

- (void)entityWasSelected:(Entity *)entity;

@end
