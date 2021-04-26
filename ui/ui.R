path<-"ui/components/"
sapply(list.files(
  path,
  include.dirs = F,
  pattern = '.R',
  ignore.case = T,
  recursive = T
),
function(f) {
  source(paste0(path, f), .GlobalEnv)
})



ui <- function(title = "I love Kanye",opts = list(pullToRefresh = TRUE)) {
  f7Page(
    title = title,
    options = opts,
    allowPWA = T,
    f7TabLayout(
      panels = f7_panel(),
      navbar =f7_nav(),
      f7Tabs(
        animated = TRUE,
        main_tab()
      )
    )
  )
}