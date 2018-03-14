default: all

DOCS = $(wildcard docs/)
MAN = $(man)
VIGNETTES = $(wildcard vignettes/*)
R = $(wildcard R/*)

all: build_package build_vignettes README.md build_site


#build update documents and build package
build_package:
     Rscript -e 'devtools::document()'
		 Rscript -e 'devtools::install()'

#update readme
README.md: README.Rmd
		Rscript -e 'rmarkdown::render("README.Rmd")'
		rm README.html

#Update vignettes
.PHONY: build_vignettes
build_vignettes:
		cd vignettes && make

build_site:
     Rscript -e 'pkgdown::build_site()'