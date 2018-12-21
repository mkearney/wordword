
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wordword <img src="man/figures/logo.png" width="160px" align="right" />

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)

> \=≠ A simple little thesaurus package.

## Installation

You can install the released version of wordword from
[Github](https://github.com) with:

``` r
devtools::install_github("mkearney/wordword")
```

## thesaurus.com

## `wordword::tuna()`

Access the unofficial API behind thesaurus.com:

``` r
wordword::tuna("intimate") %>%
  print(n = 30)
#> # A tibble: 247 x 8
#>    id    entry target_term definition term  similarity is_informal
#>    <chr> <chr> <chr>       <chr>      <chr>      <dbl> <lgl>      
#>  1 5c09… inti… adumbrate   foreshadow sket…         50 TRUE       
#>  2 5c09… inti… adumbrate   foreshadow dark…         50 TRUE       
#>  3 5c09… inti… adumbrate   foreshadow outl…         50 TRUE       
#>  4 5c09… inti… adumbrate   foreshadow inti…         50 TRUE       
#>  5 5c09… inti… adumbrate   foreshadow mist          50 TRUE       
#>  6 5c09… inti… adumbrate   foreshadow sugg…         50 TRUE       
#>  7 5c09… inti… adumbrate   foreshadow port…         50 TRUE       
#>  8 5c09… inti… adumbrate   foreshadow indi…         50 TRUE       
#>  9 5c09… inti… adumbrate   foreshadow fore…         50 TRUE       
#> 10 5c09… inti… adumbrate   foreshadow augur         50 TRUE       
#> 11 5c09… inti… adumbrate   foreshadow obsc…         50 TRUE       
#> 12 5c09… inti… adumbrate   foreshadow obfu…         50 TRUE       
#> 13 5c09… inti… adumbrate   foreshadow bode          50 TRUE       
#> 14 5c09… inti… adumbrate   foreshadow cloud         50 TRUE       
#> 15 5c09… inti… adumbrate   foreshadow illu…        -50 TRUE       
#> 16 5c09… inti… adumbrates  foreshadow sket…         50 TRUE       
#> 17 5c09… inti… adumbrates  foreshadow dark…         50 TRUE       
#> 18 5c09… inti… adumbrates  foreshadow outl…         50 TRUE       
#> 19 5c09… inti… adumbrates  foreshadow inti…         50 TRUE       
#> 20 5c09… inti… adumbrates  foreshadow mist          50 TRUE       
#> 21 5c09… inti… adumbrates  foreshadow sugg…         50 TRUE       
#> 22 5c09… inti… adumbrates  foreshadow port…         50 TRUE       
#> 23 5c09… inti… adumbrates  foreshadow indi…         50 TRUE       
#> 24 5c09… inti… adumbrates  foreshadow fore…         50 TRUE       
#> 25 5c09… inti… adumbrates  foreshadow augur         50 TRUE       
#> 26 5c09… inti… adumbrates  foreshadow obsc…         50 TRUE       
#> 27 5c09… inti… adumbrates  foreshadow obfu…         50 TRUE       
#> 28 5c09… inti… adumbrates  foreshadow bode          50 TRUE       
#> 29 5c09… inti… adumbrates  foreshadow cloud         50 TRUE       
#> 30 5c09… inti… adumbrates  foreshadow illu…        -50 TRUE       
#> # … with 217 more rows, and 1 more variable: is_vulgar <lgl>
```

## bighugelabs.com

There’s also access to bighugelab’s words API (requires API key), but I
ran through the limit on free requests in no time.

## `wordword::sameword()`

``` r
wordword::sameword("intimate")
```

## `wordword::diffword()`

``` r
wordword::diffword("intimate")
```
