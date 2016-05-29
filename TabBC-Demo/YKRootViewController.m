//
//  YKRootViewController.m
//  TabBC-Demo
//
//  Created by xiaofan on 16/5/28.
//  Copyright © 2016年 xiaofan. All rights reserved.
//

#import "YKRootViewController.h"
#import "YKOneViewController.h"
#import "YKTwoViewController.h"
#import "YKThreeViewController.h"
#import "YKFourViewController.h"


#define SCREEN [UIScreen mainScreen].bounds.size

@interface YKRootViewController ()

@end

@implementation YKRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self initViewController];
    
}

- (void)initViewController {
    
    // 分别创建各个视图控制器并附带标题及TabBar两种状态下的图片
    YKOneViewController *VC1 = [[YKOneViewController alloc] init];
    [self addChildWithController:VC1
                        title:@"ONE"
                 normalImageName:@"tabbar_one"
                 selectedImgName:@"tabbar_one_selected"];
    
    YKTwoViewController *VC2 = [[YKTwoViewController alloc] init];
    [self addChildWithController:VC2
                        title:@"TWO"
                 normalImageName:@"tabbar_two"
                 selectedImgName:@"tabbar_two_selected"];
    
    YKThreeViewController *VC3 = [[YKThreeViewController alloc] init];
    [self addChildWithController:VC3
                        title:@"THREE"
                 normalImageName:@"tabbar_three"
                 selectedImgName:@"tabbar_three_selected"];
    
    YKFourViewController *VC4 = [[YKFourViewController alloc] init];
    [self addChildWithController:VC4
                           title:@"FOUR"
                 normalImageName:@"tabbar_four"
                 selectedImgName:@"tabbar_four_selected"];
    
    // 保存视图控制器数组
    NSArray *vcArray = @[VC1, VC2, VC3, VC4];
    // 保存标签控制器控制的导航控制器可变数组
    NSMutableArray *tabBarArray = [[NSMutableArray alloc] initWithCapacity:vcArray.count];
    // 构建导航控制器
    for (int i = 0; i < vcArray.count; i++) {
        UINavigationController *nav = [[UINavigationController alloc]
                                       initWithRootViewController:vcArray[i]];
        
        [tabBarArray addObject:nav];
    }
    // 将保存有导航控制器的tabBarArray设置为视图的viewControllers
    self.viewControllers = tabBarArray;
}

#pragma mark - 给tabBar增加子视图方法
- (void)addChildWithController:(UIViewController *)childVC
                         title:(NSString *)title
               normalImageName:(NSString *)normalImgName
               selectedImgName:(NSString *)selectedImgName {
    
    childVC.title = title;
    
    // 修改默认字体颜色
    NSMutableDictionary *dicNormal = [NSMutableDictionary dictionary];
    dicNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    [childVC.tabBarItem setTitleTextAttributes:dicNormal
                                      forState:UIControlStateNormal];
    
    // 修改点击选中后的字体颜色
    NSMutableDictionary *dicSelect = [NSMutableDictionary dictionary];
    dicSelect[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVC.tabBarItem setTitleTextAttributes:dicSelect
                                      forState:UIControlStateSelected];
    
    // 设置默认状态下图片
    childVC.tabBarItem.image = [UIImage imageNamed:normalImgName];
    
    // 设置点击选中状态下图片 单独设置不会成功，因为tab控制器会自动渲染选中状态下的图片
    UIImage *selectedImage = [UIImage imageNamed:selectedImgName];
    // 阻止tab控制器进行渲染图片
    selectedImage = [selectedImage
                     imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = selectedImage;
    
}

@end











