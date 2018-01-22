//
//  CoolHudViewController.m
//  SumoObject
//
//  Created by yan on 2018/1/15.
//  Copyright © 2018年 疏陌. All rights reserved.
//

#import "CoolHudViewController.h"

@interface CoolHudViewController ()

@end

@implementation CoolHudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataSource = @[@"HUD"];
    // Do any additional setup after loading the view.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [LCCoolHUD showSuccess:@"提示成功" zoom:YES shadow:YES];
    YBFatherTabViewController *con = [[YBFatherTabViewController alloc]init];
    con.dataSource = @[@"提示成功",@"提示失败",@"提示成功",@"提示失败",@"加载中不能点Left",@"加载中能点Left"];
    con.tableViewBlock = ^(NSInteger indexRow) {
        
        switch (indexRow) {
            case 0:
                [LCCoolHUD showSuccess:@"提示成功" zoom:YES shadow:YES];
                break;
            case 1:
                [LCCoolHUD showFailure:@"提示失败" zoom:NO shadow:NO];
                break;
            case 2:
                [LCCoolHUD showSuccessOblong:@"提示成功" inView:self.view zoom:YES shadow:NO];
                break;
            case 3:
                [LCCoolHUD showFailureOblong:@"提示失败！" zoom:NO shadow:YES];

                break;
            case 4:
                [LCCoolHUD showLoading:@"加载中不能点Left"];
                [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(hideKeyWindowHUD) userInfo:nil repeats:NO];
                
                break;
            case 5:
                [LCCoolHUD showLoading:@"加载中能点Left" inView:self.view];
                 [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(hideInViewHUD) userInfo:nil repeats:NO];
                break;
                
                
            default:
                break;
        }
    };
    [self.navigationController pushViewController:con animated:YES];
    
}

- (void)hideKeyWindowHUD {
    
    [LCCoolHUD hideInKeyWindow];
}

- (void)hideInViewHUD {
    
    [LCCoolHUD hideInView:self.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
