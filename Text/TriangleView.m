//
//  TriangleView.m
//  Text
//
//  Created by KuiYin on 16/7/12.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "TriangleView.h"

@implementation TriangleView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    CGPoint center = self.center;
    
    //设置背景颜色
    [[UIColor clearColor]set];
    UIRectFill([self bounds]);
    //拿到当前视图准备好的画板
    CGContextRef context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context, center.x + _centerRoundlength, center.y);//设置起点
    CGContextAddLineToPoint(context, center.x + 80, center.y - 75);
    CGContextAddLineToPoint(context, center.x + 25, center.y - 70);
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [[UIColor greenColor] setFill]; //设置填充色
    CGContextDrawPath(context, kCGPathFillStroke);//绘制路径path
    

}


@end
