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

@interface OpCalendarViewController ()<VRGCalendarViewDelegate>

@end

@implementation OpCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    VRGCalendarView *calendar = [[VRGCalendarView alloc] init];
    calendar.delegate=self;
    //添加多一层VIEW 。用于展示控制位置
    CGRect position = self.view.frame;
    position.origin.y = position.origin.y+20;
    UIView *ContainCalendar = [[UIView alloc]initWithFrame:position];
//    ContainCalendar.backgroundColor = [UIColor blueColor];
    [ContainCalendar addSubview:calendar];
    
    [self.view addSubview:ContainCalendar];

    
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

-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated
{
    if (month==[[NSDate date] month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:3],[NSNumber numberWithInt:20], nil];
        [calendarView markDates:dates];
    }
}

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date
{
    
}

@end
