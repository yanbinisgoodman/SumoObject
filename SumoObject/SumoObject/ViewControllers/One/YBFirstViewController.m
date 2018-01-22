//
//  YBFirstViewController.m
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBFirstViewController.h"
#import "VideoPlayerViewController.h"
#import "CoolHudViewController.h"

@interface YBFirstViewController ()
@end

@implementation YBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"sumo";
    self.dataSource = [NSArray arrayWithObjects:@"图片",@"视频",@"音频",@"地图",@"线程",@"控件", nil];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [LCCoolHUD showSuccessOblong:@"提示成功" inView:self.view zoom:YES shadow:NO];
    if ([self.dataSource[indexPath.row] isEqualToString:@"视频"]) {
        VideoPlayerViewController *video = [VideoPlayerViewController new];
        video.type                       = PlayerTypeOfNoNavigationBar;
        [self.navigationController pushViewController:video animated:YES];
    }
    
    if ([self.dataSource[indexPath.row] isEqualToString:@"控件"]) {
        CoolHudViewController * hud = [[CoolHudViewController alloc]init];
        [self.navigationController pushViewController:hud animated:YES];
    }

}



@end
