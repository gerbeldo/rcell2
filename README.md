# rcell2
!['Automating' comes from the roots 'auto-' meaning 'self-', and 'mating', meaning 'screwing'.](https://imgs.xkcd.com/comics/automation.png)

Functions to analyze Cell-ID single-cell cytometry data in a tidy and shiny framework.

A CellID wrapper is also on the works. Checkout the `cellid_master` branch.

# Installation

## Dependencies

Most of the dependencies are listed in the `DESCRIPTION` file, and should install automatically.

Install the [```tidyverse```][1] meta-package (and use it, you'll not regret it) and [```devtools```][2]. In addition, install [```EBImage```][3] package (required to look at cells) by copying and running the following script. 

```
install.packages(c("tidyverse", "devtools"))

if (!requireNamespace("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("EBImage")
```

Also install `imagemagick` on your system; this is required by R's `magick` package. All the major operating systems are supported by ImageMagick: https://imagemagick.org/script/download.php

For Ubuntu, Arch and Brew (macOS) these commands may come in handy:

```
# Aptitude
sudo apt install imagemagick

# Pacman
sudo pacman -S imagemagick

# macOS .dmg
# https://imagemagick.org/script/download.php
```

## Installing the package

Install using `devtools`, directly from github repo:

```
devtools::install_github("darksideoftheshmoo/rcell2")

```

# New R-Shiny tools for cytometry data

An R-Shiny app will help users filter data graphically, with live image previews.
While the image part may be tailored for data from fluorescence microscopy experiments, the graphical filter in this app is general purpose (i.e. useful in standard cell cytometry).

There is also another small app to "tag" single cells in the dataset with user defined options.

See:

  * `?rcell2::rcell2::shinyCell()`
  * `?rcell2::rcell2::tagCell()`
  * `?rcell2::rcell2::plotApp()`

# New Hu Moment functions for raw cell segmentation data

We implemented the `Hu moments` descriptors in R, and use them on masks generated by CellID. Note that the masks must be generated by the the CellID `mask_mod` branch (see: https://github.com/darksideoftheshmoo/cellID-linux/tree/mask_mod) either by TSV output or by encoding CellIDs in the pixel intensities of boundary and/or interior points.

# New kmeans filtering functions

The kmeans algotrithm helps filter cells based on clustering of CellID's variables computed from morphological and fluorescence information.

Use k-means and check out images of cells in each cluster. Then, filter them easily by cluster number.

See: `?rcell2::kmeans_clustering`

# Todo

* ~~Plot of a 2D grid of "representative" single cell images in a scatterplot (similar to EBImage).~~ Implemented in cellSpread, cellSpreadPlot, and "Pics" type plot in shinyCell.
* ~~Generic shiny function for filtering points in a custom ggplot~~. Implemented in plotApp.
* 1D / histogram filtering support in the filtering app.

[1]:https://www.tidyverse.org/
[2]:https://github.com/r-lib/devtools
[3]:https://bioconductor.org/packages/release/bioc/html/EBImage.html
