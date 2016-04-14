//
//  ShowMBViewController.h
//  KShowMBView
//
//  Created by Kong on 16/4/8.
//  Copyright © 2016年 lq. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ShowMBViewControllerDelegate <NSObject>

- (void)showMBViewControllerCancelActionDelegate;

@end

@interface ShowMBViewController : UIViewController

@property (nonatomic, weak)id<ShowMBViewControllerDelegate>delegate;

@end
