//
//  CollectionViewCell.m
//  WaterfallsFlow
//
//  Created by MyMac on 15/9/21.
//  Copyright © 2015年 MyMac. All rights reserved.
//

#import "CollectionViewCell.h"
#import "UIImageView+WebCache.h"


@interface CollectionViewCell ()

@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *name;
//@property (nonatomic,strong) UILabel *votes;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.name];
}

- (void)setLists:(NewEdorsementLists *)lists{
    _lists = lists;
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:lists.img]];
    self.name.text = lists.name;
    
    //    NSLog(@"%@",lists.name);
    
}

#pragma mark - setting frames
- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    self.imgView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    self.name.frame = CGRectMake(0, self.imgView.frame.size.height - 50, self.imgView.frame.size.width, 50);
    
}

#pragma mark - getter and setter
- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc] init];
        _imgView.backgroundColor = [UIColor orangeColor];
    }
    return _imgView;
}

- (UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    }
    return _name;
}

@end
