//
//  YBFatherTabViewController.m
//  SumoObject
//
//  Created by yan on 2018/1/15.
//  Copyright © 2018年 疏陌. All rights reserved.
//

#import "YBFatherTabViewController.h"

@interface YBFatherTabViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain) UITableView * tableView;

@end

@implementation YBFatherTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    
    cell.imageView.image =     [UIImage imageNamed:@"luyin_ly"];
    
//    [UIImage fastGetImageWithImageNamed:@"luyin_ly.png" withCache:YES];

    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (self.tableViewBlock) {
        self.tableViewBlock(indexPath.row);
    }
    
}


@end
