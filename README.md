
<!-- README.md is generated from README.Rmd. Please edit that file -->
Bristol Infectious Disease Dynamics Modelling Course
====================================================

[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/biddmodellingcourse)](https://cran.r-project.org/package=biddmodellingcourse)

This package contains the practicals for the [BIDD](http://www.bristol.ac.uk/social-community-medicine/research/groups/bidd/) modelling short course at the University of Bristol. It also contains functions and data which can be used to practise infectious disease dynamic modelling.

Installation
------------

You can install the BIDD modelling short course from github with:

``` r
# install.packages("devtools")
devtools::install_github("bristolmathmodellers/biddmodellingcourse")
```

### Docker

This packge was developed in a docker container based on the [tidyverse](https://hub.docker.com/r/rocker/tidyverse/) docker image. To run the docker image run:

``` bash
docker run -d -p 8787:8787 --name biddmodellingcourse -e USER=seabbs -e PASSWORD=seabbs seabbs/biddmodellingcourse
```

The rstudio client can be found on port `:8787` at your local machines ip. The default username:password is seabbs:seabbs, set the user with `-e USER=username`, and the password with `- e PASSWORD=newpasswordhere`. The default is to save the analysis files into the user directory.

To run a plain R terminal use:

``` bash
docker run --rm -it --user seabbs biddmodellingcourse /usr/bin/R
```

To run a plain bash session:

``` bash
docker run --rm -it --user seabbs biddmodellingcourse /bin/bash
```

To connect as root:

``` bash
docker exec -ti -u root biddmodellingcourse bash
```
