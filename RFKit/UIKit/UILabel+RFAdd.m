//
//  UILabel+RFPoint.m
//  RFKitDemo
//
//  Created by 冯剑 on 2018/1/25.
//  Copyright © 2018年 RockyFung. All rights reserved.
//

#import "UILabel+RFAdd.h"

@implementation UILabel (RFAdd)
// 点语法
- (UILabel *(^)(CGFloat x,CGFloat y))RF_Center{
    return ^id(CGFloat x,CGFloat y){
        self.center = CGPointMake(x, y);
        return self;
    };
}
- (UILabel *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_Frame{
    return ^id(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(x, y, width, height);
        return self;
    };
}
- (UILabel *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_centerAndSize{
    return ^id(CGFloat x,CGFloat y,CGFloat width,CGFloat height){
        self.frame = CGRectMake(0, 0, width, height);
        self.center = CGPointMake(x, y);
        return self;
    };
}
- (UILabel *(^)(CGFloat size))RF_Font{
    return ^id(CGFloat size){
        self.font = [UIFont systemFontOfSize:size];
        return self;
    };
}
- (UILabel *(^)(UIColor *color))RF_textColor{
    return ^id(UIColor *color){
        self.textColor = color;
        return self;
    };
}
- (UILabel *(^)(CGFloat size, UIColor *color))RF_fontAndColor{
    return ^id(CGFloat size, UIColor *color){
        self.font = [UIFont systemFontOfSize:size];
        self.textColor = color?[UIColor blackColor]:color;
        return self;
    };
}
- (UILabel *(^)(NSTextAlignment textAlignment))RF_textAlignment{
    return ^id(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}
- (UILabel *(^)(NSString *text))RF_text{
    return ^id(NSString *str){
        self.text = str;
        return self;
    };
}
- (UILabel *(^)(NSInteger numberOfLines))RF_numberOfLines{
    return ^id(NSInteger number){
        self.numberOfLines = number;
        return self;
    };
}
- (UILabel *(^)(BOOL adjustsFontSizeToFitWidth))RF_adjustsFontSizeToFitWidth{
    return ^id(BOOL isAllow){
        self.adjustsFontSizeToFitWidth = isAllow;
        return self;
    };
}
- (UILabel *(^)(CGFloat width, UIColor *color, CGFloat cornerRadius))RF_borderWidthColorRadius{
    return ^id(CGFloat width, UIColor *color, CGFloat cornerRadius){
        self.layer.borderWidth = width;
        self.layer.borderColor = color.CGColor;
        self.layer.cornerRadius = cornerRadius;
        return self;
    };
}

@end
