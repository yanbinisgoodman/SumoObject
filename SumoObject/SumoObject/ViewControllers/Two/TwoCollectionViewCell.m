//
//  TwoCollectionViewCell.m
//  SumoObject
//
//  Created by yan on 2018/5/24.
//  Copyright © 2018年 疏陌. All rights reserved.
//

#import "TwoCollectionViewCell.h"

@implementation TwoCollectionViewCell

- (void)awakeFromNib {
    
    self.cellBtn.backgroundColor = [UIColor redColor];
    
      [super awakeFromNib];
    // Initialization code
}
- (IBAction)buttonAction:(id)sender {
    NSLog(@"11");
}

@end
