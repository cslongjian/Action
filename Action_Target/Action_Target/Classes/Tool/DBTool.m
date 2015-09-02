//
//  DBTool.m
//  Action_Target
//
//  Created by Supwin_mbp002 on 15/9/1.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import "DBTool.h"

@implementation DBTool

//singleton_implementation(DBTool)

static DBTool *instance = nil;


+(instancetype)shareInstance
{
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    static  dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}



//创建表
+(void) createDBTable
{
    FMDatabase *db = [[DBTool shareInstance] fmdb];
    if (!db) {
        //判定数据库是否创建，不过使用了懒加载，这个判定有点多余了。
        NSLog(@"DB未创建，请先创建DB");
    }
    
    //判断数据库是否已经打开，如果没有打开，提示失败
    if (![db open]) {
        NSLog(@"DB打开失败");
        return;
    }
    
    //为数据库设置缓存，提高查询效率
    [db setShouldCacheStatements:YES];
    
    //判断数据库中是否已经存在这个表，如果不存在则创建该表
    if(![db tableExists:@"mission"])
    {
//        BOOL mark = [db executeUpdate:@"CREATE TABLES mission(mission_id INTEGER PRIMARY KEY AUTOINCREAMENT, name TEXT, description TEXT);"];
           BOOL result=[db executeUpdate:@"CREATE TABLE IF NOT EXISTS mission (mission_id integer PRIMARY KEY AUTOINCREMENT, name text, description text);"];
        if (result) {
              NSLog(@"创建完成");
        }
       
    }
}

//懒加载
-(FMDatabase *)fmdb
{
    if (!_fmdb) {
//        获得存放数据库文件的沙盒地址。
        NSArray *filePath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentPath = [filePath objectAtIndex:0];
        NSLog(@"%@",filePath);
        NSString *dbFilePath = [documentPath stringByAppendingPathComponent:@"db.sqlite"];
        _fmdb =  [FMDatabase databaseWithPath:dbFilePath];
    }
    return _fmdb;
}

//更新或者插入一条记录。
-(void) insertMission:(Mission *) mission
{
    if (![self openDB]) {
        return;
    }
    
    long missionid = mission.mission_id;
    
    [self.fmdb open];
    
    FMResultSet *rs = [self.fmdb executeQuery:@"select * from mission where mission_id = ?",[NSString stringWithFormat:@"%ld",missionid]];
    	if([rs next])
        	{
                [self.fmdb executeUpdate:@"update mission set name = ?, description = ? where mission_id = 1",mission.name,mission.mission_description];
            }
    	//向数据库中插入一条数据
    	else{
        	[self.fmdb executeUpdate:@"INSERT INTO mission (name, description) VALUES (?,?)",mission.name, mission.mission_description];
        	}
}

-(void) deleteMission:(Mission *) mission
{
    if (![self openDB]) {
        return;
    }
}

-(NSArray *) queryAllMission
{
    if (![self openDB]) {
        return nil;
    }
    
    if(![self.fmdb tableExists:@"mission"])
     {
         return nil;
     }
    
    //定义一个可变数组，用来存放查询的结果，返回给调用者
    NSMutableArray *missionArray = [[NSMutableArray alloc] initWithArray:0];
    //定义一个结果集，存放查询的数据
    FMResultSet *rs = [self.fmdb executeQuery:@"select * from mission"];
    //判断结果集中是否有数据，如果有则取出数据
    while ([rs next]) {
        Mission *mission = [[Mission alloc] init];
        	mission.mission_id = [rs intForColumn:@"mission_id"];
        	mission.name = [rs stringForColumn:@"name"];
        	mission.mission_description = [rs stringForColumn:@"description"];
        	//将查询到的数据放入数组中。
        	[missionArray addObject:mission];
    }
    return missionArray;
    
}

//判定数据库开启
-(BOOL)openDB
{
    if (![self.fmdb open]) {
        	NSLog(@"数据库打开失败");
        	return NO;
        }
    return  YES;
}




@end
