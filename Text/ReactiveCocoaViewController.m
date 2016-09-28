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
          NSLog(@"这TM想干什么");
    }];
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
}
@end
