//
//  FoundtionViewController.m
//  RFKitDemo
//
//  Created by rocky on 16/7/20.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "FoundtionViewController.h"
#import "RFKit.h"

@interface FoundtionViewController ()

@end

@implementation FoundtionViewController
{
    UIScrollView *_scrollView;
    CGFloat _labelY;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.86 alpha:1.0];
    _scrollView = [UIScrollView new];
    _scrollView.frame = self.view.bounds;
    
    if (kSystemVersion < 7) {
        _scrollView.height -= 44;
    }
    _scrollView.contentSize = CGSizeMake(self.view.width, self.view.height * 2);
    [self.view addSubview:_scrollView];
    
    _labelY = 10;
    NSString *context = @"";
    
    [self additem:@"MD5"];
    [self addContext:[NSString md5HexDigest:@"www.baidu.com"]];
    
    [self additem:@"价格千位符"];
    NSString *price1 = [NSString thousandSeparatorWithPrice:@"999"];
    NSString *price2 = [NSString thousandSeparatorWithPrice:@"150000"];
    NSString *price3 = [NSString thousandSeparatorWithPrice:@"11800000"];
    NSString *str = [NSString stringWithFormat:@"捷安特 ：%@ \n马自达 ：%@元 \n法拉利 ：%@元", price1, price2, price3];
    [self addContext:str];
    
    [self additem:@"银行卡号"];
    NSString *cardNum = @"6089485729371834";
    context = [NSString stringWithFormat:@"卡号 %@",[NSString formatCardNumber:cardNum]];
    [self addContext:context];
    
    [self additem:@"根据金额得到相应的字符串"];
    NSString *cash = @"60080000";
    context = [NSString stringWithFormat:@"整数 %@ \n两位小数 %@",[NSString moneyToNumString:cash], [NSString moneyToString:cash]];
    [self addContext:context];

    [self additem:@"UTC标准时间转换为NSDate"];
    NSString *UTCString = @"2016-07-20T16:46:02.000+08:00";
    NSDate *date = [NSDate stringToNSDateWithUTCString:UTCString];
    [self addContext:[NSString stringWithFormat:@"UTCString %@ \nNSDate %@",UTCString,date]];
    
    [self additem:@"NSDate转换为字符串"];
    context = [NSDate stringWithDate:date format:@"YYYY/MM/dd HH:mm"];
    [self addContext:context];
    
    [self additem:@"单独获取日期元素"];
    context = [NSString stringWithFormat:@"month %ld \nday %ld \nhour %ld \nminute %ld \n%ld年第%ld周",date.month,date.day,date.hour,date.minute,date.year,date.weekOfYear];
    [self addContext:context];
    
    
}

// 添加标题
- (void)additem:(NSString *)title{
    UILabel *titleLabel = [UILabel new];
    titleLabel.size = CGSizeMake(self.view.width, 20);
    titleLabel.font = FONT_BOLD_SYSTEM_SIZE(14);
    titleLabel.left = 20;
    titleLabel.top = _labelY;
    titleLabel.text = title;
    [_scrollView addSubview:titleLabel];
    
    _labelY += 20;
}

// 添加内容
- (void)addContext:(NSString *)context{
    // 动态计算字符串高度
    CGFloat height = [context heightForFont:FONT_SYSTEM_SIZE(14) width:self.view.width];
    
    UILabel *description = [UILabel new];
    description.size = CGSizeMake(self.view.width, height);
    description.left = 20;
    description.top = _labelY;
    description.font = FONT_SYSTEM_SIZE(14);
    description.numberOfLines = 0;
    description.text = context;
    [_scrollView addSubview:description];
    
    _labelY += height + 10;
    
    CALayer *line = [CALayer layer];
    line.backgroundColor = [UIColor colorWithWhite:0.5 alpha:1.0].CGColor;
    line.frame = CGRectMake(0, _labelY, self.view.width, 1);
    [_scrollView.layer addSublayer:line];
    
    _labelY  += 10;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
