//
//  ViewController.m
//  Text
//
//  Created by KuiYin on 16/5/17.
//  Copyright © 2016年 shenming. All rights reserved.
//

#define WIDTH ScreenWidth / 7

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

#import "ViewController.h"
#import "DayTableViewCell.h"
@interface ViewController ()<UITextViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource>{
    UITableView *myTableView;
    UICollectionView *view;
    UIButton *textView;
    UILabel *label;
    UIWebView *web;
    UITextView *atTextView;
    NSArray *atArray;
    NSInteger redom;
}
@property (nonatomic, strong) NSMutableDictionary *atDictory;
@property (nonatomic, strong) NSMutableArray      *totalArray;
@end

static NSString * const reuseIdentifier = @"FunctionCell";
static NSString * const reuseIdentifier2 = @"ApprovalHeadView";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    atArray = @[@"小小", @"幽鬼", @"火猫", @"远古幽魂"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    atTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 200)];
    atTextView.delegate = self;
//    atTextView.backgroundColor = [UIColor redColor];
    //atTextView.center = self.view.center;
    [self.view addSubview:atTextView];
    
    UIButton *atButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [atButton setBackgroundColor:[UIColor blackColor]];
    atButton.frame = CGRectMake(0, CGRectGetMaxY(atTextView.frame), 100, 100);
    [atButton addTarget:self action:@selector(addName) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:atButton];
    
//    label = [[UILabel alloc] initWithFrame:CGRectMake(ScreenWidth / 2 - 5, 0, 10, 0)];
//    label.backgroundColor = [UIColor blackColor];
//    //[self.view addSubview:label];
//    textView = [UIButton buttonWithType:UIButtonTypeSystem];
//    textView.frame = CGRectMake(self.view.center.x - 50, 0, 50, 50);
//    [textView addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
////    textView.backgroundColor = [UIColor redColor];
//    [textView setBackgroundImage:[UIImage imageNamed:@"红包"] forState:UIControlStateNormal];
//    [self.view addSubview:textView];
//    [self animation];
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
//    NSURL *url = [NSURL URLWithString:@"http://192.168.8.108/officeweb/mobile/msg/app/view/assistant.jsp"];
//    NSURLRequest *urlRequest= [NSURLRequest requestWithURL:url];
//    [web loadRequest:urlRequest];
//    [self.view addSubview:web];
//    
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(100, 100, 30, 30);
//    [button setBackgroundColor:[UIColor redColor]];
//    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    
//    NSLog(@"%ld", [self gettotalDay:6]);
//    NSLog(@"%ld", [self weeklyOrdinality:6]);
//    myTableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
//    myTableView.delegate = self;
//    myTableView.dataSource = self;
//    [self.view addSubview:myTableView];
    //[self setUpSubView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)back {
    //返回上级页面
    [web goBack];
    //翻到下级页面
    //[web goForward];
}

- (void)addName {
    redom = arc4random() % 4;
    [self setString:atArray[redom]];
    [self setAtString];
    //NSDictionary *attributeDict = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:15.0],NSFontAttributeName,[UIColor blueColor],NSForegroundColorAttributeName,nil];
    //atTextView.selectedRange = NSMakeRange(0, atTextView.text.length / 2);
}

//将对应@的成员存入字典里面
- (void)setString:(NSString *)string{
    NSInteger atTextViewLength = atTextView.text.length;
    NSInteger atTextLength = [atArray[redom] length] + 1;
    NSArray *arr = @[@(atTextViewLength), @(atTextLength)];
    [self.totalArray addObject:arr];
    //[self.atDictory setValue:arr forKey:string];
    atTextView.text = [NSString stringWithFormat:@"%@@%@", atTextView.text, string];
}

- (void)setAtString{
    NSMutableAttributedString *atString = [[NSMutableAttributedString alloc] initWithString:atTextView.text];
    for (int i = 0; i < _totalArray.count; i++) {
        NSArray *arr = _totalArray[i];
        [atString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange([arr[0] integerValue], [arr[1] integerValue])];
    }
    atTextView.attributedText = atString;
}

- (void)judgereduce:(NSRange)range {
    NSLog(@"range.location =  %lu", (unsigned long)range.location);
    for (int i = 0; i < _totalArray.count; i++) {
        NSInteger location = [_totalArray[i][0] integerValue] + [_totalArray[i][1] integerValue];
        NSInteger potion = [_totalArray[i][0] integerValue];
        NSInteger length = [_totalArray[i][1] integerValue];
        if (range.location - location == 0) {
            NSLog(@"%lu", (unsigned long)range.location);
            NSLog(@"%ld", location);
            atTextView.selectedRange = NSMakeRange(potion, length);
        }
    }
}
#pragma mark - UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView {
    NSLog(@"textView.text = %@", atTextView.text);
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    return YES;
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {
    
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    
}


- (void)textViewDidChangeSelection:(UITextView *)textView {
    //光标所在位置
//    CGFloat cursorPosition = [textView caretRectForPosition:textView.selectedTextRange.start].origin.y;
//    CGFloat x = [textView caretRectForPosition:textView.selectedTextRange.start].origin.x;
//    
//    NSString *string = [NSString stringWithFormat:@"@%@", atArray[redom]];
//    NSLog(@"textViewDidChangeSelection = %@", string);
//    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13.0f]}];ewrwerewrere
}

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange  {
    
    return YES;
}
- (BOOL)textView:(UITextView *)textView shouldInteractWithTextAttachment:(NSTextAttachment *)textAttachment inRange:(NSRange)characterRange {
    
    return YES;
}

- (void)animation {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        textView.transform = CGAffineTransformMakeScale(1.08, 1.08);
        [UIView animateWithDuration:1 animations:^{
            textView.center = self.view.center;
            textView.transform = CGAffineTransformIdentity;
        }];
    });
    
    [UIView animateWithDuration:1 animations:^{
        label.frame = CGRectMake(ScreenWidth / 2 - 5, 0, 10, ScreenHeight / 2 - 50);
    }];
    [self dou];
}


- (void)dou {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            textView.transform = CGAffineTransformMakeRotation(-45 * M_PI / 180);
        }];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.5 animations:^{
            textView.transform = CGAffineTransformMakeRotation(45 * M_PI / 180);
        }];
    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:1 animations:^{
            textView.transform = CGAffineTransformMakeRotation(0 * M_PI / 180);
        }];
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [label removeFromSuperview];
        [UIView animateWithDuration:1 animations:^{
            textView.frame = CGRectMake(ScreenWidth, ScreenHeight, 0, 0);
        }];
    });
}



- (void) setUpSubView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(WIDTH, WIDTH);
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 10;
    layout.headerReferenceSize = CGSizeMake(ScreenWidth, 40);
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    view = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
    [view registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    //注册区头
    [view registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier2];
    view.delegate = self;
    view.dataSource = self;
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier2 forIndexPath:indexPath];
        //headerView.backgroundColor = [UIColor redColor];
        UILabel *timeLabel =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
        timeLabel.text = @"日期";
        timeLabel.textAlignment = NSTextAlignmentCenter;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(10, 0, 40, 40);
        [button setBackgroundColor:[UIColor redColor]];
        [timeLabel addSubview:button];

        UIButton *reduceButton = [UIButton buttonWithType:UIButtonTypeSystem];
        reduceButton.frame = CGRectMake(self.view.frame.size.width - 50, 0, 40, 40);
        [reduceButton setBackgroundColor:[UIColor blueColor]];
        [timeLabel addSubview:reduceButton];
        [headerView addSubview:timeLabel];
        return headerView;
    } else {
        return nil;
    }
}

//返回某个分区的区头大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(ScreenWidth, 40);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView  {
    return 2;
}

//返回某个个分区, item之间的最小分区
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 35;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    //cell.backgroundColor = [UIColor redColor];
    UILabel *Day = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, WIDTH, WIDTH)];
    Day.textAlignment = NSTextAlignmentCenter;
    Day.text = @"10";
    [cell addSubview:Day];
    return cell;
}

////每个月有多少天
//- (NSInteger)gettotalDay:(NSInteger)month{
//    NSDate *now;
//    if (month == 0) {
//        now = [NSDate dateWithTimeIntervalSinceNow:0];
//    } else {
//        now = [self dateMonth:month];
//    }
//    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:now].length;
//}
//
////每个月第一天星期几
//- (NSUInteger)weeklyOrdinality:(NSInteger)month
//{
//    return [[NSCalendar currentCalendar] ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitWeekOfMonth forDate:[self dateMonth:month]];
//}
//
//- (NSDate *)dateMonth:(NSInteger)month
//{
//    NSDateComponents *c = [[NSDateComponents alloc] init];
//    //c.year = year;
//    c.month = month;
//    //c.day = day;
//    return [[NSCalendar currentCalendar] dateFromComponents:c];
//}
//
//- (NSDate *)firstDayOfCurrentMonth:(NSInteger)month
//{
//    NSDate *startDate = nil;
//    BOOL ok = [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitMonth startDate:&startDate interval:NULL forDate:[self dateMonth:month]];
//    NSAssert1(ok, @"Failed to calculate the first day of the month based on %@", self);
//    return startDate;
//}
//#pragma mark - UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    return 1;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row == 0) {
//        static NSString *string = @"cell";
//        DayTableViewCell *cell = [[DayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
//        return cell;
//    }
//    return nil;
//}
//#pragma mark - UITableViewDelegate
//- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UILabel *timeLabel =[[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
//    timeLabel.text = @"日期";
//    timeLabel.textAlignment = NSTextAlignmentCenter;
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
//    button.frame = CGRectMake(10, 0, 40, 40);
//    [button setBackgroundColor:[UIColor redColor]];
//    [timeLabel addSubview:button];
//    
//    UIButton *reduceButton = [UIButton buttonWithType:UIButtonTypeSystem];
//    reduceButton.frame = CGRectMake(self.view.frame.size.width - 50, 0, 40, 40);
//    [reduceButton setBackgroundColor:[UIColor blueColor]];
//    [timeLabel addSubview:reduceButton];
//    
//    return timeLabel;
//}
//
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 40;
//}

- (NSMutableDictionary *)atDictory {
    if (!_atDictory) {
        _atDictory = [NSMutableDictionary dictionary];
    }
    return _atDictory;
}

- (NSMutableArray *)totalArray {
    if (!_totalArray) {
        _totalArray = [NSMutableArray array];
    }
    return _totalArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
