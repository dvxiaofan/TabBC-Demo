//
//  YKTwoViewController.m
//  TabBC-Demo
//
//  Created by xiaofan on 16/5/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKTwoViewController.h"

@interface YKTwoViewController ()

@end

@implementation YKTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 单独设置导航栏标题（默认和视图控制器标题一样）
    self.navigationItem.title = @"I'm TWO";
    
    self.view.backgroundColor = [UIColor blueColor];
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
