//
//  DBTool.h
//  Action_Target
//
//  Created by Supwin_mbp002 on 15/9/1.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDB.h"
#import "Mission.h"

@interface DBTool : NSObject

@property(nonatomic,strong) FMDatabase *fmdb;

+(instancetype) shareInstance;
+(void) createDBTable;

-(void) insertMission:(Mission *)mission;
-(void) deleteMission:(Mission *)mission;
-(NSArray *) queryAllMission;
@end
