//
//  UITabbar.m
//  Action_Target
//
//  Created by 陈龙坚 on 15/7/14.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import "UITabbar.h"
#import "UITabbarButton.h"

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


@interface UITabBar() <UIActionSheetDelegate,UINavigationControllerDelegate>
{
    UITabbarButton *_selectBarButton;
}


@end

@implementation UITabbar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
