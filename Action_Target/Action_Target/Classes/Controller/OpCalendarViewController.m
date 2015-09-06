//
//  OpCalendarViewController.m
//  Action_Target
//
//  Created by Supwin_mbp002 on 15/9/1.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import "OpCalendarViewController.h"
#import "VRGCalendarView.h"
#import "NSDate+convenience.h"
#import "DBTool.h"

@interface OpCalendarViewController ()<VRGCalendarViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *table;
@property(strong, nonatomic) NSArray *arraymission;
@property(strong, nonatomic) VRGCalendarView *calendar;
@property(strong, nonatomic) UIView *ContainCalendar;

@end

@implementation OpCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.arraymission = [[DBTool shareInstance] queryAllMission];
    
//    self.calendar = [[VRGCalendarView alloc] initWithFrame:CGRectMake(0, 0, 320, 340)];
    self.calendar = [[VRGCalendarView alloc] init];
    
    self.calendar.delegate=self;
//    //添加多一层VIEW 。用于展示控制位置
    CGRect position = CGRectMake(0, 20, 320, 358);
    self.ContainCalendar = [[UIView alloc]initWithFrame:position];
    self.ContainCalendar.backgroundColor = [UIColor blueColor];

//    
//    CGRect tableposition = calendar.frame;
//   tableposition.origin.y = calendar.frame.size.height;
    
//    CGRect frame = CGRectMake(0, CGRectGetHeight(ContainCalendar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-CGRectGetHeight(ContainCalendar.frame));
//    self.table = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
//    
//    
////    CGRect tableposition = self.view.frame;
////    tableposition.origin.y = 340;
////    self.table = [[UITableView alloc] initWithFrame:tableposition style:UITableViewStyleGrouped];
//    self.table.delegate = self;
//    self.table.dataSource = self;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//
    
    [self.ContainCalendar addSubview:self.calendar];
//    [self.view addSubview:self.calendar];
//
    [self.view addSubview:self.ContainCalendar];
//    [self.view addSubview:self.table];

    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    CGRect frame = CGRectMake(0, CGRectGetHeight(self.ContainCalendar.frame), CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)-CGRectGetHeight(self.ContainCalendar.frame));
        self.table = [[UITableView alloc] initWithFrame:frame style:UITableViewStylePlain];
    //
    //
    ////    CGRect tableposition = self.view.frame;
    ////    tableposition.origin.y = 340;
    ////    self.table = [[UITableView alloc] initWithFrame:tableposition style:UITableViewStyleGrouped];
        self.table.delegate = self;
        self.table.dataSource = self;
        self.automaticallyAdjustsScrollViewInsets = NO;
    self.table.tableFooterView = nil;
    self.table.tableHeaderView = nil;
    
    
    [self.view addSubview:self.table];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark calendar opration
-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated
{
    
    NSLog(@"操作提示---");
    if (month==[[NSDate date] month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:20], nil];
        [calendarView markDates:dates];
    }
    
//    [self.calendar numRows]
}

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date
{
    
}

#pragma mark tableview
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return [self.arraymission count];
    return 20;
}

// -(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return ;
//}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] init];
    }
    
    cell.textLabel.text = @"cesh";
    return cell;
}

@end
