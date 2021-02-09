###
alpha_sector <- function(real_time = FALSE, historical = FALSE, datatype = NULL, storage = FALSE, stream = FALSE) {
  
  ### Checks
  # if (is.null(av_api_key())) {
  #   stop('Set API key using av_api_key(). If you do not have an API key, please claim your free API key on (https://www.alphavantage.co/support/#api-key). It should take less than 20 seconds, and is free permanently.',
  #        call. = FALSE)
  # }
  
  ### Settings
  user_alpha <- httr::user_agent(Sys.getenv('USERNAME'))
  settings <- list()
  ##
  settings['function'] <- 'SECTOR'
  settings['apikey']   <- '5VMM2FUYI6FMXX77' # av_api_key()
  settings['datatype'] <- datatype
  ##
  url_params <- stringr::str_c(names(settings), settings, sep = '=', collapse = '&')
  url <- glue::glue('https://www.alphavantage.co/query?&{url_params}')
  #
  response <- httr::GET(url, user_alpha)
  ###
  if(exists('response')){
    content_type <- httr::http_type(response)
    ###
    if(content_type == 'application/json') {
      content <- httr::content(response, as = 'text', encoding = 'UTF-8')
      content_list <- content %>% jsonlite::fromJSON()
    }
    ###
    names(content_list) <- gsub('^.*\\: ','',names(content_list))
    names(content_list) <- gsub('\\-','_',names(content_list))
    names(content_list) <- gsub('\\(YTD)','',names(content_list))
    names(content_list) <- gsub(' ','_',names(content_list))
    names(content_list) <- gsub('__','_',names(content_list))
    names(content_list) <- gsub('\\_Performance','',names(content_list))
    names(content_list) <- toupper(names(content_list))
    ###
    names(content_list) <- sub('^(.*?)DAY$', 'DAY \\1', names(content_list), perl=T)
    names(content_list) <- gsub('\\_$', '',names(content_list))
    names(content_list) <- gsub(' ','_',names(content_list))
    ### 
    names(content_list) <- sub('^(.*?)MONTH$', 'MONTH \\1', names(content_list), perl=T)
    names(content_list) <- gsub('\\_$', '',names(content_list))
    names(content_list) <- gsub(' ','_',names(content_list))
    ### 
    names(content_list) <- sub('^(.*?)YEAR$', 'YEAR \\1', names(content_list), perl=T)
    names(content_list) <- gsub('\\_$', '',names(content_list))
    names(content_list) <- gsub(' ','_',names(content_list))
    ###
    for(i in seq_along(content_list)){
      for(j in seq_along(content_list)){
        names(content_list[[i]]) <- gsub(' ','_',names(content_list[[i]]))
        names(content_list[[i]]) <- toupper(names(content_list[[i]]))
        content_list[[i]][j] <- gsub('\\%','',content_list[[i]][j])
      }
    }
    ###
    valid.names <- make.names(names(content_list), unique = TRUE)
    valid.names <- gsub('X','',valid.names)
    ###
    for(i in seq_along(valid.names)){
      assign(valid.names[i], as.data.frame(content_list[i],stringsAsFactors=FALSE))
    }
  }  
  ###
  if(exists('DAY_1')){
    names(META_DATA) <- gsub('^.*\\.','',names(META_DATA))
    names(REAL_TIME) <- gsub('^.*\\.','',names(REAL_TIME))
    names(DAY_1) <- gsub('^.*\\.','',names(DAY_1))
    names(DAY_5) <- gsub('^.*\\.','',names(DAY_5))
    names(MONTH_1) <- gsub('^.*\\.','',names(MONTH_1))
    names(MONTH_3) <- gsub('^.*\\.','',names(MONTH_3))
    names(YEAR_TO_DATE) <- gsub('^.*\\.','',names(YEAR_TO_DATE))
    names(YEAR_1) <- gsub('^.*\\.','',names(YEAR_1))
    names(YEAR_3) <- gsub('^.*\\.','',names(YEAR_3))
    names(YEAR_5) <- gsub('^.*\\.','',names(YEAR_5))
    names(YEAR_10) <- gsub('^.*\\.','',names(YEAR_10))
  }
  ###
  META_DATA$LAST_REFRESHED <- gsub('PM ET ','',META_DATA$LAST_REFRESHED)
  META_DATA$LAST_REFRESHED <- as.POSIXct(strptime(META_DATA$LAST_REFRESHED, "%H:%M %m/%d/%Y"))
  YEAR_3  <- YEAR_3[,-11]
  YEAR_5  <- YEAR_5[,-11]
  YEAR_10 <- YEAR_5[,-11]
  ###
  REAL_TIME <- data.frame(lapply(REAL_TIME, function(x) as.numeric(as.character(x))))
  REAL_TIME <- cbind(REAL_TIME,
                     DATE =  META_DATA$LAST_REFRESHED)
  ##
  DAY_1 <- data.frame(lapply(DAY_1, function(x) as.numeric(as.character(x))))
  DAY_1 <- cbind(DAY_1,
                 DATE =  META_DATA$LAST_REFRESHED)
  ##
  DAY_5 <- data.frame(lapply(DAY_5, function(x) as.numeric(as.character(x))))
  DAY_5 <- cbind(DAY_5,
                 DATE =  META_DATA$LAST_REFRESHED)
  ##
  MONTH_1 <- data.frame(lapply(MONTH_1, function(x) as.numeric(as.character(x))))
  MONTH_1 <- cbind(MONTH_1,
                   DATE =  META_DATA$LAST_REFRESHED)
  ##
  MONTH_3 <- data.frame(lapply(MONTH_3, function(x) as.numeric(as.character(x))))
  MONTH_3 <- cbind(MONTH_3,
                   DATE =  META_DATA$LAST_REFRESHED)
  ##
  YEAR_TO_DATE <- data.frame(lapply(YEAR_TO_DATE, function(x) as.numeric(as.character(x))))
  YEAR_TO_DATE <- cbind(YEAR_TO_DATE,
                        DATE =  META_DATA$LAST_REFRESHED)
  ##
  YEAR_1 <- data.frame(lapply(YEAR_1, function(x) as.numeric(as.character(x))))
  YEAR_1 <- cbind(YEAR_1,
                  DATE =  META_DATA$LAST_REFRESHED)
  ##
  YEAR_3 <- data.frame(lapply(YEAR_3, function(x) as.numeric(as.character(x))))
  YEAR_3 <- cbind(YEAR_3,
                  DATE =  META_DATA$LAST_REFRESHED)
  ##
  YEAR_5 <- data.frame(lapply(YEAR_5, function(x) as.numeric(as.character(x))))
  YEAR_5 <- cbind(YEAR_5,
                  DATE =  META_DATA$LAST_REFRESHED)
  ##
  YEAR_10 <- data.frame(lapply(YEAR_10, function(x) as.numeric(as.character(x))))
  YEAR_10 <- cbind(YEAR_10,
                   DATE =  META_DATA$LAST_REFRESHED)
  ###
  REAL_TIME <<- REAL_TIME
  DAY_1 <<- DAY_1
  DAY_5 <<- DAY_5
  MONTH_1 <<- MONTH_1
  MONTH_3 <<- MONTH_3
  YEAR_TO_DATE <<- YEAR_TO_DATE
  YEAR_1 <<- YEAR_1
  YEAR_3 <<- YEAR_3
  YEAR_5 <<- YEAR_5
  YEAR_10 <<- YEAR_10
} 

alpha_sector(real_time = FALSE, historical = FALSE, datatype = 'json')






