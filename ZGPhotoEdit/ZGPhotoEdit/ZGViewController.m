//
//  ZGViewController.m
//  ZGPhotoEdit
//
//  Created by saina_barsud on 2017/12/8.
//  Copyright © 2017年 saina. All rights reserved.
//

#import "ZGViewController.h"
#import "ZGPhotoEditingController.h"
@interface ZGViewController ()<ZGPhotoEditingControllerDelegate>

@end

@implementation ZGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.navigationItem.title = @"PhotoSelecteVC";
        self.view.backgroundColor = [UIColor whiteColor];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake((self.view.frame.size.width - 200) / 2, 300, 200, 50);
        button.backgroundColor = [UIColor blackColor];
        [button setTitle:@"PhotoEdit" forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
}

- (void)buttonAction:(UIButton *)button {
        ZGPhotoEditingController *edit = [ZGPhotoEditingController new];
        edit.editImage = [UIImage imageNamed:@"background_3"];
        edit.delegate = self;
        [self presentViewController:edit animated:YES completion:nil];
    
}
- (void)photoEditController:(ZGPhotoEditingController *)photoEdit didFinishEditAsset:(PHAsset *)asset{ // 编辑完成之后返回已经保存的asset
        [photoEdit dismissViewControllerAnimated:YES completion:nil];
        NSLog(@"%@", asset);
}
- (void)photoEditControllerDidCancel:(ZGPhotoEditingController *)photoEdit{ // 编辑取消
        [photoEdit dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)prefersStatusBarHidden{
        return NO; // 在返回的控制器中调用本方法(YES隐藏, NO显示) 设置状态栏
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
