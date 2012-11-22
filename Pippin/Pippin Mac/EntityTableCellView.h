//
//  EntityTableCellView.h
//  Pippin
//
//  Created by Mark Stultz on 11/21/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Entity;

@interface EntityTableCellView : NSTableCellView
{
}

@property (strong, nonatomic) Entity *entity;
@property (weak) IBOutlet NSTextField *nameTextField;
@property (weak) IBOutlet NSTextField *xPositionTextField;
@property (weak) IBOutlet NSTextField *yPositionTextField;
@property (weak) IBOutlet NSTextField *xSizeTextField;
@property (weak) IBOutlet NSTextField *ySizeTextField;

@end
