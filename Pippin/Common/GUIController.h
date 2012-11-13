//
//  GUIController.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EntityController.h"

@interface GUIController : NSObject
{
}

+ (GUIController *)sharedController;
+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;

- (id)initWithContentsOfFile:(NSString *)path;

@end
