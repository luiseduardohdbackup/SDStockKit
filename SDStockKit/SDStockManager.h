//
//  SDStockManager.h
//  SimpleStocks
//
//  Created by Steve Derico on 11/26/12.
//  Copyright (c) 2012 Bixby Apps. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SDStockManagerDelegate <NSObject>

@required

-(void)didRecieveStockInfo:(NSDictionary*)stockInfo;

@end

@interface SDStockManager : NSObject{

    __weak id delegate;

}

@property(nonatomic,strong) NSString *stockSymbol;
@property(nonatomic,weak) id <SDStockManagerDelegate> delegate;
+(SDStockManager *)sharedManager;
-(void)stockInfoWithSymbol:(NSString*)stockSymbol;
@end
