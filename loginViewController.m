//
//  loginViewController.m
//  AppHotmeal
//
//  Created by admin on 3/13/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "loginViewController.h"
#import "userConnect.h"
#import "userManager.h"
#import "user.h"
@interface loginViewController ()<userManagerDelegate>{
    userManager*_userManager;
    NSArray*_user;
}


@end

@implementation loginViewController
@synthesize user;
@synthesize password;
@synthesize UserArray;
@synthesize ProductCart;
@synthesize total;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.UserArray = [[NSArray alloc]init];
    _userManager=[[userManager alloc]init];
    _userManager.userConnect=[[userConnect alloc]init];
    _userManager.userConnect.delegate=_userManager;
    _userManager.delegate=self;
}
-(void)getDataUser:(NSArray *)data{
    NSLog(@"xem user nay ra sao %@",data);
    _user=data;
}
-(void)getDataUserFailed:(NSError *)error{
    NSLog(@"Loi get user: %@",[error description]);
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [user release];
    [password release];
    [super dealloc];
}
/*
 -(void)initBorderTextView{
 [[self.txtNote layer] setBorderColor:[[UIColor blackColor] CGColor]];
 [[self.txtNote layer] setBorderWidth:2.3];
 [[self.txtNote layer] setCornerRadius:15];
 }
 */
- (IBAction)login:(id)sender {
    [_userManager receiveData:self.user.text password:self.password.text];
}
@end
