//
//  CartCell.m
//  AppHotmeal
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "CartCell.h"

@implementation CartCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [_nameProduct release];
    [_quantity release];
    [_price release];
    [super dealloc];
}
- (IBAction)checkPrice:(id)sender {

}
@end
