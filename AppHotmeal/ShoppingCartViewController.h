//
//  ShoppingCartViewController.h
//  AppHotmeal
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShoppingCartViewController;
@protocol ShoppingCartViewContrllerDelegate <NSObject>

-(NSMutableArray*)getProduct:(ShoppingCartViewController*)controller;

@end
@interface ShoppingCartViewController : UIViewController{
    IBOutlet UITableView* cartView;
    NSMutableArray* cartArray;
    id<ShoppingCartViewContrllerDelegate>delegate;
}
@property (retain, nonatomic) IBOutlet UITableView *cartView;
@property (retain, nonatomic) IBOutlet UIButton *btnProcess;
@property(strong,nonatomic)NSMutableArray* cartArray;
- (IBAction)Process:(id)sender;
@property(strong,nonatomic)id<ShoppingCartViewContrllerDelegate>delegate;
@end
