//
//  YBSecondViewController.m
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBSecondViewController.h"
#import "YBFirstViewController.h"
@interface YBSecondViewController (){
    YBFirstViewController*first;
}

@end

@implementation YBSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"123";
    
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(FUnAction:) name:@"yanbin" object:nil];
    
    UIImageView * iamge = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 200, 200)];
    iamge.image = [UIImage fastGetImageWithImageNamed:@"luyin_ly.png" withCache:YES];
    [self.view addSubview:iamge];
    
    UIButton * button = [UIButton new];
    button.frame = CGRectMake(100, 100, 50, 50);
    button.backgroundColor = KUI_YB_ColorLine;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
    //KVO
    first = [[YBFirstViewController alloc]init];
    [first addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    
    // Do any additional setup after loading the view.
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    if ([keyPath isEqualToString:@"count"]) {
        NSLog(@" %@ ",[change valueForKey:@"old"]);
        
    }
    
}

-(void)buttonAction:(UIButton *)bun{
    first.count = first.count + 1;
//    YBFirstViewController * cc = [[YBFirstViewController alloc]init];
//    [self.navigationController pushViewController:cc animated:YES];
//    [self presentViewController:cc animated:YES completion:nil];
//    [self dismissViewControllerAnimated:YES completion:nil];
    
//    [[NSNotificationCenter defaultCenter]postNotificationName:@"yanbin" object:@"123"];
     
}

-(void)FUnAction:(NSNotification *)notif{
    if ([notif.object isEqualToString:@"123"]) {
        self.title = @"yan";
    }else{
        self.title = @"bin";
    }
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    /* 3.移除KVO */
    [self removeObserver:self forKeyPath:@"count" context:nil];
}
@end
