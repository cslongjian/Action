//
//  AddNewTargetViewController.m
//  Action_Target
//
//  Created by Supwin_mbp002 on 15/7/15.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import "AddNewTargetViewController.h"

@interface AddNewTargetViewController ()

@end

@implementation AddNewTargetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [super viewDidLoad];
    
    CGRect btnframe = CGRectMake(5, 5, 40, 40);
    UIButton *CButton = [[UIButton alloc] initWithFrame:btnframe];
    CButton.backgroundColor = [UIColor clearColor];
    [CButton setTitle:@"取消" forState:UIControlStateNormal];
    CButton.titleLabel.font =  [UIFont systemFontOfSize: 14];
    [CButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [CButton setTitleColor:[UIColor blueColor]forState:UIControlStateSelected];
    [CButton addTarget:self action:@selector(returnMenu) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *cancelBtnItem = [[UIBarButtonItem alloc]initWithCustomView:CButton];
    
    self.navigationItem.leftBarButtonItem = cancelBtnItem ;
    
//    
//    UIBarButtonItem *AddBtnItem = [[UIBarButtonItem alloc]initWithTitle:@"添加"  style:UIBarButtonItemStylePlain target:self action:@selector(addTarget)];
//    
    
    CGRect addbtnframe = CGRectMake(5, 5, 40, 40);
    UIButton *AddButton = [[UIButton alloc] initWithFrame:addbtnframe];
    AddButton.backgroundColor = [UIColor clearColor];
    [AddButton setTitle:@"添加" forState:UIControlStateNormal];
    AddButton.titleLabel.font =  [UIFont systemFontOfSize: 14];
    [AddButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [AddButton setTitleColor:[UIColor blueColor]forState:UIControlStateSelected];
    [AddButton addTarget:self action:@selector(addTarget) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIBarButtonItem *AddBtnItem = [[UIBarButtonItem alloc]initWithCustomView:AddButton];
    

    
    self.navigationItem.rightBarButtonItem = AddBtnItem;
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                
                                [UIColor blackColor],
                                
                                NSForegroundColorAttributeName, nil];
    
    [self.navigationController.navigationBar setTitleTextAttributes:attributes];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) returnMenu
{
    NSLog(@"退出添加逻辑");
    UIViewController *vc = [UIStoryboard storyboardWithName:@"Main" bundle:nil].instantiateInitialViewController;
    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    
}

-(void) addTarget
{
    NSLog(@"添加完成");
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
