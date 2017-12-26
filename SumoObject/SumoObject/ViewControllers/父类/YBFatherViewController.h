//
//  YBFatherViewController.h
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YBFatherViewController : UIViewController


@property(nonatomic,retain,readonly)UIView * topView;
@property(nonatomic,retain)UILabel * lineLable;


-(void)setNOTop:(NSString *)title andFanhuijian:(UIImage *)leftImage andrightImage:(UIImage *)rightImage;



@end
