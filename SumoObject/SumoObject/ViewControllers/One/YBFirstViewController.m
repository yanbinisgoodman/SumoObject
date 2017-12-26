//
//  YBFirstViewController.m
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBFirstViewController.h"

@interface YBFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,copy)NSArray * dataSource;
@property(nonatomic,retain) UITableView * tableView;
@end

@implementation YBFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNOTop:@"SumoObject" andFanhuijian:nil andrightImage:nil];
    
    _dataSource = [NSArray arrayWithObjects:@"图片",@"视频",@"音频",@"地图",@"线程",@"控件", nil];
    
    [self.view addSubview:[self tableView]];
    
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, KStateNavBar_YB_height88, KUI_YB_ScreenWidth, KUI_YB_ScreenHeight-(KNavBar_YB_height34)) style:UITableViewStylePlain];
        _tableView.backgroundColor=[UIColor groupTableViewBackgroundColor];
        _tableView.showsVerticalScrollIndicator=NO;
        _tableView.dataSource=self;
        _tableView.delegate=self;
        _tableView.estimatedRowHeight = 0.f;
        _tableView.estimatedSectionHeaderHeight = 0.f;
        _tableView.estimatedSectionFooterHeight = 0.f;
        _tableView.tableFooterView = [[UIView alloc] init];
    }
   
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * identifier = @"identifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = _dataSource[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"luyin_ly"];
    return cell;
}



@end
