
<!-- README.md is generated from README.Rmd. Please edit that file -->
Bristol Infectious Disease Dynamics Modelling Course
====================================================

[![Build Status](https://travis-ci.org/bristolmathmodellers/biddmodellingcourse.svg?branch=master)](https://travis-ci.org/bristolmathmodellers/biddmodellingcourse)

This package contains the practicals for the [BIDD](http://www.bristol.ac.uk/social-community-medicine/research/groups/bidd/) modelling short course at the University of Bristol. It also contains the functions required to run the practicals and solutions.

Getting Started
---------------

-   Download the package folder from [github](https://github.com/bristolmathmodellers/biddmodellingcourse/archive/master.zip) or use `git clone`, as follows, in the command line.

``` bash
git clone https://github.com/bristolmathmodellers/biddmodellingcourse.git
```

-   Verify that you have a working installation of both [R](https://www.r-project.org/) and [Rstudio](https://www.rstudio.com/products/rstudio/download/#download), then navigate to the `biddmodellingcourse` folder and click on the `biddmodellingcourse.Rproj` project. This should open an instance of Rstudio.

-   Install the BIDD modelling short course from github using the R terminal:

``` r
install.packages("devtools")
devtools::install_github("bristolmathmodellers/biddmodellingcourse")
```

-   After installation is complete start the first [practical](https://bristolmathmodellers.github.io/biddmodellingcourse/articles/practical_1.html). For practicals that require coding, follow along interactively using the provided notebooks (available in the `vignettes` folder).

### Docker

This package was developed in a docker container based on the [tidyverse](https://hub.docker.com/r/rocker/tidyverse/) docker image. Docker containers are lightweight, stand-alone, executable packages of a piece of software that includes everything needed to run it (see [here](https://www.docker.com/what-container) for details). To run the docker image run (with an active docker daemon running):

``` bash
docker run -d -p 8787:8787 --name biddmodellingcourse -e USER=biddmodellingcourse -e PASSWORD=biddmodellingcourse seabbs/biddmodellingcourse
```

The rstudio client can be found on port `:8787` at your local machines ip. The default username:password is biddmodellingcourse:biddmodellingcourse, set the user with `-e USER=username`, and the password with `- e PASSWORD=newpasswordhere`. The default is to save the analysis files into the user directory.

To run a plain R terminal use:

``` bash
docker run --rm -it --user biddmodellingcourse biddmodellingcourse /usr/bin/R
```

To run a plain bash session:

``` bash
docker run --rm -it --user biddmodellingcourse biddmodellingcourse /bin/bash
```

To connect as root:

``` bash
docker exec -ti -u root biddmodellingcourse bash
```
