//
//  UIButton+RFAdd.h
//  RFKitDemo
//
//  Created by 冯剑 on 2018/1/25.
//  Copyright © 2018年 RockyFung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (RFAdd)
// 点语法
- (UIButton *(^)(CGFloat x,CGFloat y))RF_Center;
- (UIButton *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_Frame;
- (UIButton *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_centerAndSize;
- (UIButton *(^)(CGFloat size))RF_titleFont;
- (UIButton *(^)(UIColor *color))RF_titleColor;
- (UIButton *(^)(NSString *title))RF_title;
- (UIButton *(^)(CGFloat size, UIColor *color))RF_fontAndColor;
- (UIButton *(^)(NSInteger tag))RF_tag;

// 边框设置
- (UIButton *(^)(CGFloat width, UIColor *color, CGFloat cornerRadius))RF_borderWidthColorRadius;
@end
