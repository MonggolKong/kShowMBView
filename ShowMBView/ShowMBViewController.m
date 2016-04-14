//
//  ShowMBViewController.m
//  KShowMBView
//
//  Created by Kong on 16/4/8.
//  Copyright © 2016年 lq. All rights reserved.
//

#import "ShowMBViewController.h"

@interface ShowMBViewController ()

@end

@implementation ShowMBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 400)];
    imageView.image = [UIImage imageNamed:@"popView"];
    [self.view addSubview:imageView];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(showMBViewControllerCancelActionDelegate)]) {
        [self.delegate showMBViewControllerCancelActionDelegate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
