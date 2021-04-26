#' PWA dependencies utils
#'
#' @description This function attaches PWA manifest and icons to the given tag
#'
#' @param tag Element to attach the dependencies.
#'
#' @importFrom utils packageVersion
#' @importFrom htmltools tagList htmlDependency
#' @export
add_pwa_deps <- function(tag) {
  pwa_deps <- htmlDependency(
    name = "pwa-utils",
    version = "0.1.0",
    src = c(file = "pwaa-0.1.0"),
    head = "<link rel=\"manifest\" href=\"manifest.webmanifest\"  />
<link rel=\"icon\" type=\"image/png\" href=\"icons/icon-192x192.png\" sizes=\"192x192\" />",
    package = "pwaa",
  )
  tagList(tag, pwa_deps)
}
