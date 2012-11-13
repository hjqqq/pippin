//
//  GUIScreen.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GUIScreen : NSObject
{
}

@property (strong, nonatomic) NSString *name;

- (id)initWithDictionary:(NSDictionary *)dictionary;

@end

