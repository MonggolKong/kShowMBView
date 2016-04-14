//
//  ViewController.m
//  KShowMBView
//
//  Created by Kong on 16/4/8.
//  Copyright © 2016年 lq. All rights reserved.
//

#import "ViewController.h"
#import "ShowMBViewController.h"
#import "ShowMBTransitionAnimation.h"

@interface ViewController ()<UIViewControllerTransitioningDelegate,ShowMBViewControllerDelegate>

@property (nonatomic, strong) UIImageView *backImageView;

@property (nonatomic, strong)ShowMBTransitionAnimation *transitionAnimation;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self buildBackgroundImageView];
    
    [self buildSkipButton];
}

- (void)buildBackgroundImageView
{
    self.backImageView                        = [[UIImageView alloc] initWithFrame:self.view.frame];
    self.backImageView.userInteractionEnabled = YES;
    self.backImageView.image                  = [UIImage imageNamed:@"backgroundImage"];
    [self.view addSubview:self.backImageView];
}

- (void)buildSkipButton
{
    UIButton *skipButton = [UIButton buttonWithType:UIButtonTypeCustom];
    skipButton.frame     = CGRectMake(0, 0, 100, 70);
    skipButton.center    = self.view.center;
    [skipButton setTitle:@"ClickButton" forState:UIControlStateNormal];
    [skipButton addTarget:self action:@selector(skipButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.backImageView addSubview:skipButton];
}

- (void)skipButtonAction
{
    ShowMBViewController *showMBVC = [[ShowMBViewController alloc] init];
    showMBVC.transitioningDelegate = self;
    showMBVC.delegate              = self;
    [self presentViewController:showMBVC animated:YES completion:nil];
}

- (void)showMBViewControllerCancelActionDelegate
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - TransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return [ShowMBTransitionAnimation transitionWithType:ShowMBTransitionAnimationPresentType];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [ShowMBTransitionAnimation transitionWithType:ShowMBTransitionAnimationDismissType];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
