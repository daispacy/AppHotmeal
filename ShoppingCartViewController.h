//
//  ShoppingCartViewController.h
//  AppHotmeal
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "loginViewController.h"
@class ShoppingCartViewController;
@protocol ShoppingCartViewContrllerDelegate <NSObject>

-(NSMutableArray*)getProduct:(ShoppingCartViewController*)controller;
-(NSInteger)getTotalCart:(ShoppingCartViewController*)controller;
@end
@interface ShoppingCartViewController : UIViewController{
    IBOutlet UITableView* cartView;
    NSMutableArray* cartArray;
    id<ShoppingCartViewContrllerDelegate>delegate;
}
@property (retain, nonatomic) IBOutlet UITableView *cartView;
@property (retain, nonatomic) IBOutlet UIButton *btnProcess;
@property(strong,nonatomic)NSMutableArray* cartArray;
@property(assign,nonatomic)NSInteger totalCart;
- (IBAction)Process:(id)sender;
@property (retain, nonatomic) IBOutlet UILabel *txtTotalCart;
@property(strong,nonatomic)id<ShoppingCartViewContrllerDelegate>delegate;
@end
