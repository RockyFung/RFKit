//
//  UIButton+RFAdd.m
//  RFKitDemo
//
//  Created by 冯剑 on 2018/1/25.
//  Copyright © 2018年 RockyFung. All rights reserved.
//

#import "UIButton+RFAdd.h"

@implementation UIButton (RFAdd)
// 点语法
- (UIButton *(^)(CGFloat x,CGFloat y))RF_Center{
    return ^id(CGFloat x,CGFloat y){
        self.center = CGPointMake(x, y);
        return self;
    };
}
- (UIButton *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_Frame{
    return ^id(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
}
- (UIButton *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_centerAndSize{
    return ^id(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(0, 0, width, height);
        self.center = CGPointMake(x, y);
        return self;
    };
}
- (UIButton *(^)(CGFloat size))RF_titleFont{
    return ^id(CGFloat size){
        self.titleLabel.font = [UIFont systemFontOfSize:size];
        return self;
    };
}
- (UIButton *(^)(UIColor *color))RF_titleColor{
    return ^id(UIColor *color){
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(CGFloat size, UIColor *color))RF_fontAndColor{
    return ^id(CGFloat size, UIColor *color){
        self.titleLabel.font = [UIFont systemFontOfSize:size];
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSString *title))RF_title{
    return ^id(NSString *title){
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
}
- (UIButton *(^)(NSInteger tag))RF_tag{
    return ^(NSInteger tag){
        self.tag = tag;
        return self;
    };
}


- (UIButton *(^)(CGFloat width, UIColor *color, CGFloat cornerRadius))RF_borderWidthColorRadius{
    return ^id(CGFloat width, UIColor *color, CGFloat cornerRadius){
        self.layer.borderWidth = width;
        self.layer.borderColor = color.CGColor;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

@end
