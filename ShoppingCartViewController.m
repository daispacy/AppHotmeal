//
//  ShoppingCartViewController.m
//  AppHotmeal
//
//  Created by admin on 3/10/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ShoppingCartViewController.h"
#import "loginViewController.h"
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
@synthesize totalCart;
@synthesize txtTotalCart;
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
    self.totalCart=[self.delegate getTotalCart:self];
    NSLog(@"%d",self.totalCart);
    self.cartArray=[self.delegate getProduct:self];
    NSNumber *someNumber = [NSNumber numberWithDouble:self.totalCart];
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *someString = [nf stringFromNumber:someNumber];
    
    [self.txtTotalCart setText:[NSString stringWithFormat:@"%@ VND",someString]];
    self.cartArray=[self.delegate getProduct:self];
    [self.cartView reloadData];
    
}
-(void)viewWillAppear:(BOOL)animated{
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
    if(indexPath.row<self.cartArray.count){
    cart *object = [self.cartArray objectAtIndex:indexPath.row];
    [cell.quantity addTarget:self action:@selector(checkPrice:) forControlEvents:UIControlEventEditingChanged];
    cell.nameProduct.text=object.name;
    NSNumber *someNumber = [NSNumber numberWithDouble:object.total];
    
    NSNumberFormatter *nf = [[NSNumberFormatter alloc] init];
    [nf setNumberStyle:NSNumberFormatterDecimalStyle];
    NSString *someString = [nf stringFromNumber:someNumber];
    
    [cell.price setText:[NSString stringWithFormat:@"%@ VND",someString]];

    //cell.price.text=object.price;
    cell.quantity.text=[NSString stringWithFormat:@"%d",object.quantity];
    }
    return cell;
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"processCart"]) {
        loginViewController *processViewController= segue.destinationViewController;
        processViewController.ProductCart = self.cartArray;
        processViewController.total = self.totalCart;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_btnProcess release];
    [txtTotalCart release];
    [super dealloc];
}

- (IBAction)Process:(id)sender {
}
@end
