//
//  RootView.h
//  SlidingView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 Rêve Interiors . All rights reserved.
//

#import <UIKit/UIKit.h>


@class MenuViewController;
@class SlideViewController;

@class UIViewExt;

@interface RootViewController : UIViewController {
	UIViewExt* rootView;
	UIView* leftMenuView;
	UIView* rightSlideView;
	
	MenuViewController* menuViewController;
	SlideViewController* slideViewController;
	
}

@property (nonatomic, retain) MenuViewController* menuViewController;
@property (nonatomic, retain) SlideViewController* slideViewController;


@end
