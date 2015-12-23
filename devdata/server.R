library(shiny)

adjustvalue <- function(age, case) {
  if(case=="minusten") 170-age
  else if(case=="minusfive") 175-age
  else if(case=="plusfive") 185-age
  else 180-age
}

shinyServer(
  function(input, output) {
    
    output$inputValueAge <- renderPrint({input$age})
    output$inputValueCase <- renderPrint({input$case})
    output$heartrate <- renderPrint({adjustvalue(input$age, input$case)})
  }
)