//
//  Game.h
//  Pippin
//
//  Created by Mark Stultz on 10/30/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Scene;

@interface Game : NSObject
{
	Scene *_scene;
}

- (void)draw;

@end
