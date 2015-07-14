//
//  UITabbar.h
//  Action_Target
//
//  Created by 陈龙坚 on 15/7/14.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UTabbarDelegate <NSObject>

@required
-(void) changeNav:(NSInteger)from to:(NSInteger)to;

@end


@interface UITabbar : UIView

@property(nonatomic,weak) id<UTabbarDelegate> delegate;

@end
