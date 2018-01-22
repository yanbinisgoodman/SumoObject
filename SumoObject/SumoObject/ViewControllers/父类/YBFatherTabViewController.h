//
//  YBFatherTabViewController.h
//  SumoObject
//
//  Created by yan on 2018/1/15.
//  Copyright © 2018年 疏陌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBFatherTabViewController : UIViewController

@property(nonatomic,retain)NSArray * dataSource;

@property(nonatomic,copy)void (^tableViewBlock)(NSInteger indexRow);
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end
