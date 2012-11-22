//
//  EditorWindow.m
//  Pippin
//
//  Created by Mark Stultz on 11/15/12.
//  Copyright (c) 2012 Mark Stultz. All rights reserved.
//

#import "EditorWindow.h"
#import "EditorMainView.h"
#import "EntityEditor.h"
#import "MacOpenGLView.h"
#import "OpenGLRenderer.h"
#import "Game.h"
#import "Entity.h"

@implementation EditorWindow

@synthesize game;
@synthesize sourceView;
@synthesize mainView;
@synthesize entityEditor;
@synthesize selectedEntity;

- (void)windowDidLoad;
{
	self.sourceView = [[EditorSourceView alloc] initWithNibName:@"EditorSourceView" bundle:nil];
	[self.sourceView loadView];
	self.sourceView.delegate = self;

	self.mainView = [[EditorMainView alloc] initWithNibName:@"EditorMainView" bundle:nil];
	[self.mainView loadView];
		
	self.entityEditor = [[EntityEditor alloc] initWithNibName:@"EntityEditor" bundle:nil];
	[self.entityEditor loadView];
	
	[self.entityEditor.view setTranslatesAutoresizingMaskIntoConstraints:NO];
	
	[[self.splitView.subviews objectAtIndex:0] addSubview:self.sourceView.view];
	[[self.splitView.subviews objectAtIndex:1] addSubview:self.mainView.view];

	[self.mainView.detailView addSubview:self.entityEditor.view];

	[self.mainView.detailView addConstraint:
		[NSLayoutConstraint constraintWithItem:self.entityEditor.view
			attribute:NSLayoutAttributeWidth
			relatedBy:NSLayoutRelationEqual
			toItem:self.mainView.detailView
			attribute:NSLayoutAttributeWidth
			multiplier:1.0f
			constant:0]];
	
		[self.mainView.detailView addConstraint:
		[NSLayoutConstraint constraintWithItem:self.entityEditor.view
			attribute:NSLayoutAttributeHeight
			relatedBy:NSLayoutRelationEqual
			toItem:self.mainView.detailView
			attribute:NSLayoutAttributeHeight
			multiplier:1.0f
			constant:0]];
	
	[self performSelectorOnMainThread:@selector(initializeGame:) withObject:self waitUntilDone:NO];
}

- (void)initializeGame:(id)sender;
{
	CGSize size = CGSizeMake( 800.0f, 600.0f );
	self.game = [[Game alloc] initWithViewportSize:GLKVector2Make( size.width, size.height )];
	self.mainView.glView.renderer.game = self.game;
	
	[self.sourceView reloadData];
}

#pragma mark NSWindowDelegate

- (void)windowDidResize:(NSNotification *)notification;
{
	
}

#pragma mark EntitySelector

- (void)entityWasSelected:(Entity *)entity;
{
	self.selectedEntity = entity;
	self.entityEditor.entity = entity;
}

@end
