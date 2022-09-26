f7_panel <- function() {
  tagList(
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
  )
}