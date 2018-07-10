
<!-- README.md is generated from README.Rmd. Please edit that file -->

# wordword

> \=≠ A simple little thesaurus package.

## Installation

You can install the released version of wordword from
[Github](https://github.com) with:

``` r
devtools::install_packages("wordword")
```

## thesaurus.com

## `wordword::tuna()`

Access the unofficial API behind thesaurus.com:

``` r
wordword::tuna("intimate") %>%
  print(n = 30)
#> # A tibble: 247 x 8
#>    id          entry  target_term definition term   similarity is_informal
#>    <chr>       <chr>  <chr>       <chr>      <chr>       <dbl> <lgl>      
#>  1 5a97066e2d… intim… adumbrate   foreshadow sketch         50 TRUE       
#>  2 5a97066e2d… intim… adumbrate   foreshadow darken         50 TRUE       
#>  3 5a97066e2d… intim… adumbrate   foreshadow outli…         50 TRUE       
#>  4 5a97066e2d… intim… adumbrate   foreshadow intim…         50 TRUE       
#>  5 5a97066e2d… intim… adumbrate   foreshadow mist           50 TRUE       
#>  6 5a97066e2d… intim… adumbrate   foreshadow sugge…         50 TRUE       
#>  7 5a97066e2d… intim… adumbrate   foreshadow porte…         50 TRUE       
#>  8 5a97066e2d… intim… adumbrate   foreshadow indic…         50 TRUE       
#>  9 5a97066e2d… intim… adumbrate   foreshadow foret…         50 TRUE       
#> 10 5a97066e2d… intim… adumbrate   foreshadow augur          50 TRUE       
#> 11 5a97066e2d… intim… adumbrate   foreshadow obscu…         50 TRUE       
#> 12 5a97066e2d… intim… adumbrate   foreshadow obfus…         50 TRUE       
#> 13 5a97066e2d… intim… adumbrate   foreshadow bode           50 TRUE       
#> 14 5a97066e2d… intim… adumbrate   foreshadow cloud          50 TRUE       
#> 15 5a97066e2d… intim… adumbrate   foreshadow illum…        -50 TRUE       
#> 16 5ae7b30f0f… intim… adumbrates  foreshadow sketch         50 TRUE       
#> 17 5ae7b30f0f… intim… adumbrates  foreshadow darken         50 TRUE       
#> 18 5ae7b30f0f… intim… adumbrates  foreshadow outli…         50 TRUE       
#> 19 5ae7b30f0f… intim… adumbrates  foreshadow intim…         50 TRUE       
#> 20 5ae7b30f0f… intim… adumbrates  foreshadow mist           50 TRUE       
#> 21 5ae7b30f0f… intim… adumbrates  foreshadow sugge…         50 TRUE       
#> 22 5ae7b30f0f… intim… adumbrates  foreshadow porte…         50 TRUE       
#> 23 5ae7b30f0f… intim… adumbrates  foreshadow indic…         50 TRUE       
#> 24 5ae7b30f0f… intim… adumbrates  foreshadow foret…         50 TRUE       
#> 25 5ae7b30f0f… intim… adumbrates  foreshadow augur          50 TRUE       
#> 26 5ae7b30f0f… intim… adumbrates  foreshadow obscu…         50 TRUE       
#> 27 5ae7b30f0f… intim… adumbrates  foreshadow obfus…         50 TRUE       
#> 28 5ae7b30f0f… intim… adumbrates  foreshadow bode           50 TRUE       
#> 29 5ae7b30f0f… intim… adumbrates  foreshadow cloud          50 TRUE       
#> 30 5ae7b30f0f… intim… adumbrates  foreshadow illum…        -50 TRUE       
#> # ... with 217 more rows, and 1 more variable: is_vulgar <lgl>
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
