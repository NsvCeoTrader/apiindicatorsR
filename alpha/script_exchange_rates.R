###
alpha_exchange_rate <- function(from_currency = NULL,  to_currency = NULL, apikey = NULL, datatype = NULL, storage = FALSE, stream = FALSE){
  
  ### Settings
  user_alpha <- httr::user_agent(Sys.getenv('USERNAME'))
  settings <- list()
  ###
  settings['function']      <- 'CURRENCY_EXCHANGE_RATE'
  settings['from_currency'] <- from_currency
  settings['to_currency']   <- to_currency
  settings['apikey']        <- '5VMM2FUYI6FMXX77' 
  settings['datatype']      <- datatype
  ### Generate URL
  url_params <- stringr::str_c(names(settings), settings, sep = '=', collapse = '&')
  url <- glue::glue('https://www.alphavantage.co/query?{url_params}')
  #
  response <- httr::GET(url, user_alpha)
  ###
  if(exists('response')){
    content_type <- httr::http_type(response)
    if(content_type == 'application/json') {
      content <- httr::content(response, as = 'text', encoding = 'UTF-8')
      content_list <- content %>% jsonlite::fromJSON()
    }
  ###
    for(i in seq_along(content_list)){
      names(content_list) <- gsub('^.*\\.','',names(content_list))
      names(content_list[[i]]) <- gsub('^.*\\. ','',names(content_list[[i]]))
      names(content_list[[i]]) <- gsub(' ','_',names(content_list[[i]]))
      names(content_list[[i]]) <- toupper(names(content_list[[i]]))
    }
    ###
    data <- list()
    data[[1]] <- content_list[[1]][c('FROM_CURRENCY_CODE', 'TO_CURRENCY_CODE', 'EXCHANGE_RATE', 'LAST_REFRESHED', 'BID_PRICE', 'ASK_PRICE')]
    data <- as.data.frame(data,stringsAsFactors=FALSE)
    ###
    rm(content_list)
  }
  ###
  data$LAST_REFRESHED <- lubridate::ymd_hms(data$LAST_REFRESHED)
  data <- subset(data, select = c(4,1:3,5:6))
  data[,4:6] <- data.frame(lapply(data[,4:6], function(x) as.numeric(as.character(x))))
  ###
  baza <<- data
}

alpha_exchange_rate(from_currency = 'USD',  to_currency = 'NZD', datatype = 'json')
##
if(exists('dat')){
  demo_stock <- apply(dat, 1, function(x) alpha_exchange_rate(from_currency = x,  to_currency = dat$X2[1], datatype = 'json'))
}

dat <- data.frame(X1 = c('GBP', 'CHF', 'EUR'),
                  X2 = 'USD')
dat$X1 <- varhandle::unfactor(dat$X1)
dat$X2 <- varhandle::unfactor(dat$X2)






