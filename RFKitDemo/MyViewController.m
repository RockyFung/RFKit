//
//  MyViewController.m
//  RFKitDemo
//
//  Created by rocky on 16/7/22.
//  Copyright © 2016年 RockyFung. All rights reserved.
//

#import "MyViewController.h"
#import "RFKit.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.86 alpha:1.0];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(20, 100, 100, 100)];
    view1.backgroundColor = [UIColor magentaColor];
    [view1 radiusWithTopLeftAndTopRightRadius:20.0];
    [view1 addTapActionOnViewBlock:^(id sender) {
        
    }];
    [self.view addSubview:view1];
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
