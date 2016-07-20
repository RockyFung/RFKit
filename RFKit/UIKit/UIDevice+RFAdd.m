//
//  UIDevice+RFAdd.m
//  RFKitDemo
//
//  Created by rocky on 16/7/20.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "UIDevice+RFAdd.h"
#import "RFKitMacro.h"

@implementation UIDevice (RFAdd)
+ (double)systemVersion{
    static double version;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        version = [UIDevice currentDevice].systemVersion.doubleValue;
    });
    return version;
}
@end
