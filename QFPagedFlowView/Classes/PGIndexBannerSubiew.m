//
//  PGIndexBannerSubiew.m
//  NewPagedFlowViewDemo
//
//  Created by Mars on 16/6/18.
//  Copyright © 2016年 Mars. All rights reserved.
//  Designed By PageGuo,
//  QQ:799573715
//  github:https://github.com/PageGuo/NewPagedFlowView

#import "PGIndexBannerSubiew.h"


@interface PGIndexBannerSubiew ()

@property (nonatomic,strong) UIView *shdowBg;

@end

@implementation PGIndexBannerSubiew

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self addSubview:self.shdowBg];
        [self addSubview:self.mainImageView];
        [self addSubview:self.coverView];
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleCellTapAction:)];
        [self addGestureRecognizer:singleTap];
    }
    
    return self;
}

- (void)singleCellTapAction:(UIGestureRecognizer *)gesture {
    if (self.didSelectCellBlock) {
        self.didSelectCellBlock(self.tag, self);
    }
}

- (void)setSubviewsWithSuperViewBounds:(CGRect)superViewBounds {
    
    if (CGRectEqualToRect(self.mainImageView.frame, superViewBounds)) {
        return;
    }
    
    self.coverView.frame = superViewBounds;
    superViewBounds.size.height -= 14;
    //底部投影
    self.shdowBg.frame = CGRectMake(superViewBounds.origin.x+4, superViewBounds.origin.y+superViewBounds.size.height-3, superViewBounds.size.width-8, 3);
    self.mainImageView.frame = superViewBounds;
    
}

- (UIView *)shdowBg{
    if (_shdowBg == nil) {
        
        _shdowBg = [[UIView alloc] init];
        _shdowBg.backgroundColor = [UIColor whiteColor];
        _shdowBg.layer.cornerRadius = 6;//圆角
        _shdowBg.layer.shadowColor = [UIColor blackColor].CGColor;
        _shdowBg.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);//偏移量
        _shdowBg.layer.shadowOpacity= 1;//投影透明度
        _shdowBg.layer.shadowRadius = 6;//投影半径
        _shdowBg.layer.borderWidth = 0.5;
        _shdowBg.layer.borderColor = [UIColor colorWithRed:31/255.0f green:31/255.0f blue:31/255.0f alpha:1].CGColor;
        _shdowBg.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);//偏移量
    }
    return _shdowBg;
}
- (UIImageView *)mainImageView {
    
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.userInteractionEnabled = YES;
    }
    return _mainImageView;
}

- (UIView *)coverView {
    if (_coverView == nil) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor whiteColor];
    }
    return _coverView;
}

@end
