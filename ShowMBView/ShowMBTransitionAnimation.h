//
//  ShowMBTransitionAnimation.h
//  KShowMBView
//
//  Created by Kong on 16/4/8.
//  Copyright © 2016年 lq. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ShowMBTransitionAnimationPresentType,
    ShowMBTransitionAnimationDismissType,
} ShowMBTransitionAnimationType;

@interface ShowMBTransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) CGFloat transitionTime;

@property (nonatomic, assign) CGFloat toViewHeight;


+ (instancetype)transitionWithType:(ShowMBTransitionAnimationType)type;


- (instancetype)initWithTransitionWithType:(ShowMBTransitionAnimationType)type;

@end
