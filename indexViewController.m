//
//  indexViewController.m
//  AppHotmeal
//
//  Created by admin on 3/7/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "indexViewController.h"
#import "ListingViewController.h"
#import "selectCell.h"
@interface indexViewController ()

@end

@implementation indexViewController
@synthesize btnNext;
@synthesize selectArea;
@synthesize nameArea;
@synthesize idA;
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@",self.nameArea);
}
-(NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    //return 100;
}
-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"%@",self.nameArea);
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    selectCell *cell=[self.selectArea dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if(self.nameArea==nil){
    [cell.nameArea setText:@"Chọn quận"];
    }else{
       [cell.nameArea setText:self.nameArea];
    }
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [btnNext release];
    [selectArea release];
    [super dealloc];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"idArea"]) {
        ListingViewController *listingViewController= segue.destinationViewController;
        listingViewController.idArea = self.idA;
        
    }
}

- (IBAction)btnNext:(id)sender {
    NSLog(@"test");
}
@end
