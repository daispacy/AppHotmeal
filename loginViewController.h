//
//  loginViewController.h
//  AppHotmeal
//
//  Created by admin on 3/13/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController{
    
    IBOutlet UITextField *user;
    
    IBOutlet UITextField *password;
}
@property (retain, nonatomic) IBOutlet UITextField *user;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property(assign,nonatomic)NSInteger total;
@property(strong,nonatomic)NSArray* ProductCart;
@property(strong,nonatomic)NSArray* UserArray;
- (IBAction)login:(id)sender;

@end
