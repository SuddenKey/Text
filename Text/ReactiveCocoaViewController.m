//
//  ReactiveCocoaViewController.m
//  Text
//
//  Created by HaoHao on 16/8/31.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "ReactiveCocoaViewController.h"
#import "RACSignal.h"
#import "ReactiveCocoa.h"
@interface ReactiveCocoaViewController ()

@end

@implementation ReactiveCocoaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self.text.rac_textSignal filter:^BOOL(id value){
          NSString*text = value;
          return text.length > 10;
      }] subscribeNext:^(id x) {
          NSLog(@"pppppp");
    }];
    
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
