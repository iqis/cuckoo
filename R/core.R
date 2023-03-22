#' Assign a Value to an Existing Name inside Another Package
#'
#' ... replacing what is already there.
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

#' Replace All Functions in Package with a Dummy
#'
#' Dummy function gets called and does nothing.
#' This is useful, for example, when executing a program that contains spurious logging code, which you want to universally suppress.
#'
#' @param name name of the object; <character>
#'
#' @return
#' @export
#'
#' @examples
#'
#' \dontrun{
#' ## original code
#' do_something <- function(){
#'   logger::log_info("Doing Something")
#'   # ...
#' }
#'
#' ## hollow out the package
#' hollow("logger")
#'
#' ## enjoy the peace
#' do_something()
#'
#' }
hollow <- function(pkg){
  pkg_env <- asNamespace(pkg)

  fn_names <- names(Filter(is.function, mget(ls(pkg_env),
                                             pkg_env)))
  lapply(fn_names, function(fn_name){
    swap(pkg, fn_name, function(...) invisible())
  })

  invisible()
}


