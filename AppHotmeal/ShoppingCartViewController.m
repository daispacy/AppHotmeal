//
//  ShoppingCartViewController.m
//  AppHotmeal
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "CartCell.h"
#import "cart.h"
@interface ShoppingCartViewController (){
    NSArray*product;
    
}
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *dynamicTVHeight;
@end

@implementation ShoppingCartViewController
@synthesize cartView;
@synthesize cartArray;
@synthesize delegate;

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
    self.cartArray=[[NSMutableArray alloc]init];
    //self.cartArray=[self.delegate getProduct:self];
    //[self.cartView reloadData];
	// Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    self.cartArray=[self.delegate getProduct:self];
    [self.cartView reloadData];
    
}
-(void)viewWillAppear:(BOOL)animated{
    self.cartArray=[self.delegate getProduct:self];
    [self.cartView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [cartArray count];
}


-(void)viewDidLayoutSubviews
{
    CGFloat height = MAX(self.view.bounds.size.height, self.cartView.contentSize.height);
    self.dynamicTVHeight.constant = height;
    [self.view layoutIfNeeded];
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CartCell *cell=[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cart *object = [cartArray objectAtIndex:indexPath.row];
    [cell.quantity addTarget:self action:@selector(checkPrice:) forControlEvents:UIControlEventEditingChanged];
    cell.nameProduct.text=object.name;
    NSNumber *someNumber = [NSNumber numberWithDouble:object.total];
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *someString = [nf stringFromNumber:someNumber];
    
    [cell.price setText:[NSString stringWithFormat:@"%@ VND",someString]];

    //cell.price.text=object.price;
    cell.quantity.text=[NSString stringWithFormat:@"%d",object.quantity];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_btnProcess release];
    [super dealloc];
}

- (IBAction)Process:(id)sender {
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
        UITextField *password = [alertView textFieldAtIndex:1];
        
        NSLog(@"Username: %@\nPassword: %@", username.text, password.text);
    }else if([title isEqualToString:@"Register"]){
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Notice" message:@"Coming soon" delegate:self cancelButtonTitle:@"Thoat" otherButtonTitles:nil, nil];
        [alert setAlertViewStyle:UIAlertViewStyleDefault];
        [alert show];
    }
}
@end
