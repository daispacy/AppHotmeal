//
//  ProcessCartViewController.m
//  AppHotmeal
//
//  Created by admin on 3/13/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ProcessCartViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ProcessCartViewController()
@end

@implementation ProcessCartViewController
@synthesize total;
@synthesize ProductCart;
@synthesize User;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
       
	//display alert login
    //[self initBorderTextView];
    //[self alert];
    
}

-(void)alert{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Login"
                                                      message:nil
                                                     delegate:self
                                            cancelButtonTitle:@"Register"
                                            otherButtonTitles:@"Login", nil];
    
    [message setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
    
    [message show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"Login"])
    {
        UITextField *username = [alertView textFieldAtIndex:0];
        UITextField *password1 = [alertView textFieldAtIndex:1];
        //[_userManager receiveData:self.user password:self.password];
    }else if([title isEqualToString:@"Register"]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Coming soon" delegate:self cancelButtonTitle:@"Thoat" otherButtonTitles:nil, nil];
        [alert setAlertViewStyle:UIAlertViewStyleDefault];
        [alert show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [super dealloc];
}

@end
