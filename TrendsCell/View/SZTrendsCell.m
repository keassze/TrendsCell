//
//  SZTrendsCell.m
//  TrendsCell
//
//  Created by 何松泽 on 2018/3/5.
//  Copyright © 2018年 何松泽. All rights reserved.
//

#import "SZTrendsCell.h"
#import "SZDataModel.h"
#import <SDAutoLayout.h>


@interface SZTrendsCell()

@property (nonatomic, strong) UILabel *describeLabel;

@end

@implementation SZTrendsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.describeLabel.sd_layout
        .topSpaceToView(self.contentView, 5)
        .bottomSpaceToView(self.contentView, 5)
        .widthIs(SZLabelWidth);

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setCellWithModel:(SZDataModel *)model
{
    [self.describeLabel setText:model.content];
}

- (UILabel *)describeLabel
{
    if (!_describeLabel) {
        _describeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, SZLabelWidth, 12)];
        _describeLabel.backgroundColor = [UIColor redColor];
        _describeLabel.font = [UIFont systemFontOfSize:12.f];
        _describeLabel.textColor = [UIColor colorWithRed:50.0f/255.0f green:50.0f/255.0f blue:50.0f/255.0f alpha:0.8f];
        _describeLabel.numberOfLines = 0;  //自动换行
        [self.contentView addSubview:_describeLabel];
    }
    return _describeLabel;
}

@end
