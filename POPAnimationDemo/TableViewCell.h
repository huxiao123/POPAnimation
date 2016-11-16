//
//  TableViewCell.h
//  POPAnimationDemo
//
//  Created by 胡啸－ Mac on 16/11/16.
//  Copyright © 2016年 gzsc-hx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic,assign)NSInteger index;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;

@property (nonatomic, strong) UILabel  *titlelabel;
@property (nonatomic, strong) UILabel  *subTitleLabel;

- (void)createAttributedString ;

@end
