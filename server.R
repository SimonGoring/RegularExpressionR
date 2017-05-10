
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(dplyr)

shinyServer(function(input, output) {

  text_file <- readr::read_lines("data/raw_file.txt")
  
  
  output$formattedText <- renderText({
    
    if(nchar(input$expression)> 1 & !input$expression %in% c("h1", "h2")) {
      
      expr <- paste0("(",input$expression,")")
      
      replaced <- text_file %>% 
        stringr::str_replace_all(expr,
                             '<span style="background:#FFFF00">\\1</span>') %>% 
        paste0(collapse = "<br>") %>% 
        stringr::str_replace("(A Short Story)",
                             '<h1>\\1</h1>') %>% 
        stringr::str_replace("(References)",
                             '<h2>\\1</h2>')
    } else {
      replaced <- text_file %>% 
        paste0(collapse = "<br>") %>% 
        stringr::str_replace("(A Short Story)",
                             '<h1>\\1</h1>') %>% 
        stringr::str_replace("(References)",
                             '<h2>\\1</h2>')
    }
    
    return(replaced)
    
  })

})
