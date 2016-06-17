//
//  DayTableViewCell.m
//  Text
//
//  Created by KuiYin on 16/5/23.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import "DayTableViewCell.h"

#define WIDTH ScreenWidth / 7

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation DayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubView];
    }
    return self;
}

- (void)setUpSubView {
    for (int i = 0; i < 7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTintColor:[UIColor grayColor]];
        [self addSubview:button];
        switch (i) {
            case 0:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"日" forState:UIControlStateNormal];
                break;
            case 1:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"一" forState:UIControlStateNormal];
                break;
            case 2:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"二" forState:UIControlStateNormal];
                break;
            case 3:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"三" forState:UIControlStateNormal];
                break;
            case 4:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"四" forState:UIControlStateNormal];
                break;
            case 5:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"五" forState:UIControlStateNormal];
                break;
            case 6:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                [button setTitle:@"六" forState:UIControlStateNormal];
                break;
            default:
                break;
        }
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
