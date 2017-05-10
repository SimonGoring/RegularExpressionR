
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  tags$head(
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Roboto:400,700');
      @import url('https://fonts.googleapis.com/css?family=Droid+Serif');
      body {
        font-family: 'Droid Serif', serif;
      }
      h1 {
        font-family: 'Roboto';
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }
      h2 {
        font-family: 'Roboto';
        font-weight: 300;
        line-height: 1;
        color: #48ca3b;
      }

    "))
  ),
  titlePanel("Regular Expression Testing"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      width = 4,
      textInput("expression",
                  label = "Regular Expression String:",
                  value = "Goring"),
      HTML('Put your expression in the box above and you will see matches 
           highlighted.  The matching uses <code>stringr</code>\'s 
           <code>str_replace</code> to match and replace with highlighting.  
           All the code is available online in the <a href="https://github.com/SimonGoring/RegularExpressionR/">GitHub repo.</a>')
    ),

    # Show a plot of the generated distribution
    mainPanel(
      htmlOutput("formattedText")
    )
  )
))
