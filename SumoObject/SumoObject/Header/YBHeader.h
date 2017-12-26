//
//  YBHeader.h
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#ifndef YBHeader_h
#define YBHeader_h

//颜色设置
#define FUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define KUI_YB_ColorFontNormal        FUIColorFromRGB(0x989898) // 灰
#define KUI_YB_ColorFont313131        FUIColorFromRGB(0x666666) // 黑
#define KUI_YB_ColorFontMain          FUIColorFromRGB(0xC9002B) // 橙
#define KUI_YB_ColorLine              FUIColorFromRGB(0xDCDCDC) //线条

//屏幕尺寸
#define KUI_YB_ScreenWidth [UIScreen mainScreen].bounds.size.width
#define KUI_YB_ScreenHeight [UIScreen mainScreen].bounds.size.height
#define kWidth_YB_Rate KUI_YB_ScreenWidth/375
#define kHeight_YB_Rate KUI_YB_ScreenHeight/667


#define Font_YB_Size(size) [UIFont systemFontOfSize:size*kWidth_YB_Rate];

#define DEVICE_IS_IPHONE_x ([UIScreen mainScreen].bounds.size.height == 812)
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define KStateNavBar_YB_height88 DEVICE_IS_IPHONE_x ? 44.f : 64.f
#define KNavBar_YB_height34 DEVICE_IS_IPHONE_x ? 34.f : 0.f


#endif /* YBHeader_h */
