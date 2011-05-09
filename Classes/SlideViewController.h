//
//  DetailViewController.h
//  SlidingView
//
//  Created by Reefaq on 2/24/11.
//  Copyright 2011 raw engineering . All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface SlideViewController : UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate> {
	
	UIView* slideViews;
	UIView* borderViews;
	
	UIView* viewAtLeft;
	UIView* viewAtRight;
	UIView* viewAtLeft2;
	UIView* viewAtRight2;	
	UIView* viewAtRightAtTouchBegan;
	UIView* viewAtLeftAtTouchBegan;
	
	NSMutableArray* viewControlersStack;
	
	NSString* dragDirection;

	CGFloat viewXPosition;		
	CGFloat displacementPosition;
	CGFloat lastTouchPoint;
	CGFloat slideStartPosition;

	CGPoint positionOfViewAtRightAtTouchBegan;
	CGPoint positionOfViewAtLeftAtTouchBegan;
	
	
}

- (void) addViewInSlider:(UIViewController*)controller invokeByController:(UIViewController*)invokeByController isSlideStartView:(BOOL)atFirstPosition;
- (void)bounceBack:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context;

@property (nonatomic, retain) UIView* slideViews;
@property (nonatomic, retain) UIView* borderViews;
@property (nonatomic, assign) CGFloat slideStartPosition;
@property (nonatomic, assign) NSMutableArray* viewControlersStack;


@end
