#### DEMO  #### 

base <- "https://api.hbdm.com/"

endpoint <- "market/history/kline?"

call1 <- paste(base,endpoint,"symbol=BTC",sep="")

get_prices <- GET('https://api.hbdm.com/market/history/kline?period=5min&size=200&symbol=BTC_CQ')
get_prices_text <- content(get_prices, "text")
get_prices_json <- fromJSON(get_prices_text, flatten = TRUE)
get_prices_df <- as.data.frame(get_prices_json)