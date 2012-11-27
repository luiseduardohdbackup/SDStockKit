//
//  SDStockManager.m
//  SimpleStocks
//
//  Created by Steve Derico on 11/26/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//
#import "AFNetworking.h"
#import "SDStockManager.h"

static NSString *yahooLoadStockDetailsURLString = @"http://query.yahooapis.com/v1/public/yql?q=select%%20*%%20from%%20yahoo.finance.quotes%%20where%%20symbol%%20%%3D%%20%%22%@%%22&format=json&env=store%%3A%%2F%%2Fdatatables.org%%2Falltableswithkeys&callback=cbfunc";


@implementation SDStockManager

@synthesize stockSymbol = _stockSymbol;

+(SDStockManager *)sharedManager {
    static SDStockManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[SDStockManager alloc] init];
    });
    
    return _sharedManager;
}

-(void)stockInfoWithSymbol:(NSString*)stockSymbol{

    self.stockSymbol = stockSymbol;
    
    NSURL *requestUrl = [NSURL URLWithString:[NSString stringWithFormat:yahooLoadStockDetailsURLString, [stockSymbol stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]]];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:requestUrl];
    
    AFHTTPRequestOperation *requestOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [requestOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSError *error = nil;
        
        NSString *JSON = [requestOperation.responseString stringByReplacingOccurrencesOfString:@"cbfunc" withString:@""];
        
        NSCharacterSet *doNotWant = [NSCharacterSet characterSetWithCharactersInString:@"();"];
        JSON = [[JSON componentsSeparatedByCharactersInSet: doNotWant] componentsJoinedByString: @""];

        NSData *data =[JSON dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *responseDict =  [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments|NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:&error];

        NSLog(@"DICT %@",[responseDict description]);
        NSLog(@"ERROR %@",[error description]);
        

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"FAILURE: %@",[error description]);
    }];
    [requestOperation start];

}

@end