//
//  RichScanViewController.h
//  hemailogistics
//
//  Created by apple on 15/7/23.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "ViewController.h"

@protocol RichScanView <NSObject>

- (void)rich:(NSString *)string;

@end

@interface RichScanViewController : ViewController

@property (nonatomic, assign) id<RichScanView>delegate;

@end
