server <- function(input, output, session) {
  ###
  v <- reactiveValues(valueButton = 0)
  ### STOCK 
  ##
  observeEvent(input$STOCK_UPLOAD, {
    shinyjs::toggle(id = "STOCK_LOAD", anim = T,animType = "slide", time = 0.5)
  })
  ##
  observeEvent(input$STOCK_LOAD1, {
    shinyjs::toggle(id = "STOCK_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$STOCK_LOAD2, {
    shinyjs::toggle(id = "STOCK_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$STOCK_LOAD3, {
    shinyjs::toggle(id = "STOCK_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$STOCK_LOAD4, {
    shinyjs::toggle(id = "STOCK_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$STOCK_LOAD5, {
    shinyjs::toggle(id = "STOCK_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  ### FOREX 
  ##
  observeEvent(input$FOREX_UPLOAD, {
    shinyjs::toggle(id = "FOREX_LOAD", anim = T,animType = "slide", time = 0.5)
  })
  ##
  observeEvent(input$FOREX_LOAD1, {
    shinyjs::toggle(id = "FOREX_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$FOREX_LOAD2, {
    shinyjs::toggle(id = "FOREX_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$FOREX_LOAD3, {
    shinyjs::toggle(id = "FOREX_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$FOREX_LOAD4, {
    shinyjs::toggle(id = "FOREX_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$FOREX_LOAD5, {
    shinyjs::toggle(id = "FOREX_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  ### CRYPTO 
  ##
  observeEvent(input$CRYPTO_UPLOAD, {
    shinyjs::toggle(id = "CRYPTO_LOAD", anim = T,animType = "slide", time = 0.5)
  })
  ##
  observeEvent(input$CRYPTO_LOAD1, {
    shinyjs::toggle(id = "CRYPTO_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$CRYPTO_LOAD2, {
    shinyjs::toggle(id = "CRYPTO_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$CRYPTO_LOAD3, {
    shinyjs::toggle(id = "CRYPTO_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$CRYPTO_LOAD4, {
    shinyjs::toggle(id = "CRYPTO_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  observeEvent(input$CRYPTO_LOAD5, {
    shinyjs::toggle(id = "CRYPTO_SETTINGS", anim = T,animType = "slide", time = 0.5)
  })
  
  
  
  ###
  observeEvent(input$Submit, {
    shinyjs::disable(id = 'DATASTREAM')
    shinyjs::disable(id = 'DATASTREAM1')
    shinyjs::disable(id = 'HidTransPol')
    shinyjs::disable(id = 'HidGridDiv')
    shinyjs::disable(id = 'CheckButGA_Go')
    shinyjs::reset(id = 'ResGA')
    shinyjs::show(id = 'ResGA', anim = T, animType = 'fade', time = 0.1)
  })
  
  ### DATA STOCK
  
  
  
}




