#Main tab for the UI
#Holds the card output render call on the client side

main_tab <- function() {
  f7Tab(
    tabName = "",
    icon = f7Icon("triangle"),
    active = TRUE,
    header(),
    f7Shadow(intensity = 10,
             hover = TRUE,
             uiOutput("yeezy"))
  )
}