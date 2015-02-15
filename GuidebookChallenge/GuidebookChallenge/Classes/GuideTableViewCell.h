//
//  GuideTableViewCell.h
//  GuidebookChallenge
//
//  Created by William Hass on 2/15/15.
//  Copyright (c) 2015 LiloHass. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuideTableViewCell : UITableViewCell

@property (weak,nonatomic) IBOutlet UILabel *lblName;
@property (weak,nonatomic) IBOutlet UILabel *lblCityState;
@property (weak,nonatomic) IBOutlet UILabel *lblStartEndDate;
@property (weak,nonatomic) IBOutlet UIImageView *imgViewIcon;
@property (weak,nonatomic) IBOutlet UIActivityIndicatorView *loader;

@end