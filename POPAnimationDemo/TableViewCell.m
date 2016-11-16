//
//  TableViewCell.m
//  POPAnimationDemo
//
//  Created by 胡啸－ Mac on 16/11/16.
//  Copyright © 2016年 gzsc-hx. All rights reserved.
//

#import "TableViewCell.h"
#import "UIFont+Fonts.h"
#import "POP.h"
#import "FontAttribute.h"
#import "ForegroundColorAttribute.h"
#import "NSMutableAttributedString+StringAttribute.h"


@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    }

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    self                 = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.titlelabel      = [[UILabel alloc] initWithFrame:CGRectMake(10, 8, 290, 25)];
    [self.contentView addSubview:self.titlelabel];
    
    self.subTitleLabel           = [[UILabel alloc] initWithFrame:CGRectMake(10, 35, 290, 10)];
    self.subTitleLabel.font      = [UIFont AvenirLightWithFontSize:8.f];
    self.subTitleLabel.textColor = [UIColor grayColor];
    [self.contentView addSubview:self.subTitleLabel];
    
    
    return self;
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    
    [super setHighlighted:highlighted animated:animated];
    
    if (self.highlighted) {
        
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration           = 0.1f;
        scaleAnimation.toValue            = [NSValue valueWithCGPoint:CGPointMake(0.95, 0.95)];
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
        
    }
    else  {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue             = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
        scaleAnimation.velocity            = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
        scaleAnimation.springBounciness    = 25.f;//设置弹性大小(常用)
        [self.titlelabel pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
    }
}

- (void)createAttributedString {
    
    NSString *fullStirng = [NSString stringWithFormat:@"%02ld. %@", (long)self.index, self.title];
    
    NSMutableAttributedString *richString = [[NSMutableAttributedString alloc] initWithString:fullStirng];
    
    {
        FontAttribute *fontAttribute = [FontAttribute new];
        fontAttribute.font           = [UIFont HeitiSCWithFontSize:16.f];
        fontAttribute.effectRange    = NSMakeRange(0, richString.length);
       
        [richString addStringAttribute:fontAttribute];
    }
    
    {
        FontAttribute *fontAttribute = [FontAttribute new];
        fontAttribute.font           = [UIFont fontWithName:@"GillSans-Italic" size:16.f];
        fontAttribute.effectRange    = NSMakeRange(0, 3);
        [richString addStringAttribute:fontAttribute];
    }
    
    {
        ForegroundColorAttribute *foregroundColorAttribute = [ForegroundColorAttribute new];
        foregroundColorAttribute.color                     = [[UIColor blackColor] colorWithAlphaComponent:0.65f];
        foregroundColorAttribute.effectRange               = NSMakeRange(0, richString.length);
        [richString addStringAttribute:foregroundColorAttribute];
    }
    
    {
        ForegroundColorAttribute *foregroundColorAttribute = [ForegroundColorAttribute new];
        foregroundColorAttribute.color                     = [[UIColor redColor] colorWithAlphaComponent:0.65f];
        foregroundColorAttribute.effectRange               = NSMakeRange(0, 3);
        [richString addStringAttribute:foregroundColorAttribute];
    }
    
    self.titlelabel.attributedText = richString;
    self.subTitleLabel.text = [NSString stringWithFormat:@"%@",self.subTitle];
    
    if (self.index % 2) {
        
        self.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.05f];
        
    } else {
        
        self.backgroundColor = [UIColor whiteColor];
    }

}


@end
