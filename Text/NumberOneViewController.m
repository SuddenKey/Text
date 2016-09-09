//
//  NumberOneViewController.m
//  Text
//
//  Created by HaoHao on 16/8/19.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "NumberOneViewController.h"

@interface NumberOneViewController ()

@end

@implementation NumberOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.center = self.view.center;
    label.backgroundColor = [UIColor blackColor];
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
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
