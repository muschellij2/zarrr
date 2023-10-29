#' Install the `zarr` Python Module
#'
#' @param packages additional packages to install.  If `zarr` is missing,
#' it will be added
#' @param ... Additional arguments to pass to [reticulate::py_install()]
#'
#' @return Output of [reticulate::py_install]
#' @export
#' @rdname zarr_setup
#' @examples
#' if (have_zarr()) {
#'    zarr_version()
#' }
#'
install_zarr = function(..., packages = "zarr") {
  packages = unique(c("zarr", packages))
  reticulate::py_install(packages = packages, ...)
}

#' @export
#' @rdname zarr_setup
have_zarr = function() {
  reticulate::py_module_available("zarr")
}


module_version = function(module = "numpy") {
  assertthat::is.scalar(module)
  if (!reticulate::py_module_available(module)) {
    stop(paste0(module, " is not installed!"))
  }
  df = reticulate::py_list_packages()
  df$version[df$package == module]
}

#' @export
#' @rdname zarr_setup
zarr_version = function() {
  module_version("zarr")
}

