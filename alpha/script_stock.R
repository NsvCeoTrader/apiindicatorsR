### API KEY
# 
setwd('C:\\Users\\PiotrM\\Desktop\\alpha')

sector <- 'Banks'

### Stock Data - exp 
if(!is.null('sector')){
  data_stock <- rio::import('data_stock.RData')
  ticker <- data_stock[data_stock$sector %in% sector,]['ticker']
}


alpha_stock <- function(type = NULL, symbol = NULL, interval = NULL, outputsize = NULL, apikey = NULL, datatype = NULL, sector = NULL, storage = FALSE, stream = FALSE) {
  
  ### Checks
  # if (is.null(av_api_key())) {
  #   stop('Set API key using av_api_key(). If you do not have an API key, please claim your free API key on (https://www.alphavantage.co/support/#api-key). It should take less than 20 seconds, and is free permanently.',
  #        call. = FALSE)
  # }
  
  ### Settings
  user_alpha <- httr::user_agent(Sys.getenv('USERNAME'))
  settings <- list(...)
  settings['interval'] <- interval 
  
  ###
  if((settings['interval']=='')) {
    ##
    settings['type']        <- type
    settings['symbol']      <- symbol
    settings['outputsize']  <- outputsize
    settings['apikey']      <- '5VMM2FUYI6FMXX77' # av_api_key()
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
    settings['symbol']      <- symbol
    settings['interval']    <- interval
    settings['outputsize']  <- outputsize
    settings['apikey']      <- '5VMM2FUYI6FMXX77' # av_api_key()
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
  if(type == 'TIME_SERIES_INTRADAY'){
    data$DATE <- lubridate::ymd_hms(data$DATE)
  } else {
    data$DATE <- as.Date(data$DATE, format="%Y-%m-%d")
  }
  ###
  data[,2:length(data)] = data.frame(lapply(data[,2:length(data)], function(x) as.numeric(as.character(x))))
  ###
  baza <<- data
} 

alpha_stock(type = 'TIME_SERIES_MONTHLY_ADJUSTED', symbol = 'GPW', outputsize = 'full', datatype = 'json')

##
if(exists('ticker')){
  demo_stock <- apply(ticker, 1, function(x) alpha_stock(type = 'TIME_SERIES_DAILY_ADJUSTED', symbol = x, outputsize = 'full', datatype = 'json'))
}








