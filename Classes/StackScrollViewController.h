//
//  StackScrollViewController.h
//  StackScrollView
//
//  Created by Reefaq Mohammed Mac Pro on 5/10/11.
//  Copyright 2011 raw engineering. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface StackScrollViewController :  UIViewController <UIScrollViewDelegate, UIGestureRecognizerDelegate> {
	
	UIView* slideViews;
	UIView* borderViews;
	
	UIView* viewAtLeft;
	UIView* viewAtRight;
	UIView* viewAtLeft2;
	UIView* viewAtRight2;	
	UIView* viewAtRightAtTouchBegan;
	UIView* viewAtLeftAtTouchBegan;
	
	NSMutableArray* viewControllersStack;
	
	NSString* dragDirection;
	
	CGFloat viewXPosition;		
	CGFloat displacementPosition;
	CGFloat lastTouchPoint;
	CGFloat slideStartPosition;
	
	CGPoint positionOfViewAtRightAtTouchBegan;
	CGPoint positionOfViewAtLeftAtTouchBegan;
	
	

}

- (void) addViewInSlider:(UIViewController*)controller invokeByController:(UIViewController*)invokeByController isStackStartView:(BOOL)isStackStartView;
- (void)bounceBack:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context;

@property (nonatomic, retain) UIView* slideViews;
@property (nonatomic, retain) UIView* borderViews;
@property (nonatomic, assign) CGFloat slideStartPosition;
@property (nonatomic, assign) NSMutableArray* viewControllersStack;



@end
