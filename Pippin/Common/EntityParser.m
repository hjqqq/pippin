//
//  EntityParser.m
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EntityParser.h"

@implementation EntityParser

+ (void)parse:(NSArray *)entityArray entityParsed:(void (^)( Entity *entity ) )entityParsedBlock;
{
	if( entityArray == nil )
	{
		// Error
	}
	
	for( id entityDict in entityArray )
	{
		NSString *type = [entityDict objectForKey:@"type"];
		if( type == nil )
		{
			// Error, require a type
		}
		
		Class entityClass = NSClassFromString( type );
		Entity *entity = [[entityClass alloc] initWithDictionary:entityDict];
		entityParsedBlock( entity );
	}
}

@end
