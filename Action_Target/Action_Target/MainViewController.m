//
//  MainViewController.m
//  Action_Target
//
//  Created by 陈龙坚 on 15/7/14.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//
#define kCameraViewWidth 49
#define kCameraViewHeight 61
#define kCameraBtnWidth kCameraViewWidth
#define kCameraBtnHeight 50

#import "MainViewController.h"
#import "UITabbar.h"
#import "UIImage+Utils.h"

@interface MainViewController ()<UINavigationControllerDelegate,UTabbarDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong) UIView *addView;
@property(nonatomic,strong) UIButton *addBtn;



@end

@implementation MainViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        for (UINavigationController *navVC in self.viewControllers) {
            navVC.delegate = self;
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNavigationTheme];
    
    UITabbar *utabbar = [[UITabbar alloc] initWithFrame:self.tabBar.bounds];
    
    utabbar.delegate = self;
    self.tabBar.translucent = NO;
    [self.tabBar addSubview:utabbar];
    
    [self.tabBar setShadowImage:[UIImage imageWithColor:[UIColor clearColor]]];
    self.tabBar.backgroundImage = [UIImage imageWithColor:[UIColor clearColor]];
    
    utabbar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab-_白色透明背景渐变"]];
    
    _addView =[[UIView alloc]init];
    
    _addView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tab_摄影机图标背景"]];
    _addBtn = [[UIButton alloc]init];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"摄影机图标_点击前"] forState:UIControlStateNormal];
    [_addBtn setBackgroundImage:[UIImage imageNamed:@"摄影机图标_点击后"] forState:UIControlStateHighlighted];
    _addBtn.frame = CGRectMake(0, 5, kCameraBtnWidth, kCameraBtnHeight);
    _addBtn.tag = 2;
    [_addBtn addTarget:self action:@selector(push) forControlEvents:UIControlEventTouchUpInside];
    [_addView addSubview:_addBtn];
    
    _addView.frame = CGRectMake(self.tabBar.frame.size.width/2-kCameraViewWidth/2, -11, kCameraBtnWidth, kCameraBtnHeight);
    [self.tabBar addSubview:_addView];
    [self.tabBar bringSubviewToFront:_addView];

    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  设置导航栏以及信号栏主题样式
 */
-(void) setNavigationTheme{
    
    //操作整个应用中的所有导航栏，只需要给它设置就可以了
    UINavigationBar *navBar = [UINavigationBar appearance];
    navBar.tintColor = [UIColor whiteColor];
    //设置导航栏标题颜色
    [navBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
}

-(void) push
{
    NSLog(@"进入添加逻辑");
    //跳转别的storyboard  用这种方式。
//    UIViewController *vc = [UIStoryboard storyboardWithName:@"add" bundle:nil].instantiateInitialViewController;
//    [UIApplication sharedApplication].keyWindow.rootViewController = vc;
    
}

-(void)changeNav:(NSInteger)from to:(NSInteger)to{
    self.selectedIndex = to;
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
