# rcell2
functions to analyze Cell-ID data in a tidy framework

## Branch notes

Important commits

### Cell lables

"labeling cells is now optional" 9d129f8a996dccee46137c98c9aaea7fee105935

"make the labeling setting available in cell()" b147442eee6e70618b3a3cefbb8d3faff091828f

### Masks and cell boundary intensity

"it works with hardcoded blank.tif file" 6987c4cc57dcfb6e68eb17534763f36e9ee1fa90

"blank with 0 also works; added some comments and debug messa…" 7986557011c8a439fe3e37d9a756c33511a9aa78

"label max intensity test successful" aac4cf7dcd8f53bcc2cc3f6752ad515134198f17

# Installation

## dependencies

Install the [```tidyverse```][1] meta-package (and use it, you'll not regret it) and [```devtools```][2]. In addition, install [```EBImage```][3] package (required to look at cells) by copying and running the following script. 



```
install.packages("tidyverse", "devtools")

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("EBImage")
```

## installing the package

Install using devtools, from github repo:

```
devtools::install_github("gerbeldo/rcell2")

```

# rcellid & cellMagick

This package bundles the CellID image segmentation program, and has utility functions to generate single-cell data from microscopy images.

After importing data with Rcell2, an R-Shiny app will help users filter data graphically, with live image previews.

While the image part may be tailored for data from fluorescence microscopy experiments, the graphical filter in this app is general purpose (i.e. useful in standard cell cytometry).

## Todo

* Plot of a 2D grid of "representative" single cell images in a scatterplot.
* Generic shiny function for filtering points in a custom ggplot.
* 1D / histogram filtering support.

## Installation

1. Download this pacakge.
2. Install libtiff build dependencies (get `cmake` from https://cmake.org/download/).
3. Install the package from source: `devtools::install_github("gerbeldo/rcell2", ref = "master")`

### Installing dependencies

For Ubuntu, Arch and Brew (macOS):

```
# Aptitude
sudo apt install cmake

# Pacman
sudo pacman -S cmake

# macOS Brew https://stackoverflow.com/a/33628202/11524079
brew install cmake

# macOS .dmg
# https://cmake.org/download/
```

## Future work

This package will include the CellID program source, and wrap it in a single R function. For now it can only call a CellID executable provided by you, dear user.

[1]:https://www.tidyverse.org/
[2]:https://github.com/r-lib/devtools
[3]:https://bioconductor.org/packages/release/bioc/html/EBImage.html
