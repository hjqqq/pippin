//
//  EntityController.h
//  Pippin
//
//  Created by Mark Stultz on 11/5/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entity;

@interface EntityController : NSObject
{
}

+ (EntityController *)sharedController;
+ (id)initSharedControllerWithContentsOfFile:(NSString *)path;

- (id)initWithContentsOfFile:(NSString *)path;

- (Entity *)entityNamed:(NSString *)name;

@end
