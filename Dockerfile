## Start with the tidyverse docker image
FROM rocker/rstudio:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

ADD . /home/rstudio/biddmodellingcourse

RUN Rscript -e 'install.packages("packrat"); install.packages("devtools")'

RUN Rscript -e 'devtools::install_dev_deps("/home/rstudio/biddmodellingcourse")'

RUN Rscript -e 'devtools::install_github("hadley/pkgdown")'
