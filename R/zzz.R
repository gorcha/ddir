# nocov start
.onLoad <- function(libname, pkgname) {
  op <- options()
  op.ddir <- list(
    ddir.name = "ddir"
  )
  toset <- !(names(op.ddir) %in% names(op))
  if (any(toset)) options(op.ddir[toset])

  invisible()
}

.onAttach <- function(libname, pkgname) {

  invisible()
}

# nocov end
