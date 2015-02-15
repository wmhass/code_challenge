//
//  GuideTableViewCell.m
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import "GuideTableViewCell.h"

@implementation GuideTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse {
    [super prepareForReuse];
    [self resetLabels];
}

- (void)resetLabels {
    self.lblCity.text = @"";
    self.lblEndDate.text = @"";
    self.lblName.text = @"";
    self.lblStartDate.text = @"";
    self.lblState.text = @"";
}

@end
