//
//  FDFeedCell.h
//  UITablebViewDemo
//
//  Created by wangx on 15/9/25.
//  Copyright (c) 2015年 wangx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FDFeedEntity.h"

@interface FDFeedCell : UITableViewCell

@property(nonatomic,strong)UILabel *titleLabel;

@property(nonatomic,strong)UILabel *contentLabel;

@property(nonatomic,strong)UIImageView *contentImageView;

@property(nonatomic,strong)UILabel *usernameLabel;

@property(nonatomic,strong)UILabel *timeLabel;

@property(nonatomic,strong)FDFeedEntity *entity;

@end
