need.packages <- function(pkgs, repos = getOption("repos"), ...) {
  # pkgs: vector of packages to loaded or installed
  # repos: if package to be installed from a source
  new.pkgs <- pkgs[! (pkgs %in% installed.packages()[, "Package"])]
  if (length(new.pkgs) > 0) {
    if (is.null(repos) || repos == "@CRAN@") {
      repos <- "https://cloud.r-project.org"
    }
    install.packages(pkgs = new.pkgs, repos = repos, ...)
  }
  sapply(pkgs, function(a) {
    suppressMessages(require(a, character.only = TRUE))
  })
  invisible()
}
