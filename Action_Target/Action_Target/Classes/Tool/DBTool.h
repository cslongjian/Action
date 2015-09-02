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


//#define singleton_interface(className) \
//+ (className *)shared##className;
//
//
////@implementation
//#define singleton_implementation(className) \
//static className *_instance; \
//+ (id)allocWithZone:(NSZone *)zone \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [super allocWithZone:zone]; \
//}); \
//return _instance; \
//} \
//+ (className *)shared##className \
//{ \
//static dispatch_once_t onceToken; \
//dispatch_once(&onceToken, ^{ \
//_instance = [[self alloc] init]; \
//}); \
//return _instance; \
//}


@interface DBTool : NSObject
//singleton_interface(DBTool)


@property(nonatomic,strong) FMDatabase *fmdb;

+(instancetype) shareInstance;
+(void) createDBTable;

-(void) insertMission:(Mission *)mission;
-(void) deleteMission:(Mission *)mission;
-(NSArray *) queryAllMission;
@end
