//
//  EstoreCell.m
//  Hotmeal
//
//  Created by admin on 3/7/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "EstoreCell.h"
@implementation EstoreCell

- (void)dealloc {
    [_status release];
    [_min_delivery release];
    [_like release];
    [super dealloc];
}
@end
