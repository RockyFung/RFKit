//
//  UILabel+RFAdd.h
//  RFKitDemo
//
//  Created by 冯剑 on 2018/1/25.
//  Copyright © 2018年 RockyFung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (RFAdd)
// 点语法
- (UILabel *(^)(CGFloat x,CGFloat y))RF_Center;
- (UILabel *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_Frame;
- (UILabel *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_centerAndSize;
- (UILabel *(^)(CGFloat size))RF_Font;
- (UILabel *(^)(UIColor *color))RF_textColor;
- (UILabel *(^)(CGFloat size, UIColor *color))RF_fontAndColor;
- (UILabel *(^)(NSTextAlignment textAlignment))RF_textAlignment;
- (UILabel *(^)(NSString *text))RF_text;
- (UILabel *(^)(NSInteger numberOfLines))RF_numberOfLines;
- (UILabel *(^)(BOOL adjustsFontSizeToFitWidth))RF_adjustsFontSizeToFitWidth;


// 边框设置
- (UILabel *(^)(CGFloat width, UIColor *color, CGFloat cornerRadius))RF_borderWidthColorRadius;
@end
