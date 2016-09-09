//
//  YellowView.m
//  Text
//
//  Created by KuiYin on 16/7/12.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "YellowView.h"

@implementation YellowView

- (void)drawRect:(CGRect)rect {
    CGPoint center = self.center;
    //设置背景颜色
    [[UIColor clearColor]set];
    UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef contextblue = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(contextblue);//标记
    CGContextMoveToPoint(contextblue, center.x - 50 * sqrt(2), center.y + 25);//设置起点
    CGContextAddLineToPoint(contextblue, center.x, center.y + _percent * _centerRoundlength + 25);
    CGContextAddLineToPoint(contextblue, center.x + 50 * sqrt(2), center.y + 25);
    
    CGContextClosePath(contextblue);//路径结束标志，不写默认封闭
    [[UIColor yellowColor] setFill]; //设置填充色
    CGContextDrawPath(contextblue, kCGPathFillStroke);//绘制路径path
}


@end
