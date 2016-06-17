//
//  MonthTableViewCell.h
//  Text
//
//  Created by KuiYin on 16/5/23.
//  Copyright © 2016年 shenming. All rights reserved.
//

#import <UIKit/UIKit.h>
@class model;
@interface MonthTableViewCell : UITableViewCell

@property (nonatomic, assign) model *time;

@property (nonatomic, assign) NSIndexPath *indexPath;

@end
