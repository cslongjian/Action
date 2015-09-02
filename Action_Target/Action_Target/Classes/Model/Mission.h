//
//  Mission.h
//  Action_Target
//
//  Created by Supwin_mbp002 on 15/9/1.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mission : NSObject

@property(nonatomic, assign) NSInteger mission_id;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *mission_description;

@end
