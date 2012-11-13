//
//  JSONParser.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParser : NSObject

+ (void)parseContentsOfFile:(NSString *)path jsonObjectParsed:(void (^)( NSDictionary *dict ) )jsonObjectParsedBlock;

@end
