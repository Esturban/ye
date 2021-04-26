library(shiny)

# source modules
e <- environment()
if (!interactive())
  path <- "src/"
if (interactive()) {
  setwd("kWest")
  path <- "src/"
}

sapply(list.files(
  "src",
  include.dirs = F,
  pattern = '.R',
  ignore.case = T
),
function(f) {
  source(paste0(path, f), .GlobalEnv)
})

library(shinyMobile)
library(shinyWidgets)
library(tidyverse)
library(apexcharter)

require(rvest)

'https://www.gettyimages.com/photos/kanye-west?family=editorial&phrase=kanye%20west&sort=mostpopular' %>%
  read_html %>%
  html_nodes(
    'body > div.content_wrapper > section > div > main > section > div.search-content__gallery-pager-wrapper > div > div.search-content__gallery > div > div > div.search-content__gallery-assets > div > article > a > figure > img'
  ) %>%
  html_attr('src') -> kw_imgs


header <- function() {
  tags$head(
    tags$script(
      'Shiny.addCustomMessageHandler("ui-tweak", function(message) {
                var os = message.os;
                var skin = message.skin;
                if (os === "md") {
                  $("html").addClass("md");
                  $("html").removeClass("ios");
                  $(".tab-link-highlight").show();
                } else if (os === "ios") {
                  $("html").addClass("ios");
                  $("html").removeClass("md");
                  $(".tab-link-highlight").hide();
                }

                if (skin === "dark") {
                 $("html").addClass("theme-dark");
                } else {
                  $("html").removeClass("theme-dark");
                }

               });
              '
    )
  )
}

shinyApp(
  ui = f7Page(
    title = "Kanye",
    options = list(pullToRefresh = TRUE),
    allowPWA = T,
    f7TabLayout(
      panels = tagList(
        f7Panel(
          title = "Appearance",
          side = "left",
          theme = "light",
          f7Flex(
            prettyRadioButtons(
              inputId = "theme",
              label = "Select a theme:",
              thick = TRUE,
              inline = TRUE,
              selected = "ios",
              choices = c("ios", "md"),
              animation = "pulse",
              status = "info"
            ),
            
            prettyRadioButtons(
              inputId = "color",
              label = "Select a color:",
              thick = TRUE,
              inline = TRUE,
              selected = "light",
              choices = c("light", "dark"),
              animation = "pulse",
              status = "info"
            )
          ),
          f7Col(tagList(
            f7Link(label = "Quote Collection from: kanye.rest", href = 'https://kanye.rest/'),
            br(),
            br(),
            f7Link(label = "Creator: Esteban Valencia", href = 'https://www.estebanvalencia.com/'),
            br(),
            br(),
            f7Link(label = "Source Code", href = "https://github.com/Esturban/ye")
          ))
          ,
          effect = "cover"
        )
      ),
      navbar = f7Navbar(
        title = "Ye",
        hairline = TRUE,
        shadow = TRUE,
        leftPanel = TRUE,
        rightPanel = F
      ),
      f7Tabs(
        animated = TRUE,
        f7Tab(
          tabName = "",
          icon = f7Icon("triangle"),
          active = TRUE,
          header(),
          f7Shadow(intensity = 10,
                   hover = TRUE,
                   uiOutput("yeezy"))
        )
      )
    )
  ),
  server = function(input, output, session) {
    #First picture and quote
    ye_pic <-
      reactiveVal(value = kw_imgs[sample.int(length(kw_imgs), 1)])
    ye_quote <-
      reactiveVal(value = jsonlite::fromJSON("https://api.kanye.rest/"))
    
    #Determine if the application has been pulled for refreshing
    observeEvent(input$ptr,
                 {
                   ye_pic(kw_imgs[sample.int(length(kw_imgs), 1)])
                   ye_quote(jsonlite::fromJSON("https://api.kanye.rest/"))
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
