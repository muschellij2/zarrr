#' Zarr I/O
#'
#' @param file path to the file to be read/written
#' @param zarr_version The zarr protocol version to use when saving. The
#' default value of None will attempt to infer the version from store if
#' possible, otherwise it will fall back to 2.
#' @param zarr_path The path within the group where the arrays will be saved.
#'
#' @return
#' @export
#'
#' @examples
read_zarr = function(file, zarr_version = NULL, zarr_path = NULL) {
  zarr = zarr_base()
  out = zarr$load(store = file,
                  zarr_version = zarr_version,
                  path = zarr_path)
}

#' @rdname read_zarr
#' @export
write_zarr = function(x, file, zarr_version = NULL, zarr_path = NULL, ...) {
  zarr = zarr_base()
  args = list(...)
  if ("path" %in% names(args)) {
    cli::cli_warn("path in zarr.save is specified via `zarr_path`")
  }
  zarr$save(
    store = file,
    args = x,
    zarr_version = zarr_version,
    path = zarr_path,
    ...
  )
}
