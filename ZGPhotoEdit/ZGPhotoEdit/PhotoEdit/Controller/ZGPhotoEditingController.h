//
//  ZGPhotoEditingController.h
//  ZGPhotoEdit
//
//  Created by saina_barsud on 2017/12/8.
//  Copyright © 2017年 saina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Photos/Photos.h>


@protocol ZGPhotoEditingControllerDelegate;
@interface ZGPhotoEditingController : UIViewController
@property(nonatomic, strong) UIImage *editImage;
@property(nonatomic, assign) id<ZGPhotoEditingControllerDelegate>  delegate;
@end
@protocol ZGPhotoEditingControllerDelegate <NSObject>
- (void)photoEditController:(ZGPhotoEditingController *)photoEdit didFinishEditAsset:(PHAsset *)asset; // 编辑完成之后返回已经保存的asset
- (void)photoEditControllerDidCancel:(ZGPhotoEditingController *)photoEdit; // 编辑取消

@end
