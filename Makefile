default: all

DOCS = $(wildcard docs/)
MAN = $(man)
VIGNETTES = $(wildcard vignettes/*)
R = $(wildcard R/*)

all: $(R) build_vignettes README.md $(VIGNETTES)


#build update documents and build package
$(R): $(MAN)
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

#build pkgdown site
.PHONY: build_site

$(VIGNETTES): build_site
     Rscript -e 'pkgdown::build_site()'