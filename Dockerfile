## Start with the tidyverse docker image
FROM rocker/tidyverse:latest

MAINTAINER "Sam Abbott" contact@samabbott.co.uk

ADD . /home/rstudio/biddmodellingcourse

RUN Rscript -e 'install.packages(c("packrat", "caTools"))'

RUN Rscript -e 'devtools::install_deps("/home/rstudio/biddmodellingcourse", dependencies = TRUE, upgrade = TRUE)'

RUN Rscript -e 'devtools::install_github("hadley/pkgdown")'
