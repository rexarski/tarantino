
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tarantino <img src="man/figures/logo.png" width="160px" align="right" />

<!-- badges: start -->

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## Overview

This package provides a series of palettes extracted from some classic
scenes of Quentin Tarantino’s movies. The package itself is a modified
version based on the famous
[`wesanderson`](https://github.com/karthik/wesanderson) package. The raw
data is collected from *[Movies in Color](https://moviesincolor.com)*.

![img](https://64.media.tumblr.com/e9613efa4ba60ea1b137815115366593/tumblr_mk3b1jRrh71s6aghro1_1280.jpg)

## Installation

You can install the development version of `tarantino` with:

``` r
# install package from github
devtools::install_github("rexarski/tarantino")
```

## Palettes

**Update:** 2 new palettes from [*The Hateful Eight
(2015)*](https://www.instagram.com/p/CBLdkdeIRK2/) and [*Once Upon a
Time in Hollywood (2019)*](https://www.instagram.com/p/B-Pl0PAocL7/).

![img](man/figures/TheHatefulEight.png)

![img](man/figures/OnceUponATimeInHollywood.png)

![img](man/figures/palettes.png)

After loading the package, call `tarantino_palettes` to display all
current available palettes, which are stored in the list. Each element
within the list is a palette object.

``` r
library(tarantino)
tarantino_palettes
```

You can also use `tarantino::print_palette(palette)` to give a showcase
of the palette:

``` r
tarantino::print_palette(tarantino_palette("PulpFiction", type="discrete"))
```

![img](man/figures/PulpFiction.png)
