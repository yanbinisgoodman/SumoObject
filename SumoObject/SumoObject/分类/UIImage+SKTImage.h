//
//  UIImage+SKTImage.h
//  ImageTest
//
//  Created by cirelir on 2018/1/22.
//  Copyright © 2018年 cirelir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SKTImage)

+(UIImage *)fastGetImageWithImageNamed:(NSString *)imageName withCache:(BOOL) cached;

@end
