require(shiny)
require(shinydashboard)

ui <- fluidPage(
  
  theme = shinythemes::shinytheme('lumen'),
  
  shinyjs::useShinyjs(),
  
  tags$style(HTML('::selection {background: tomato}')),
  
  navbarPage(
    ###
    title=' Zdam! ',
    tabPanel(' Data & Stream ',
             sidebarLayout(
               fluid = TRUE,
               ###
               div(id='DATASTREAM',
                   sidebarPanel(
                     ###
                     br(),
                     tags$div(id='STOCK',
                              h4(' STOCK '),
                              # p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'STOCK_UPLOAD', label = ' Upload ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'STOCK_STREAM', label = ' Stream ', width = '100%'))
                     ),
                     ###
                     br(),
                     tags$div(id='FOREX',
                              h4(' FOREX '),
                              # p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'FOREX_UPLOAD', label = ' Upload ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'forex_stream', label = ' Stream ', width = '100%'))
                     ),
                     ####
                     br(),
                     tags$div(id='CRYPTO',
                              h4(' CRYPTO '),
                              # p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'CRYPTO_UPLOAD', label = ' Upload ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'crypto_stream', label = ' Stream ', width = '100%'))
                     )
                   )
               ),
               ###
               mainPanel(
                 tags$div(id='DATASTREAM_SETTINGS',
                          tabsetPanel(
                            tabPanel(' TUTORIAL '),
                            ###
                            tabPanel(' STOCK ',
                                     div(id = 'STOCK_DATA',
                                         ##
                                         shinyjs::hidden(
                                           div(id='STOCK_LOAD', 
                                               fluidRow(
                                                 actionButton('STOCK_LOAD1', label = 'USD/EUR', width = '20%'),
                                                 actionButton('STOCK_LOAD2', label = 'USD/CHF', width = '20%'),
                                                 actionButton('STOCK_LOAD3', label = 'USD/GBP', width = '20%'),
                                                 actionButton('STOCK_LOAD4', label = 'USD/JPY', width = '20%'),
                                                 actionButton('STOCK_LOAD5', label = 'USD/XAU', width = '19%'),
                                                 shinyjs::hidden( 
                                                   div(id='STOCK_SETTINGS', 
                                                       fluidRow(
                                                         box(title = 'Minimum number of movies - director', status = 'info', solidHeader = T, width = NULL,
                                                             
                                                             # selectizeInput 
                                                             
                                                             sliderInput(inputId = 'min_movies_dir', label = NULL, min = 1, max = 15, value = 8)
                                                             
                                                         )
                                                       )
                                                   )
                                                 )
                                               )
                                           )
                                         )
                                     )
                            ),
                            ###
                            tabPanel(' FOREX ',
                                     div(id = 'FOREX_DATA',
                                         ##
                                         shinyjs::hidden(
                                           div(id='FOREX_LOAD', 
                                               fluidRow(
                                                 actionButton('FOREX_LOAD1', label = 'USD/EUR', width = '20%'),
                                                 actionButton('FOREX_LOAD2', label = 'USD/CHF', width = '20%'),
                                                 actionButton('FOREX_LOAD3', label = 'USD/GBP', width = '20%'),
                                                 actionButton('FOREX_LOAD4', label = 'USD/JPY', width = '20%'),
                                                 actionButton('FOREX_LOAD5', label = 'USD/XAU', width = '19%'),
                                                 shinyjs::hidden( 
                                                   div(id='FOREX_SETTINGS', 
                                                       fluidRow(
                                                         box(title = 'Minimum number of movies - director', status = 'info', solidHeader = T, width = NULL,
                                                             sliderInput(inputId = 'min_movies_dir', label = NULL, min = 1, max = 15, value = 8)
                                                             
                                                         )
                                                       )
                                                   )
                                                 )
                                               )
                                           )
                                         )
                                     )
                            ),
                            ###
                            tabPanel(' CRYPTO ',
                                     div(id = 'CRYPTO_DATA',
                                         ##
                                         shinyjs::hidden(
                                           div(id='CRYPTO_LOAD', 
                                               fluidRow(
                                                 actionButton('CRYPTO_LOAD1', label = 'USD/EUR', width = '20%'),
                                                 actionButton('CRYPTO_LOAD2', label = 'USD/CHF', width = '20%'),
                                                 actionButton('CRYPTO_LOAD3', label = 'USD/GBP', width = '20%'),
                                                 actionButton('CRYPTO_LOAD4', label = 'USD/JPY', width = '20%'),
                                                 actionButton('CRYPTO_LOAD5', label = 'USD/XAU', width = '19%'),
                                                 shinyjs::hidden( 
                                                   div(id='CRYPTO_SETTINGS', 
                                                       fluidRow(
                                                         box(title = 'Minimum number of movies - director', status = 'info', solidHeader = T, width = NULL,
                                                             sliderInput(inputId = 'min_movies_dir', label = NULL, min = 1, max = 15, value = 8)
                                                             
                                                         )
                                                       )
                                                   )
                                                 )
                                               )
                                           )
                                         )
                                     )
                            )
                          )
                 )
               )
             )
    ),
    ###
    tabPanel(' Wizualizacja ',
             sidebarLayout(
               fluid = TRUE,
               ###
               div(id='WIZU_IN',
                   sidebarPanel(
                     ###
                     br(),
                     tags$div(id='POCSBO0',
                              h4('SERIES OPTIONS'),
                              p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' STOCK ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' FOREX ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' CRYPTO ', width = '100%'))
                     ),
                     ###
                     br(),
                     tags$div(id='POCSBO0',
                              h4('CANDLESTICK'),
                              p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' STOCK ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' FOREX ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' CRYPTO ', width = '100%'))
                     ),
                     ####
                     br(),
                     tags$div(id='POCSBO0',
                              h4('UPPER/LOWER BARS'),
                              p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' STOCK ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' FOREX ', width = '100%')),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = ' CRYPTO ', width = '100%'))
                     )
                   )
               ),
               ###
               div(id='WIZU_OUT',
                   mainPanel(
                     tabsetPanel(
                       tabPanel('Standalone'),
                       tabPanel('Stream')
                     )
                   )
               )
             )
    ),
    ### Stock 
    tabPanel(' Stock ',
             sidebarLayout(
               fluid = TRUE,
               ###
               div(id='ALLINPUTS',
                   sidebarPanel(
                     ###
                     br(),
                     tags$div(id='POCSBO0',
                              h4('Strategie'),
                              p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia I', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia II', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia III', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia IV', width = '100%'))
                     )
                   )
               ),
               ###
               div(id='ALLINPUTS',
                   mainPanel(
                     tabsetPanel(
                       tabPanel('Strategia I'),
                       tabPanel('Strategia II'),
                       tabPanel('Strategia III'),
                       tabPanel('Strategia IV')
                     )
                   )
               )
             )
    ),
    ### Forex
    tabPanel(' Forex ',
             sidebarLayout(
               fluid = TRUE,
               ###
               div(id='ALLINPUTS',
                   sidebarPanel(
                     ###
                     br(),
                     tags$div(id='POCSBO0',
                              h4('Strategie'),
                              p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia I', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia II', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia III', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia IV', width = '100%'))
                     )
                   )
               ),
               ###
               div(id='ALLINPUTS',
                   mainPanel(
                     tabsetPanel(
                       tabPanel('Strategia I'),
                       tabPanel('Strategia II'),
                       tabPanel('Strategia III'),
                       tabPanel('Strategia IV')
                     )
                   )
               )
             )
    ),
    ### Crypto
    tabPanel(' Crypto ',
             sidebarLayout(
               fluid = TRUE,
               ###
               div(id='ALLINPUTS',
                   sidebarPanel(
                     ###
                     br(),
                     tags$div(id='POCSBO0',
                              h4('Strategie'),
                              p(''),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia I', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia II', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia III', width = '100%')),
                              br(),
                              div(id='runExCol', style='margin:20px;',
                                  actionButton(inputId = 'runExample', label = 'Strategia IV', width = '100%'))
                     )
                   )
               ),
               ###
               div(id='ALLINPUTS',
                   mainPanel(
                     tabsetPanel(
                       tabPanel('Strategia I'),
                       tabPanel('Strategia II'),
                       tabPanel('Strategia III'),
                       tabPanel('Strategia IV')
                     )
                   )
               )
             )
    )
  )
)


