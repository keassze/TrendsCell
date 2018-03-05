//
//  SZTrendsCell.h
//  TrendsCell
//
//  Created by 何松泽 on 2018/3/5.
//  Copyright © 2018年 何松泽. All rights reserved.
//

#define SZLabelWidth    260.f

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static NSString *cellNib_SZTrendsCell;

@class SZDataModel;
@interface SZTrendsCell : UITableViewCell

- (void)setCellWithModel:(SZDataModel *)model;

@end
