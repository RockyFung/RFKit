//
//  UIImageView+RFAdd.m
//  RFKitDemo
//
//  Created by 冯剑 on 2018/1/25.
//  Copyright © 2018年 RockyFung. All rights reserved.
//

#import "UIImageView+RFAdd.h"

@implementation UIImageView (RFAdd)
// 点语法
- (UIImageView *(^)(CGFloat x,CGFloat y))RF_Center{
    return ^id(CGFloat x,CGFloat y){
        self.center = CGPointMake(x, y);
        return self;
    };
}
- (UIImageView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_Frame{
    return ^id(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
}
- (UIImageView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_centerAndSize{
    return ^id(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(0, 0, width, height);
        self.center = CGPointMake(x, y);
        return self;
    };
}
- (UIImageView *(^)(NSString *imageName))RF_imageName{
    return ^id(NSString *imageName){
        [self setImage:[UIImage imageNamed:imageName]];
        return self;
    };
}
- (UIImageView *(^)(BOOL hidden))RF_hidden{
    return ^id(BOOL hidden){
        self.hidden = hidden;
        return self;
    };
}
@end
