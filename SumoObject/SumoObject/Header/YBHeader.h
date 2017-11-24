//
//  YBHeader.h
//  SumoObject
//
//  Created by yan on 2017/11/25.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#ifndef YBHeader_h
#define YBHeader_h

////颜色设置
#define FUIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define KUIColorFontNormal        FUIColorFromRGB(0x989898) // 灰
#define KUIColorFont313131        FUIColorFromRGB(0x666666) // 黑
#define KUIColorFontMain          FUIColorFromRGB(0xC9002B) // 橙
#define KUIColorLine              FUIColorFromRGB(0xDCDCDC) //线条


#endif /* YBHeader_h */
