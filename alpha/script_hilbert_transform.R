###
###
HT_DCPERIOD
HT_DCPHASE
HT_PHASOR
HT_SINE
HT_TREDLINE
HT_TRENDMODE

alpha_ht <- function(type = NULL,  symbol = NULL, interval = NULL, series_type = NULL, apikey = NULL, datatype = NULL, storage = FALSE, stream = FALSE){
  
  ### Settings
  user_alpha <- httr::user_agent(Sys.getenv('USERNAME'))
  settings <- list()
  ###
  settings['function']     <- type
  settings['symbol']       <- symbol
  settings['interval']     <- interval
  settings['series_type']  <- series_type
  settings['apikey']       <- '5VMM2FUYI6FMXX77' 
  settings['datatype']     <- datatype
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
      content_list <- jsonlite::fromJSON(content)
    }
  }
  ###
  content_list <- sapply(content_list[2], '[',1:length(content_list[[2]]))
  date <- sapply(attributes(content_list)[2], '[',1:length(content_list))[1]
  date <- unlist(date)
  ###
  data <- do.call(rbind, Map(data.frame, DATE=date, y=content_list,stringsAsFactors =FALSE))
  colnames(data) <- gsub('y.','',names(data))
  rownames(data) <- NULL
  ###
  content <<- data
}

alpha_ht(type = 'HT_PHASOR',  symbol = 'USD', interval = '60min', series_type = 'close', datatype = 'json')


