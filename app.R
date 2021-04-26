
source("setup.R",.GlobalEnv)


shinyApp(
  ui = ui(),
  server = function(input, output, session) {
    #First picture and quote
    ye_pic <-
      reactiveVal(value = random_img())
    ye_quote <-
      reactiveVal(value = random_quote())
    
    #Determine if the application has been pulled for refreshing
    observeEvent(input$ptr,
                 {
                   ye_pic(random_img())
                   ye_quote(random_quote())
                 })
    #Output of the card showing the yeezy quote and the picture
    output[['yeezy']] <- renderUI({
      f7Card(
        id = "main",
        title = h2("Kanye West"),
        tags$img(src = ye_pic(), style = "display: block; margin-left: auto; margin-right: auto; max-width:80%; border-radius:3%;"),
        br(),
        tags$h2(tags$blockquote(ye_quote()), style = "display: block; margin-left: auto; margin-right: auto; text-align:center;")
      )
    })
    # send the theme to javascript
    observe({
      session$sendCustomMessage(type = "ui-tweak",
                                message = list(os = input$theme, skin = input$color))
    })
    
  }
)
