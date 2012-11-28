# SDStockKit

`SDStockKit` is a simple framework for interacting with Yahoo's Finance API. 


## Demo

Build and run the `SDStockKit Example` project in Xcode to see an inventory of the available `SDStockKit` components.

---

## SDStockManager

Sends request and parses response for stock information from Yahoo Finance API. Requires a delegate that adheres to the `SDStockManagerDelegate` Protocol.
> Requires the `AFNetworking` only available on iOS.

### Example Usage

```objective-c
[[SDStockManager sharedManager] setDelegate:self];
[[SDStockManager sharedManager] stockPriceWithSymbol:@"AAPL"];
```

### Example Delegate Methods
```objective-c
-(void)didRecieveStockInfo:(NSDictionary*)stockInfo{
  NSLog(@"STOCKINFO: %@",stockInfo);
}

-(void)didRecieveStockPrice:(NSNumber *)stockPrice forSymbol:(NSString*)symbol{
    NSLog(@"Stock: %@ Price: %@",symbol,stockPrice);
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:symbol,@"Symbol",stockPrice,@"Price", nil];
    [_stocks addObject:dict];
    [self.tableView reloadData];
}
```

### Example `stockPriceWithSymbol` Response
```
    AfterHoursChangeRealtime = "N/A - N/A";
    AnnualizedGain = "<null>";
    Ask = "584.79";
    AskRealtime = "584.79";
    AverageDailyVolume = 19559700;
    Bid = "583.35";
    BidRealtime = "583.35";
    BookValue = "125.861";
    Change = "-4.75";
    ChangeFromFiftydayMovingAverage = "-5.31";
    ChangeFromTwoHundreddayMovingAverage = "-26.296";
    ChangeFromYearHigh = "-120.29";
    ChangeFromYearLow = "+207.10";
    ChangePercentRealtime = "N/A - -0.81%";
    ChangeRealtime = "-4.75";
    "Change_PercentChange" = "-4.75 - -0.81%";
    ChangeinPercent = "-0.81%";
    Commission = "<null>";
    DaysHigh = "590.42";
    DaysLow = "580.10";
    DaysRange = "580.10 - 590.42";
    DaysRangeRealtime = "N/A - N/A";
    DaysValueChange = "- - -0.81%";
    DaysValueChangeRealtime = "N/A - N/A";
    DividendPayDate = "Nov 15";
    DividendShare = "5.30";
    DividendYield = "0.90";
    EBITDA = "58.518B";
    EPSEstimateCurrentYear = "49.28";
    EPSEstimateNextQuarter = "12.41";
    EPSEstimateNextYear = "57.95";
    EarningsShare = "44.15";
    ErrorIndicationreturnedforsymbolchangedinvalid = "<null>";
    ExDividendDate = "Nov  7";
    FiftydayMovingAverage = "590.09";
    HighLimit = "<null>";
    HoldingsGain = "<null>";
    HoldingsGainPercent = "- - -";
    HoldingsGainPercentRealtime = "N/A - N/A";
    HoldingsGainRealtime = "<null>";
    HoldingsValue = "<null>";
    HoldingsValueRealtime = "<null>";
    LastTradeDate = "11/27/2012";
    LastTradePriceOnly = "584.78";
    LastTradeRealtimeWithTime = "N/A - <b>584.78</b>";
    LastTradeTime = "4:00pm";
    LastTradeWithTime = "Nov 27 - <b>584.78</b>";
    LowLimit = "<null>";
    MarketCapRealtime = "<null>";
    MarketCapitalization = "550.1B";
    MoreInfo = cnsprmiIed;
    Name = "Apple Inc.";
    Notes = "<null>";
    OneyrTargetPrice = "757.77";
    Open = "589.60";
    OrderBookRealtime = "<null>";
    PEGRatio = "0.58";
    PERatio = "13.35";
    PERatioRealtime = "<null>";
    PercebtChangeFromYearHigh = "-17.06%";
    PercentChange = "-0.81%";
    PercentChangeFromFiftydayMovingAverage = "-0.90%";
    PercentChangeFromTwoHundreddayMovingAverage = "-4.30%";
    PercentChangeFromYearLow = "+54.83%";
    PreviousClose = "589.53";
    PriceBook = "4.68";
    PriceEPSEstimateCurrentYear = "11.96";
    PriceEPSEstimateNextYear = "10.17";
    PricePaid = "<null>";
    PriceSales = "3.54";
    SharesOwned = "<null>";
    ShortRatio = "0.80";
    StockExchange = NasdaqNM;
    Symbol = AAPL;
    TickerTrend = "&nbsp++-===&nbsp";
    TradeDate = "<null>";
    TwoHundreddayMovingAverage = "611.076";
    Volume = 19046922;
    YearHigh = "705.07";
    YearLow = "377.68";
    YearRange = "377.68 - 705.07";
    symbol = AAPL;

```

### Example `stockPriceWithSymbol` Response

```584.78
```
---

## Contact

Steve Derico

- http://github.com/stevederico
- http://twitter.com/stevederico
- http://blog.stevederico.com

## License

SDStockKit is available under the MIT license. See the LICENSE file for more info.
