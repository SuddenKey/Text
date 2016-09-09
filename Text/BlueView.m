//
//  BlueView.m
//  Text
//
//  Created by KuiYin on 16/7/12.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView


- (void)drawRect:(CGRect)rect {
    CGPoint center = self.center;
    
    //设置背景颜色
    [[UIColor clearColor]set];
    UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef contextYellow = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(contextYellow);//标记
    
    CGContextMoveToPoint(contextYellow, center.x - 75, center.y);//设置起点
    CGContextAddLineToPoint(contextYellow, center.x - 120, center.y - 75);
    CGContextAddLineToPoint(contextYellow, center.x - 25, center.y - 70);

    CGContextClosePath(contextYellow);//路径结束标志，不写默认封闭
    [[UIColor blueColor] setFill]; //设置填充色
    CGContextDrawPath(contextYellow, kCGPathFillStroke);//绘制路径path
}


@end
