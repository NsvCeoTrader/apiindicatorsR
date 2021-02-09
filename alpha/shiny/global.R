### 
if(dir.exists(paste(Sys.getenv('ProgramFiles'),'Google\\Chrome\\Application',sep='\\')) | 
   dir.exists(paste(Sys.getenv('ProgramFiles(x86)'),'Google\\Chrome\\Application',sep='\\'))){
  
  
  options(browser = paste(Sys.getenv('ProgramFiles(x86)'),'Google\\Chrome\\Application\\chrome.exe',sep='\\')) 
  
  
} else {
  
  
  options(browser = paste(Sys.getenv('ProgramFiles'),'Internet Explorer\\iexplore.exe',sep='\\')) 
  
  
}
###
source('C:\\Users\\PiotrM\\Desktop\\alpha\\shiny\\ui.R')
source('C:\\Users\\PiotrM\\Desktop\\alpha\\shiny\\server.R')
###
# runApp(list(ui = ui, server = server),
#        port = getOption('shiny.port', 7549),
#        launch.browser = T,
#        host = getOption('shiny.host', '127.0.0.1'))

### Data & Stream
# Example
# Settings
# Statistics output
# Clean output 
# Range output
# Export 

### Wizaulizacja
# Series Options (Upload / Stream)
# Candlestick Charts (Upload / Stream)
# Upper/Lower Bars (Upload / Stream)

### Stock
# Strategy
# PerformanceAnalytics

### Forex
# Strategy
# 

### Crypto 
# Strategy

library(dygraphs)

lungDeaths <- cbind(ldeaths, mdeaths, fdeaths)
 
wykres <- dygraphs::dygraph(lungDeaths, main = "Deaths from Lung Disease (UK)") 
 
wykres <- dygraphs::dyOptions(wykres,colors = RColorBrewer::brewer.pal(3, "Set2"))
 
if(exists('lungDeaths')){
 
   forex_plot <- sapply(lungDeaths, dyOptions)
}




