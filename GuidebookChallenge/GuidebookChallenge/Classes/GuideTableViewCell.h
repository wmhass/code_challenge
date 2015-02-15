//
//  GuideTableViewCell.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideTableViewCell : UITableViewCell

@property (weak,nonatomic) UILabel *lblName;
@property (weak,nonatomic) UILabel *lblCity;
@property (weak,nonatomic) UILabel *lblState;
@property (weak,nonatomic) UILabel *lblStartDate;
@property (weak,nonatomic) UILabel *lblEndDate;

@end