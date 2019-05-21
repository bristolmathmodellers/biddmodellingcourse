
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Bristol Infectious Disease Dynamics Modelling Course

[![develVersion](https://img.shields.io/badge/devel%20version-1.0.0-blue.svg?style=flat)](https://github.com/bristolmathmodellers/biddmodellingcourse)
[![Course
Website](https://img.shields.io/badge/Website-click%20here!-lightgrey.svg?style=flat)](https://bristolmathmodellers.github.io/biddmodellingcourse/)
[![badge](https://img.shields.io/badge/Launch-biddmodellingcourse-lightblue.svg)](https://mybinder.org/v2/gh/bristolmathmodellers/biddmodellingcourse/master?urlpath=rstudio)
[![Travis-CI Build
Status](https://travis-ci.org/bristolmathmodellers/biddmodellingcourse.svg?branch=master)](https://travis-ci.org/bristolmathmodellers/biddmodellingcourse)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/bristolmathmodellers/biddmodellingcourse?branch=master&svg=true)](https://ci.appveyor.com/project/bristolmathmodellers/biddmodellingcourse)

The `biddmodellingcourse` package contains the practicals for the
[BIDD](http://www.bristol.ac.uk/social-community-medicine/research/groups/bidd/)
modelling short course at the University of Bristol. It also contains
the functions required to run the practicals and solutions.

## Getting Started - On The Day

### Getting up and running

  - The practicals and code should be on the memory stick given to you
    at the start of the the course as a zip. Copy the zip to your home
    directory, unzip it, and then open the `biddmodellingcourse` folder.

  - Verify that you have a working installation of both
    [R](https://www.r-project.org/) and
    [Rstudio](https://www.rstudio.com/products/rstudio/download/#download)
    (if on the course computers you do), then click on the
    `biddmodellingcourse.Rproj` project. This should open an instance of
    Rstudio.

  - You are now ready to start the practicals (see the handouts or the
    course website
    (<https://bristolmathmodellers.github.io/biddmodellingcourse/>)).
    For practicals that require coding, follow along interactively using
    the provided notebooks (available in the `vignettes` folder).

### Using the course code

  - To run the shiny application in practical 2 run the following code,

<!-- end list -->

``` r
shiny::runGitHub("exploreidmodels", "seabbs")
```

  - The course practicals make use of [R
    notebooks](https://rmarkdown.rstudio.com/r_notebooks.html), these
    allow text and code to be intermingled in a single document. Code is
    highlighted and separated from the text using \`\`\`. To run the
    code in these chunks click on the green arrow in the right hand side
    of the chunk, or select the chunk and press enter. To run all code
    chunks above a given chunk press the grey arrow pointing downwards.
    The output from each code chunk will be displayed below the code
    chunk.

  - **Are you having a problem running something locally?**
    
      - For Practical 2 use the following link to start the shiny app
        remotely: <http://bit.ly/bidd-practical-2>
      - For practical 3 use the following link to start a remote Rstudio
        session: <http://bit.ly/bidd-practical-3>

## Getting Started - Remote Set-up

  - Download the package folder from
    <https://github.com/bristolmathmodellers/biddmodellingcourse/archive/master.zip>
    or use `git clone`, as follows, in the command line (not the R
    terminal).

<!-- end list -->

``` bash
git clone https://github.com/bristolmathmodellers/biddmodellingcourse.git
```

  - Now follow the getting started on the day instructions above.

### Docker

This package was developed in a docker container based on the
[tidyverse](https://hub.docker.com/r/rocker/tidyverse/) docker image.
Docker containers are lightweight, stand-alone, executable packages of a
piece of software that includes everything needed to run it (see
[here](https://www.docker.com/what-container) for details). To run the
docker image run (with an active docker daemon
running):

``` bash
docker run -d -p 8787:8787 --name biddmodellingcourse -e USER=biddmodellingcourse -e PASSWORD=biddmodellingcourse seabbs/biddmodellingcourse
```

The rstudio client can be found on port `:8787` at your local machines
ip. The default username:password is
biddmodellingcourse:biddmodellingcourse, set the user with `-e
USER=username`, and the password with `- e PASSWORD=newpasswordhere`.
The default is to save the analysis files into the user directory.
