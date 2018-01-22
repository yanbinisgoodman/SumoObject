
//
//  UIImage+SKTImage.m
//  ImageTest
//
//  Created by cirelir on 2018/1/22.
//  Copyright © 2018年 cirelir. All rights reserved.
//

#import "UIImage+SKTImage.h"


@interface SKTCacheUtils : NSObject <NSCacheDelegate>

@property (retain, nonatomic) NSCache * cache;

@end

@implementation SKTCacheUtils

// 创建静态对象 防止外部访问
static SKTCacheUtils *_instance;

+(instancetype)shareUtils{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    });
    return _instance;
}

-(NSCache *)cache{
    if (!_cache) {
        _cache = [[NSCache alloc]init];
        _cache.delegate = self;
        _cache.countLimit = 0;
        _cache.totalCostLimit = 0;
    }
    return _cache;
}

-(void)setObjects:(id)object forKey:(NSString *)key{
    [self.cache setObject:object forKey:key];
}

-(id)objectForKey:(NSString *)key{
    return [self.cache objectForKey:key];
}

-(void)cache:(NSCache *)cache willEvictObject:(id)obj{
    
}

@end



@implementation UIImage (SKTImage)

+(UIImage *)fastGetImageWithImageNamed:(NSString *)imageName withCache:(BOOL) cached{
    SKTCacheUtils * cache = [SKTCacheUtils shareUtils];
    if ([cache objectForKey:imageName]) {
        UIImage * image = [cache objectForKey:imageName];
        return image;
    }
    
    NSString * imageExtions = @"png";
    NSArray * array = [imageName componentsSeparatedByString:@"."];
    NSString * imageNameStr = array.firstObject;
    if (array.count == 2) {
        imageExtions = array.lastObject;
    }
    
    NSString * path = [[NSBundle mainBundle] pathForResource:imageNameStr ofType:imageExtions];
    
    CFStringRef stringRef = (__bridge CFStringRef)path;
    
    CFURLRef urlRef = CFURLCreateWithFileSystemPath(NULL, stringRef, kCFURLPOSIXPathStyle, NO);
    
    CGDataProviderRef dataRef = CGDataProviderCreateWithURL(urlRef);
    
    CGImageRef imageRef = CGImageCreateWithJPEGDataProvider(dataRef, NULL, true, kCGRenderingIntentDefault);
    
    UIImage * image = [UIImage imageWithCGImage:imageRef];
    
    if (cached) {
        [cache setObjects:image forKey:imageName];
    }
    
    return image;
}

@end
