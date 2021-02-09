library(shiny)

ui <- fluidPage(
  sidebarLayout(position = "left",
                sidebarPanel("Controls",
                             actionButton("gogobutt","Go"),
                             actionButton("stopbutt","Stop"),
                             actionButton("resetbutt","Reset")),
                
                mainPanel("Plot",
                          plotOutput("histplot")
                )
  ))
server <- function(input,output,session) {
  rv <- reactiveValues(x=rnorm(1),run=F)
  
  autoInvalidate <- reactiveTimer(intervalMs=500,session)
  
  observe({
    autoInvalidate()
    isolate({ if (rv$run) { rv$x <- c(rv$x,rnorm(1)) } })
  })
  
  observeEvent(input$gogobutt, { isolate({ rv$run=T      }) })
  observeEvent(input$stopbutt, { isolate({ rv$run=F      }) })
  observeEvent(input$resetbutt,{ isolate({ rv$x=rnorm(1) }) })
  
  output$histplot <- renderPlot({
    htit <- sprintf("Hist of %d rnorms",length(rv$x))
    hist(rv$x,col = "steelblue",main=htit,breaks=12)
  })
}
shinyApp(ui, server)