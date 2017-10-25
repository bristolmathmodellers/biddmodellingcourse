## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

## Install required linux libs
RUN apt-get update && \
    apt-get install -y \
    libudunits2-dev \
    libv8-3.14-dev \
    libgdal-dev \
    && apt-get clean

ADD . /home/seabbs

RUN Rscript -e 'devtools::install_dev_deps("/home/seabbs")'

RUN Rscript -e 'devtools::install_github("hadley/pkgdown")'
