//
//  GUIScreen.h
//  Pippin
//
//  Created by Mark Stultz on 11/12/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Camera;

@interface GUIScreen : NSObject
{
}

@property (strong, nonatomic) NSString *name;

- (id)initWithContentsOfFile:(NSString *)path;

- (void)renderWithCamera:(Camera *)camera;

@end

