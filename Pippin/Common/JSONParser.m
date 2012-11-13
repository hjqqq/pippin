//
//  JSONParser.m
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "JSONParser.h"

@implementation JSONParser

+ (void)parseContentsOfFile:(NSString *)path jsonObjectParsed:(void (^)( NSDictionary *dict ) )jsonObjectParsedBlock;
{
	NSString *bundlePath = [[NSBundle mainBundle] pathForResource:path ofType:nil];
	NSData *fileData = [NSData dataWithContentsOfFile:bundlePath];
	NSError *error = nil;
	
	id jsonData = [NSJSONSerialization JSONObjectWithData:fileData options:0 error:&error];
	if( ![jsonData isKindOfClass:[NSDictionary class]] )
	{
		// Error
	}

	jsonObjectParsedBlock( jsonData );
}

@end
