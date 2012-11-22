//
//  EntityEditor.h
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Entity;

@interface EntityEditor : NSViewController <NSTableViewDataSource, NSTableViewDelegate>
{
}

@property (strong, nonatomic) Entity *entity;
@property (weak) IBOutlet NSTableView *tableView;

@end
