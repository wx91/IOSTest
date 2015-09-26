//
//  JKCustomAlert.h
//  CustomAlertViewDemo
//
//  Created by wangx on 15/9/23.
//  Copyright © 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol JKCustomAlertDelegate <NSObject>

@optional
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end

@interface JKCustomAlert : UIAlertView

@property(nonatomic,retain)NSMutableArray *_buttonArrays;

@property(nonatomic,retain)UIImage *backgroundImage;

@property(nonatomic,retain)UIImage *contentImage;

@property(nonatomic,assign)id<JKCustomAlertDelegate> customDelegate;

-(instancetype)initwithImage:(UIImage *)image contentImage:(UIImage *)content;

-(void)addButtonWithUIButton:(UIButton *)btn;

@end
