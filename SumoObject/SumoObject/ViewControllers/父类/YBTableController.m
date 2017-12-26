//
//  YBTableController.m
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBTableController.h"
#import "YPH_NavigationController.h"


#import "YBFirstViewController.h"
#import "YBSecondViewController.h"

@interface YBTableController ()

@end

@implementation YBTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    YBFirstViewController *first = [[YBFirstViewController alloc]init];
    YBSecondViewController * second = [[YBSecondViewController alloc]init];
    
    [self setChildVC:first title:@"首页" image:@"shouye" selectedImage:@"sy"];
    [self setChildVC:second title:@"分类" image:@"fenlei" selectedImage:@"fl"];
    
    
    
}

- (void) setChildVC:(UIViewController *)childVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *) selectedImage {
    childVC.tabBarItem.title = title;
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blackColor];
    dict[NSFontAttributeName] = Font_YB_Size(10);
    [childVC.tabBarItem setTitleTextAttributes:dict forState:UIControlStateNormal];
    
    
    NSMutableDictionary *selectDict = [NSMutableDictionary dictionary];
    selectDict[NSForegroundColorAttributeName] = KUI_YB_ColorFontMain;
    selectDict[NSFontAttributeName] = [UIFont systemFontOfSize:10];
    [childVC.tabBarItem setTitleTextAttributes:selectDict forState:UIControlStateSelected];
    
    childVC.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    YPH_NavigationController *nav = [[YPH_NavigationController alloc] initWithRootViewController:childVC];
    
    [self addChildViewController:nav];
}


- (void)animationWithIndex:(NSInteger) index {
    
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    
    CABasicAnimation *pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.9];
    pulse.toValue= [NSNumber numberWithFloat:1.1];
    
    [[tabbarbuttonArray[index] layer] addAnimation:pulse forKey:nil];
    
}

@end
