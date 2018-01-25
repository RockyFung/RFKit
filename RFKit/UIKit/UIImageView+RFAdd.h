//
//  UIImageView+RFAdd.h
//  RFKitDemo
//
//  Created by 冯剑 on 2018/1/25.
//  Copyright © 2018年 RockyFung. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (RFAdd)
// 点语法
- (UIImageView *(^)(CGFloat x,CGFloat y))RF_Center;
- (UIImageView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_Frame;
- (UIImageView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))RF_centerAndSize;
- (UIImageView *(^)(NSString *imageName))RF_imageName;
- (UIImageView *(^)(BOOL hidden))RF_hidden;


@end
