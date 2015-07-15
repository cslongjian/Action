
//  UITabbar.m
//  Action_Target
//
//  Created by 陈龙坚 on 15/7/14.
//  Copyright (c) 2015年 chenlongjian. All rights reserved.
//

#import "UITabbar.h"
#import "UITabbarButton.h"
#import "MainViewController.h"

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)


@interface UITabbar() <UIActionSheetDelegate,UINavigationControllerDelegate>
{
    UITabbarButton *selectBarButton;;
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

-(instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBarButton];
    }
    
    return  self;
}

-(void) addBarButton
{
    for (int i = 0 ; i < 5 ;  i ++) {
        UITabbarButton *btn = [[UITabbarButton alloc] init];
        
        //按钮的高度和位置；
        CGFloat btnW = self.frame.size.width/5;
        CGFloat btnx = i * btnW;
        CGFloat btny = 0;
        CGFloat btnh = self.frame.size.height;
        
        btn.frame = CGRectMake(btnx, btny, btnW, btnh);
        NSString *imageName = [NSString stringWithFormat:@"ic_launcher"];
        NSString *selImageName = [NSString stringWithFormat:@"ic_launcher"];
        NSString *title;
        
        if (i==0) {
            title = @"未完成";
        }else if (i==1)
        {
            title= @"完成";
        }else if (i == 2)
        {
            //            title
            imageName = @"摄影机图标_点击前";
            selImageName =@"摄影机图标_点击后";
            
        }else if (i == 3)
        {
            title = @"时间轴";
        }else if (i == 4)
        {
            title = @"操作日历";
        }
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:selImageName] forState:UIControlStateSelected];
        btn.tag = i;
        if (i!=2) {
            [btn setTitle:title forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize: 11.0];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitleColor:RGB(29, 173, 248) forState:UIControlStateSelected];
            [btn setTitleColor:RGB(128, 128, 128) forState:UIControlStateNormal];
            [self addSubview:btn];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        }
        btn.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //        [self addSubview:btn];
        
        if(i == 0){
            [self btnClick:btn];
        }
        
        
    }
}


-(void) btnClick:(UIButton *)button{
    if (button.tag!=2) {
        
        [self.delegate changeNav:selectBarButton.tag to:button.tag];
        selectBarButton.selected = NO;
        button.selected = YES;
        selectBarButton = (UITabbarButton *)button;
    }else{
        UIActionSheet *sheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"相机",@"相册", nil];
        [sheet showInView:[UIApplication sharedApplication].keyWindow];
        
    }
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"点击了 %ld",(long)buttonIndex);
    if (buttonIndex != 2) {
        //        ImageViewController *imageVC = [[ImageViewController alloc]init];
        MainViewController *tabVC = (MainViewController *)[[UIApplication sharedApplication].delegate window].rootViewController;
        //        [tabVC.selectedViewController.childViewControllers.lastObject  presentViewController:imageVC animated:YES completion:^{}];
        
        //        UIImagePickerControllerSourceType type = UIImagePickerControllerSourceTypePhotoLibrary;
        //
        //        if([UIImagePickerController isSourceTypeAvailable:type]){
        //            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //                type = UIImagePickerControllerSourceTypeCamera;
        //            }
        //
        //            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        //            picker.allowsEditing = NO;
        //            picker.delegate   = self;
        //            picker.sourceType = type;
        //
        //            [tabVC.selectedViewController.childViewControllers.lastObject  presentViewController:picker animated:YES completion:^{
        //
        //            }];
        //        }
        
        
    }
    
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:^{
        NSLog(@"image  %@",image);
    }];
    
}


@end
