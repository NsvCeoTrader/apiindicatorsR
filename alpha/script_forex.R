###
library(tidyverse)
###
cross.join <- function(a, b) {
  idx <- expand.grid(seq(length=nrow(a)), seq(length=nrow(b)))
  cbind(a[idx[,1],], b[idx[,2],])
}
###
alpha_forex <- function(type = NULL, from_symbol = NULL, to_symbol = NULL, interval = NULL, 
                        outputsize = NULL, apikey = NULL, datatype = NULL, storage = FALSE, stream = FALSE){
  
  #currency_list <- suppressMessages(rio::import('https://www.alphavantage.co/physical_currency_list.html'))
  ###
  #if(exists('currency_list')){
  #  colnames(currency_list) <- gsub(' ','_',names(currency_list))
  #  currency_list$currency_name <- NULL
  #  currency_list <- data.frame(cross.join(currency_list,currency_list))
  #  currency_list$remove <- ifelse(currency_list$X1==currency_list$X2,'TRUE','FALSE')
  #  currency_list <- subset(currency_list, remove=='FALSE', select = c(1:2))
  #}
  ### Settings
  user_alpha <- httr::user_agent(Sys.getenv('USERNAME'))
  settings <- list()
  settings['interval'] <- interval
  ###
  if((settings['interval']=='')) {
    ##
    settings['type']        <- type
    settings['from_symbol'] <- from_symbol
    settings['to_symbol']   <- to_symbol
    settings['outputsize']  <- outputsize
    settings['apikey']      <- 'DPGUIGUX8JSB98T6' # av_api_key()
    settings['datatype']    <- datatype
    ##
    url_params <- stringr::str_c(names(settings), settings, sep = '=', collapse = '&')
    url <- glue::glue('https://www.alphavantage.co/query?function={type}&{url_params}')
    #
    response <- httr::GET(url, user_alpha)
    ### 
  } else {
    ##
    settings['type']        <- type
    settings['from_symbol'] <- from_symbol
    settings['to_symbol']   <- to_symbol
    settings['interval']    <- interval
    settings['outputsize']  <- outputsize
    settings['apikey']      <- 'DPGUIGUX8JSB98T6' # av_api_key()
    settings['datatype']    <- datatype
    # Generate URL
    url_params <- stringr::str_c(names(settings), settings, sep = '=', collapse = '&')
    url <- glue::glue('https://www.alphavantage.co/query?function={type}&{url_params}')
    #
    response <- httr::GET(url, user_alpha)
  }
  ###
  if(exists('response')){
    content_type <- httr::http_type(response)
    if(content_type == 'application/json') {
      content <- httr::content(response, as = 'text', encoding = 'UTF-8')
      content_list <- content %>% jsonlite::fromJSON()
      content_list <- sapply(content_list[2], '[',1:length(content_list[[2]]))
    }
    ##
    for(i in seq_along(content_list)){
      names(content_list) <- gsub('^.*\\.','',names(content_list))
      names(content_list[[i]]) <- gsub('^.*\\. ','',names(content_list[[i]]))
      names(content_list[[i]]) <- gsub(' ','_',names(content_list[[i]]))
      names(content_list[[i]]) <- toupper(names(content_list[[i]]))
      date <- sapply(attributes(content_list)[2], '[',1:length(content_list))[1]
      date <- unlist(date)
    }
  }
  ###
  data <- do.call(rbind, Map(data.frame, DATE=date, y=content_list,stringsAsFactors =FALSE))
  colnames(data) <- gsub('y.','',names(data))
  rownames(data) <- NULL
  ###
  if(type == 'FX_INTRADAY'){
    data$DATE <- lubridate::ymd_hms(data$DATE)
  } else {
    data$DATE <- as.Date(data$DATE, format="%Y-%m-%d")
  }
  ###
  data[,2:length(data)] = data.frame(lapply(data[,2:length(data)], function(x) as.numeric(as.character(x))))
  ###
  ## currency_list <<- currency_list
  baza <<- data
}

dat <- rio::import("alpha/data_stock.RData")

alpha_forex(type = 'FX_DAILY', from_symbol = 'USD', to_symbol = 'PLN', outputsize = 'full', datatype = 'json')
##
demo <- split(currency_list,currency_list$X2)
##
if(exists('dat')){
  demo_stock <- apply(dat, 1, function(x) alpha_forex(type = 'FX_DAILY', from_symbol = x, to_symbol = dat$X2[1], outputsize = 'full', datatype = 'json'))
}


dat <- demo$USD
dat$X1 <- varhandle::unfactor(dat$X1)
dat$X2 <- varhandle::unfactor(dat$X2)

dat <- dat[c(8,25,27,43,46),]

rownames(dat) <- NULL

ty

url <- glue::glue('https://www.alphavantage.co/query?function={type}&{url_params}')


