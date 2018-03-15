default: all
RDIR = .
VIG_DRAFTS_DIR = $(RDIR)/drafts
RESOURCES = $(RDIR)/resources/*


#practical 1
PRACTICAL_1 = $(VIG_DRAFTS_DIR)/practicals/practical_one/practical_one.html

#practical 2
PRACTICAL_2 = $(VIG_DRAFTS_DIR)/practicals/practical_two/practical_two.html

#solutions 1
SOLUTIONS_1 = $(VIG_DRAFTS_DIR)/solutions/solutions_one/solutions_one.html

#solutions 2
SOLUTIONS_2 = $(VIG_DRAFTS_DIR)/solutions/solutions_two/solutions_two.html

#TB fact sheet 2
TB_FACT = $(VIG_DRAFTS_DIR)/fact_sheets/tb_fact_sheet/tb_fact_sheet.html



all: $(PRACTICAL_1) $(PRACTICAL_2) $(SOLUTIONS_1) $(SOLUTIONS_2) $(TB_FACT)

$(PRACTICAL_1): practical_one.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("practical_one.Rmd", c("html_document", "word_document"), output_dir = "drafts/practicals/practical_one", output_options = list())'

$(PRACTICAL_2): practical_two.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("practical_two.Rmd", c("html_document", "word_document"), output_dir = "drafts/practicals/practical_two", output_options = list())'

$(SOLUTIONS_1): solutions_one.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("solutions_one.Rmd", c("html_document", "word_document"), output_dir = "drafts/solutions/solutions_one", output_options = list())'

$(SOLUTIONS_2): solutions_two.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("solutions_two.Rmd", c("html_document", "word_document"), output_dir = "drafts/solutions/solutions_two", output_options = list())'

$(TB_FACT): tb_fact_sheet.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("tb_fact_sheet.Rmd", c("html_document", "word_document"), output_dir = "drafts/fact_sheets/tb_fact_sheet", output_options = list())'
