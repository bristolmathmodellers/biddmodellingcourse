default: all

DOCS = $(wildcard docs/)
MAN = $(man)
VIGNETTES = $(wildcard vignettes/*)
R = $(wildcard R/*)

all: build_data build_package README.md build_vignettes build_site


#Update data
.PHONY: build_data
build_data:
		cd data-raw && make

#build update documents and build package
build_package:
     Rscript -e 'devtools::document()'
		 Rscript -e 'devtools::install()'

#update readme
README.md: README.Rmd
		Rscript -e 'rmarkdown::render("README.Rmd")'
		rm README.html
		Rscript -e 'rmarkdown::render("README.Rmd", c("html_document", "word_document"), output_dir = "vignettes/drafts/readme", output_options = list())'

#Update vignettes
.PHONY: build_vignettes
build_vignettes:
		cd vignettes && make

.PHONY: build_site
build_site:
     Rscript -e 'pkgdown::build_site()'