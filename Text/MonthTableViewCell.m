//
//  MonthTableViewCell.m
//  Text
//
//  Created by KuiYin on 16/5/23.
//  Copyright © 2016年 shenming. All rights reserved.
//

#define WIDTH ScreenWidth / 7

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "MonthTableViewCell.h"
#import "model.h"
@implementation MonthTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpSubView];
    }
    return self;
}

- (void)setUpSubView {
    if (_indexPath.row == 0) {
        
    }
    
    
    for (int i = 0; i < 7; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTintColor:[UIColor grayColor]];
        [self addSubview:button];
        switch (i) {
            case 0:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            case 1:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            case 2:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            case 3:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            case 4:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            case 5:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            case 6:
                button.frame = CGRectMake(i * WIDTH, 0, WIDTH, 40);
                break;
            default:
                break;
        }
    }
}

- (model *)time {
    if (_time) {
        
    }
    return _time;
}

//每个月有多少天
- (NSInteger)gettotalDay:(NSInteger)month{
    NSDate *now;
    if (month == 0) {
        now = [NSDate dateWithTimeIntervalSinceNow:0];
    } else {
        now = [self dateMonth:month];
    }
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now].length;
}

//每个月第一天星期几
- (NSUInteger)weeklyOrdinality:(NSInteger)month
{
    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:[self dateMonth:month]];
}


- (NSDate *)dateMonth:(NSInteger)month
{
    NSDateComponents *c = [[NSDateComponents alloc] init];
    c.year = _time.year;
    c.month = _time.month;
    c.day = _time.day;
    return [[NSCalendar currentCalendar] dateFromComponents:c];
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

@end
