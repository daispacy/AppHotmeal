//
//  userBuidler.m
//  AppHotmeal
//
//  Created by admin on 3/13/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "userBuidler.h"
#import "user.h"
@implementation userBuidler
+(NSArray*)getDataUser:(NSData *)data error:(NSError **)error{
    NSError*err=nil;
    NSDictionary *parseObject=[NSJSONSerialization JSONObjectWithData:data options:kNilOptions  error:&err];
    NSLog(@"%@",parseObject);
    if(err!=nil){
        *error=err;
        return nil;
    }
    // NSArray *results = [parseObject allValues];
    //NSLog(@"Count %d", parseObject.count);
    //NSLog(@"%@",parseObject);
    NSMutableArray *estores=[[NSMutableArray alloc]init];
            
        user *es=[[user alloc]init];
        [es setAddress:[parseObject objectForKey:@"properties"]];
        [es setId:[parseObject objectForKey:@"store_id"]];
        [es setName:[parseObject objectForKey:@"id"]];
        [es setEmail:[parseObject objectForKey:@"name"]];
        [es setPhone:[parseObject objectForKey:@"price"]];
        [estores addObject:es];
    
    return estores;
}

@end
