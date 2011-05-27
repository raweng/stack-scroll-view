/*
 This module is licenced under the BSD license.
 
 Copyright (C) 2011 by raw engineering <nikhil.jain (at) raweng (dot) com, reefaq.mohammed (at) raweng (dot) com>.
 
 All rights reserved.
 
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions
 are met:
 
 * Redistributions of source code must retain the above copyright
 notice, this list of conditions and the following disclaimer.
 
 * Redistributions in binary form must reproduce the above copyright
 notice, this list of conditions and the following disclaimer in the
 documentation and/or other materials provided with the distribution.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
//
//  RootView.m
//  StackScrollView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 raw engineering . All rights reserved.
//

#import "RootViewController.h"


#import "MenuViewController.h"
#import "StackScrollViewController.h"


@interface UIViewExt : UIView {} 
@end


@implementation UIViewExt
- (UIView *) hitTest: (CGPoint) pt withEvent: (UIEvent *) event 
{   
	
	UIView* viewToReturn=nil;
	CGPoint pointToReturn;
	
	UIView* uiRightView = (UIView*)[[self subviews] objectAtIndex:1];
	
	if ([[uiRightView subviews] objectAtIndex:0]) {
		
		UIView* uiStackScrollView = [[uiRightView subviews] objectAtIndex:0];	
		
		if ([[uiStackScrollView subviews] objectAtIndex:1]) {	 
			
			UIView* uiSlideView = [[uiStackScrollView subviews] objectAtIndex:1];	
			
			for (UIView* subView in [uiSlideView subviews]) {
				CGPoint point  = [subView convertPoint:pt fromView:self];
				if ([subView pointInside:point withEvent:event]) {
					viewToReturn = subView;
					pointToReturn = point;
				}
				
			}
		}
		
	}
	
	if(viewToReturn != nil) {
		return [viewToReturn hitTest:pointToReturn withEvent:event];		
	}
	
	return [super hitTest:pt withEvent:event];	
	
}

@end

@implementation RootViewController
@synthesize menuViewController, stackScrollViewController;

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {		
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	rootView = [[UIViewExt alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
	rootView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
	[rootView setBackgroundColor:[UIColor clearColor]];
	
	leftMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, self.view.frame.size.height)];
	leftMenuView.autoresizingMask = UIViewAutoresizingFlexibleHeight;	
	menuViewController = [[MenuViewController alloc] initWithFrame:CGRectMake(0, 0, leftMenuView.frame.size.width, leftMenuView.frame.size.height)];
	[menuViewController.view setBackgroundColor:[UIColor clearColor]];
	[menuViewController viewWillAppear:FALSE];
	[menuViewController viewDidAppear:FALSE];
	[leftMenuView addSubview:menuViewController.view];
	
	rightSlideView = [[UIView alloc] initWithFrame:CGRectMake(leftMenuView.frame.size.width, 0, rootView.frame.size.width - leftMenuView.frame.size.width, rootView.frame.size.height)];
	rightSlideView.autoresizingMask = UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight;
	stackScrollViewController = [[StackScrollViewController alloc] init];	
	[stackScrollViewController.view setFrame:CGRectMake(0, 0, rightSlideView.frame.size.width, rightSlideView.frame.size.height)];
	[stackScrollViewController.view setAutoresizingMask:UIViewAutoresizingFlexibleWidth + UIViewAutoresizingFlexibleHeight];
	[stackScrollViewController viewWillAppear:FALSE];
	[stackScrollViewController viewDidAppear:FALSE];
	[rightSlideView addSubview:stackScrollViewController.view];
	
	[rootView addSubview:leftMenuView];
	[rootView addSubview:rightSlideView];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage: [UIImage imageNamed:@"backgroundImage_repeat.png"]]];
	[self.view addSubview:rootView];
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	[menuViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
	[stackScrollViewController didRotateFromInterfaceOrientation:fromInterfaceOrientation];
}

-(void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
	[menuViewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
	[stackScrollViewController willAnimateRotationToInterfaceOrientation:toInterfaceOrientation duration:duration];
}	
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}


- (void)dealloc {
    [super dealloc];
}

@end
