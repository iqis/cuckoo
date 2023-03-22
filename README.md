
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cuckoo

<!-- badges: start -->

[![R-CMD-check](https://github.com/iqis/cuckoo/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/iqis/cuckoo/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Replace values of objects in other packages with that of your own.
Sometimes you may wish to fix the behavior of some functions in packages
by others without having to touch the source.

To load and attach content of a package directly from its source, please
see [pkgload](https://pkgload.r-lib.org/).

## Installation

You can install the development version of cuckoo like so:

``` r
devtools::install_github("iqis/cuckoo")
```

## Example

``` r
snooze <- function() cat("zzz")
cuckoo::swap("utils", "alarm", snooze)
utils::alarm()
#> zzz
```

Try committing
cyber[kleptoparasitism](https://en.wikipedia.org/wiki/Kleptoparasitism)
today.
