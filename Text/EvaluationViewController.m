//
//  EvaluationViewController.m
//  Text
//
//  Created by KuiYin on 16/7/12.
//  Copyright © 2016年 shenming. All rights reserved.
//

#define kColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#import "EvaluationViewController.h"
#import "TriangleView.h"
#import "BlueView.h"
#import "YellowView.h"
#import "FXBlurView.h"
@interface EvaluationViewController ()

@end

@implementation EvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"00000";

    
    [self setUpSubView];
    // Do any additional setup after loading the view.
}

- (void)setUpSubView {
    UILabel *bottomLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 350, 350)];
    bottomLabel.layer.cornerRadius = bottomLabel.frame.size.width / 2;
    bottomLabel.backgroundColor = kColor(231, 233, 246);
    bottomLabel.clipsToBounds = YES;
    bottomLabel.center = self.view.center;
    [self.view addSubview:bottomLabel];
    
    UILabel *midLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, bottomLabel.frame.size.width - 50, bottomLabel.frame.size.width - 50)];
    midLabel.layer.cornerRadius = midLabel.frame.size.width / 2;
    midLabel.backgroundColor = kColor(202, 207, 234);
    midLabel.clipsToBounds = YES;
    midLabel.center = self.view.center;
    [self.view addSubview:midLabel];
    
    UILabel *topLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, midLabel.frame.size.width - 50, midLabel.frame.size.width - 50)];
    topLabel.layer.cornerRadius = topLabel.frame.size.width / 2;
    topLabel.backgroundColor = kColor(175, 183, 224);
    topLabel.clipsToBounds = YES;
    topLabel.center = self.view.center;
    [self.view addSubview:topLabel];
    
    BlueView *blueView = [[BlueView alloc] initWithFrame:self.view.frame];
    blueView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:blueView];
    
    YellowView *yellow = [[YellowView alloc] initWithFrame:self.view.frame];
    yellow.percent = 0.66;
    yellow.centerRoundlength = bottomLabel.frame.size.width / 2;
    yellow.backgroundColor = [UIColor clearColor];
    [self.view addSubview:yellow];
    
    TriangleView *triang = [[TriangleView alloc] initWithFrame:self.view.frame];
    triang.centerRoundlength = 75;
    triang.backgroundColor = [UIColor clearColor];
    [self.view addSubview:triang];
    
    UILabel *topsideView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 150)];
    topsideView.layer.cornerRadius = topsideView.frame.size.width / 2;
    topsideView.backgroundColor = [UIColor whiteColor];
    topsideView.center = self.view.center;
    topsideView.clipsToBounds = YES;
    [self.view addSubview:topsideView];
    
//    
//    FXBlurView *blue = [[FXBlurView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:blue];
//    //  创建需要的毛玻璃特效类型
//    UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
//    //  毛玻璃view 视图
//    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
//    //添加到要有毛玻璃特效的控件中
//    effectView.frame = self.imageV.bounds;
//    [self.imageV addSubview:effectView];
//    //设置模糊透明度
//    effectView.alpha = .8f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
