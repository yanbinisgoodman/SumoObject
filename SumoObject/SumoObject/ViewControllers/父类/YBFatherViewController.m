//
//  YBFatherViewController.m
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBFatherViewController.h"

@interface YBFatherViewController ()

@end

@implementation YBFatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.hidden = YES;
    
}

-(void)setNOTop:(NSString *)title andFanhuijian:(UIImage *)leftImage andrightImage:(UIImage *)rightImage{
   
    _topView = [UIView new];
//    _topView.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(KNavBar_YB_height34);
        make.left.right.equalTo(self.view).with.offset(0);
        make.height.offset(KStateNavBar_YB_height88);
    }];
    
    if (leftImage != nil) {
        UIButton * leftButton1 = [UIButton new];
        leftButton1.backgroundColor = [UIColor clearColor];
        [leftButton1 addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:leftButton1];
        [leftButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(_topView).with.offset(0);
            make.width.offset(60);
        }];
        
        UIButton * _leftButton = [UIButton new];
        [_leftButton addTarget:self action:@selector(leftClick) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setImage:leftImage forState:UIControlStateNormal];
        [_topView addSubview:_leftButton];
        [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(leftButton1);
            make.top.equalTo(_topView).offset(25);
            make.width.offset(33);
            make.height.offset(33);
        }];
    }
    
    if (rightImage != nil) {
        UIButton * rightButton1 = [UIButton new];
        rightButton1.backgroundColor = [UIColor clearColor];
        [rightButton1 addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [_topView addSubview:rightButton1];
        [rightButton1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(_topView).with.offset(0);
            make.width.offset(60);
        }];
        
        UIButton * rightButton = [UIButton new];
        [rightButton addTarget:self action:@selector(rightClick) forControlEvents:UIControlEventTouchUpInside];
        [rightButton setImage:rightImage forState:UIControlStateNormal];
        [_topView addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(rightButton1);
            make.top.equalTo(_topView).offset(25);
            make.width.offset(33);
            make.height.offset(33);
        }];
    }
    
    if (title != nil) {
        UILabel * titleLable = [UILabel new];
        titleLable.text = title;
        titleLable.textColor = KUI_YB_ColorFont313131;
        titleLable.font = Font_YB_Size(17);
        titleLable.adjustsFontSizeToFitWidth = YES;
        titleLable.textAlignment = NSTextAlignmentCenter;
        [_topView addSubview:titleLable];
        [titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_topView);
            make.top.equalTo(_topView).with.offset(25);
            make.height.mas_offset(34);
//            make.width.mas_offset(200*kWidth_YB_Rate);
        }];
    }else{
        UIImageView *imageView = [UIImageView new];
        imageView.image = [UIImage imageNamed:@"sy"];
        [_topView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_topView);
            make.top.equalTo(_topView).with.offset(20);
            make.width.mas_offset(42);
            make.height.mas_offset(42);
        }];
    }
    
    _lineLable = [UILabel new];
    _lineLable.backgroundColor = KUI_YB_ColorLine;
    [_topView addSubview:_lineLable];
    [_lineLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(_topView).with.offset(0);
        make.height.offset(1);
    }];
}

-(void)leftClick{
    NSLog(@"子类需要重写这个方法 左边按钮");
}
-(void)rightClick{
    NSLog(@"子类需要重写这个方法 右边按钮");
}

//横屏竖屏
-(void)viewWillLayoutSubviews{
    
    [self _shouldRotateToOrientation:(UIDeviceOrientation)[UIApplication sharedApplication].statusBarOrientation];
}

-(void)_shouldRotateToOrientation:(UIDeviceOrientation)orientation {
    if (orientation == UIDeviceOrientationPortrait ||orientation ==
        UIDeviceOrientationPortraitUpsideDown) { // 竖屏

    } else { // 横屏
    }
}
@end
