//
//  YBToolModel.m
//  SumoObject
//
//  Created by yan on 2017/11/26.
//  Copyright © 2017年 疏陌. All rights reserved.
//

#import "YBToolModel.h"
#import <arpa/inet.h> //判断联网的方法用的

@implementation YBToolModel



-(void)GETWithPath:(NSString *)path andParams:(NSDictionary *)params responseHandler:(void(^)(NSDictionary * resultDict))responseHandler {
//    if ([YPH_ToolModel connectedToNetwork]) {
//        NSString *urlStr;
//        if ([path hasPrefix:@"http://"]) {
//
//            urlStr = [NSString stringWithFormat:@"%@",path];
//            NSLog(@"******当前接口是测试接口******");
//
//        }else{
//            urlStr = [NSString stringWithFormat:@"%@%@",URL27,path];
//        }
//
//        _manager = [AFAppDotNetAPIClient sharedClient];
//
//
//
//        if (self.controller != nil) {
//            //添加Indicator
//            [[SCCatWaitingHUD sharedInstance] animateWithInteractionEnabled:YES];
//        }
//
//
//
//        //临时的api_key和secret
//        NSString * api_KEY = @"API_KEY_IPHONE_SHOUQU";
//        NSString * secret = @"API_SECRETKEY_IPHONE_SHOUQU";
//        //获取时间戳
//        NSString * timestamp = [self getTimeStamp];
//        //未加密的signature
//        NSString * unSecret = [NSString stringWithFormat:@"%@%@%@",api_KEY,secret,timestamp];
//        //经过MD5加密后的签名
//        NSString * signature = [self getSignture:unSecret];
//        NSMutableDictionary * paramters = [NSMutableDictionary dictionaryWithDictionary:params];
//        [paramters setObject:api_KEY forKey:@"apiKey"];
//        [paramters setObject:signature forKey:@"signature"];
//        [paramters setObject:timestamp forKey:@"timeStamp"];
//
//
//        [_manager GET:urlStr parameters:paramters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//            if (responseObject != nil) {
//                if (self.controller != nil) {
//                    [[SCCatWaitingHUD sharedInstance] stop];
//                }
//
//                if (responseHandler) {
//                    responseHandler(responseObject);
//                }
//            }
//
//        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//            NSLog(@"服务器异常");
//
//            if (self.controller != nil) {
//                //切换回主线程隐藏hud...
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [[SCCatWaitingHUD sharedInstance] stop];
//                });
//            }
//        }];
//    }else{
//
////        [[SCCatWaitingHUD sharedInstance] stop];
//        UIViewController *rootViewController = [[[UIApplication sharedApplication] keyWindow] rootViewController];
//        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"无网络连接" message:nil preferredStyle:UIAlertControllerStyleAlert];
//
//        UIAlertAction * cannel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//            [alert dismissViewControllerAnimated:YES completion:nil];
//        }];
//
//        UIAlertAction * login = [UIAlertAction actionWithTitle:@"去连接" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//
////            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
//
//            [[UIApplication sharedApplication]openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{@"2":@"1"} completionHandler:^(BOOL success) {
//                NSLog(@"打开成功");
//            }];
//
//        }];
//
//        [alert addAction:cannel];
//        [alert addAction:login];
//        [rootViewController presentViewController:alert animated:NO completion:nil];
//    }
}


+(void)createAsynchronousRequestWithPath:(NSString *_Nullable)path andCallBlock:(void(^ _Nullable)(NSDictionary * _Nullable resultDict))callBackBlock{
    NSURL *url = [NSURL URLWithString:path];
    NSURLSessionDataTask *dataTask = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            dispatch_sync(dispatch_get_main_queue(), ^{
                if (callBackBlock) {
                    callBackBlock(dict);
                }
            });
        }
    }];
    [dataTask resume];
}


+(BOOL) connectedToNetwork{
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags){
        printf("Error. Could not recover network reachability flags\n");
        return NO;
    }
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
}


+ (NSMutableAttributedString *)attrStrFrom:(NSString *)titleStr numberStr:(NSString *)numberStr FontSize:(NSInteger)fontSize FontColor:(UIColor *)color{
    NSMutableAttributedString *arrString = [[NSMutableAttributedString alloc]initWithString:titleStr];
    [arrString addAttributes:@{NSFontAttributeName:
                                   [UIFont systemFontOfSize:fontSize*kWidth_YB_Rate],
                                    NSForegroundColorAttributeName:color
                               }
                       range:[titleStr rangeOfString:numberStr]];
    
    return arrString;
}

+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; // （@"yyyy-MM-dd"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
}

@end
