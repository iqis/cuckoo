#' Assign a Value to an Existing Name inside Another Package
#'
#' ... replacing what is already there.
#' You must restart R in order reload the original.
#'
#'
#' @param pkg name of package; <character>
#' @param name name of the object; <character>
#' @param value value to be bound to the object; <any>
#'
#' @return invisible(value); <any>
#' @export
#'
#' @examples
#' if (interactive()) {
#' snooze <- function() cat("zzz")
#' cuckoo::swap("utils", "alarm", snooze)
#" utils::alarm()
#' }
swap <- function(pkg, name, value){
  pkg_env <- asNamespace(pkg)
  two_colons <- get("::", envir = baseenv())
  two_colons("base", "unlockBinding")(name, pkg_env)
  two_colons("base","assign")(name, value, pkg_env)
  invisible(value)
}



