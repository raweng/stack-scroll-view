//
//  SlidingViewAppDelegate.h
//  SlidingView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 Rêve Interiors . All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface SlidingViewAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	RootViewController *rootViewController;
}

+ (SlidingViewAppDelegate *) instance;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;

@end

