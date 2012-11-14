//
//  GUIScreen.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camera;
@class Entity;

@interface GUIScreen : NSObject
{
}

@property (strong, nonatomic) NSString *name;

- (id)initWithContentsOfFile:(NSString *)path;

- (Entity *)traceInput:(GLKVector2)position;
- (void)renderWithCamera:(Camera *)camera;

@end

