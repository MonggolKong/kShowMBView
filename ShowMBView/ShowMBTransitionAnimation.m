//
//  ShowMBTransitionAnimation.m
//  KShowMBView
//
//  Created by Kong on 16/4/8.
//  Copyright © 2016年 lq. All rights reserved.
//

#import "ShowMBTransitionAnimation.h"

@interface ShowMBTransitionAnimation()

@property (nonatomic, assign)ShowMBTransitionAnimationType transitionAnimationType;

@end

@implementation ShowMBTransitionAnimation


- (instancetype)initWithTransitionWithType:(ShowMBTransitionAnimationType)type
{
    if (self = [super init]) {
        _transitionAnimationType = type;
    }
    return self;
}

+ (instancetype)transitionWithType:(ShowMBTransitionAnimationType)type
{
    return [[self alloc] initWithTransitionWithType:type];
}

#pragma mark - ShowMBTransitionAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.transitionTime?self.transitionTime:0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    /**
     *  这里分为Present And Dismisss
     */
    if (self.transitionAnimationType == ShowMBTransitionAnimationPresentType) {
        [self animatePresentTransitionContext:transitionContext];
    }else if (self.transitionAnimationType == ShowMBTransitionAnimationDismissType){
        [self animateDismissTransitionContext:transitionContext];
    }
}

- (void)animatePresentTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    toViewController.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 400);
    UIView *tempView = [fromViewController.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame   = fromViewController.view.frame;
    fromViewController.view.hidden = YES;
    [containerView addSubview:tempView];
    [containerView.window addSubview:toViewController.view];
    CATransform3D t1 = CATransform3DIdentity;
    t1.m34 = 1.0/-900;
    t1 = CATransform3DScale(t1, 0.92, 0.92, 1);
    t1 = CATransform3DRotate(t1, 15.0 * M_PI/180.0, 1 , 0, 0);
    [tempView.layer setTransform:t1];
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [tempView.layer setTransform:CATransform3DMakeScale(0.92, 0.92, 1)];
        toViewController.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 400, [UIScreen mainScreen].bounds.size.width, 400);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}


- (void)animateDismissTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *containerView = [transitionContext containerView];
    UIView *tempView     = [containerView.subviews firstObject];
    fromViewController.view.hidden = YES;
    toViewController.view.hidden = YES;
    [containerView addSubview:tempView];
    [containerView addSubview:toViewController.view];
    CATransform3D t2 = CATransform3DIdentity;
    t2.m34 = 1.0/-900;
    //绕x轴旋转
    t2 = CATransform3DRotate(t2, 15.0 * M_PI/180.0, 1 , 0, 0);
    tempView.layer.transform = t2;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [tempView.layer setTransform:CATransform3DMakeScale(100/95, 100/95, 1)];
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        toViewController.view.hidden = NO;
        [tempView removeFromSuperview];
    }];
}


@end
