//
//  YBToolModel.h
//  SumoObject
//
//  Created by yan on 2017/11/26.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YBToolModel : NSObject


/**
 传入的controller 用于是否设置加载动画的
 */
@property (nonatomic, retain) UIViewController * _Nullable controller;

/**
 * GET 方法请求
 * path 请求路径
 * params 请求方法的参数
 * responseHandler 获取数据的返回操作
 */
-(void)GETWithPath:(NSString *_Nullable)path andParams:(NSDictionary *_Nullable)params responseHandler:(void(^_Nullable)(NSDictionary * _Nullable resultDict))responseHandler;

/**
 异步数据请求

 @param path URL
 @param callBackBlock 参数字典
 */
+(void)createAsynchronousRequestWithPath:(NSString *_Nullable)path andCallBlock:(void(^ _Nullable)(NSDictionary * _Nullable resultDict))callBackBlock;


/**
 判断是否联网

 @return YES 联网 NO未联网
 */
+(BOOL) connectedToNetwork;


/**
 改变Label上A字符串中B字符串的颜色和大小

 @param titleStr A字符串
 @param numberStr B字符串
 @param fontSize 设置B字符串的大小(+适配)
 @param color 设置B字符串的颜色
 @return 返回Label富文本
 */
+(NSMutableAttributedString *_Nullable)attrStrFrom:(NSString *_Nullable)titleStr numberStr:(NSString *_Nullable)numberStr FontSize:(NSInteger)fontSize FontColor:(UIColor *_Nullable)color;


/**
 返回时间戳

 @param timestamp 时间的字符串
 @param format 返回的格式
 @return 时间
 */
+(NSString *_Nullable)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *_Nullable)format;



@end
