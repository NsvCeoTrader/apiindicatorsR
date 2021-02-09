alpha_crypto <- function(type = NULL, symbol = NULL, market = NULL, apikey = NULL, datatype = NULL, sector = NULL, storage = FALSE, stream = FALSE) {
  
  ### Checks
  # if (is.null(av_api_key())) {
  #   stop('Set API key using av_api_key(). If you do not have an API key, please claim your free API key on (https://www.alphavantage.co/support/#api-key). It should take less than 20 seconds, and is free permanently.',
  #        call. = FALSE)
  # }
  
  ### Settings
  user_alpha <- httr::user_agent(Sys.getenv('USERNAME'))
  settings <- list()
  settings['type']      <- type
  settings['symbol']    <- symbol
  settings['market']    <- market
  settings['apikey']    <- '5VMM2FUYI6FMXX77' # av_api_key()
  settings['datatype']  <- datatype
  ### Generate URL
  url_params <- stringr::str_c(names(settings), settings, sep = '=', collapse = '&')
  url <- glue::glue('https://www.alphavantage.co/query?function={type}&{url_params}')
  response <- httr::GET(url, user_alpha)
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
      names(content_list[[i]]) <- gsub('^.*\\. ','',names(content_list[[i]]))
      names(content_list[[i]]) <- gsub('.$','',names(content_list[[i]]))
      names(content_list[[i]]) <- toupper(names(content_list[[i]]))
      date <- sapply(attributes(content_list)[2], '[',1:length(content_list))[1]
      date <- unlist(date)
    }
  }
  ###
  data <- do.call(rbind, Map(data.frame, DATE=date, y=content_list,stringsAsFactors =FALSE))
  colnames(data) <- gsub('y.','',names(data))
  data <- janitor::clean_names(data)
  names(data) <- toupper(names(data))
  rownames(data) <- NULL
  ###
  data$DATE <- as.Date(data$DATE, format="%Y-%m-%d")
  ###
  data[,2:length(data)] = data.frame(lapply(data[,2:length(data)], function(x) as.numeric(as.character(x))))
  ###
  baza <<- data
} 

alpha_crypto(type = 'DIGITAL_CURRENCY_MONTHLY', symbol = 'ETH', market = 'PLN', datatype = 'json')

##
if(exists('dat')){
  demo_stock <- apply(dat, 1, function(x) alpha_crypto(type = 'DIGITAL_CURRENCY_DAILY', symbol = x, market = dat$X2[1], datatype = 'json'))
}


dat <- data.frame(X1 = c('BTC', 'ETH', 'XRP'),
                  X2 = 'PLN')
dat$X1 <- varhandle::unfactor(dat$X1)
dat$X2 <- varhandle::unfactor(dat$X2)


