//
//  RootView.h
//  StackScrollView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 raw engineering . All rights reserved.
//

#import <UIKit/UIKit.h>


@class MenuViewController;
@class StackScrollViewController;

@class UIViewExt;

@interface RootViewController : UIViewController {
	UIViewExt* rootView;
	UIView* leftMenuView;
	UIView* rightSlideView;
	
	MenuViewController* menuViewController;
	StackScrollViewController* stackScrollViewController;
	
}

@property (nonatomic, retain) MenuViewController* menuViewController;
@property (nonatomic, retain) StackScrollViewController* stackScrollViewController;


@end
