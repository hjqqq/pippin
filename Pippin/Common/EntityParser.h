//
//  EntityParser.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Entity;

@interface EntityParser : NSObject

+ (void)parse:(NSArray *)entityArray entityParsed:(void (^)( Entity *entity ) )entityParsedBlock;

@end
