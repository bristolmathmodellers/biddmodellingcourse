default: all
RDIR = .
VIG_DRAFTS_DIR = $(RDIR)/drafts
RESOURCES = $(RDIR)/resources/*


#practical 1
PRACTICAL_1 = $(VIG_DRAFTS_DIR)/practicals/practical-one/practical-one.html

#practical 2
PRACTICAL_2 = $(VIG_DRAFTS_DIR)/practicals/practical-two/practical-two.html

#solutions 1
SOLUTIONS_1 = $(VIG_DRAFTS_DIR)/solutions/solutions-one/solutions-one.html

#solutions 2
SOLUTIONS_2 = $(VIG_DRAFTS_DIR)/solutions/solutions-two/solutions-two.html

#TB fact sheet 2
TB_FACT = $(VIG_DRAFTS_DIR)/fact-sheets/tb-fact-sheet/tb-fact-sheet.html



all: $(PRACTICAL_1) $(PRACTICAL_2) $(SOLUTIONS_1) $(SOLUTIONS_2) $(TB_FACT)

$(PRACTICAL_1): practical-one.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("practical-one.Rmd", c("html_document", "word_document"), output_dir = "drafts/practicals/practical-one", output_options = list())'

$(PRACTICAL_2): practical-two.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("practical-two.Rmd", c("html_document", "word_document"), output_dir = "drafts/practicals/practical-two", output_options = list())'

$(SOLUTIONS_1): solutions-one.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("solutions-one.Rmd", c("html_document", "word_document"), output_dir = "drafts/solutions/solutions-one", output_options = list())'

$(SOLUTIONS_2): solutions-two.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("solutions-two.Rmd", c("html_document", "word_document"), output_dir = "drafts/solutions/solutions-two", output_options = list())'

$(TB_FACT): tb-fact-sheet.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("tb-fact-sheet.Rmd", c("html_document", "word_document"), output_dir = "drafts/fact-sheets/tb-fact-sheet", output_options = list())'
