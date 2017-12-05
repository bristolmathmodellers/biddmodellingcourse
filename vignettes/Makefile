default: all
RDIR = .
VIG_DRAFTS_DIR = $(RDIR)/drafts
RESOURCES = $(RDIR)/resources/*


#practical 1
PRACTICAL_1 = $(VIG_DRAFTS_DIR)/practicals/practical_1/practical_1.html

#practical 2
PRACTICAL_2 = $(VIG_DRAFTS_DIR)/practicals/practical_2/practical_2.html

#solutions 1
SOLUTIONS_1 = $(VIG_DRAFTS_DIR)/solutions/solutions_1/solutions_1.html

#solutions 2
SOLUTIONS_2 = $(VIG_DRAFTS_DIR)/solutions/solutions_2/solutions_2.html

#TB fact sheet 2
TB_FACT = $(VIG_DRAFTS_DIR)/fact_sheets/tb_fact_sheet/tb_fact_sheet.html



all: $(PRACTICAL_1) $(PRACTICAL_2) $(SOLUTIONS_1) $(SOLUTIONS_2)

$(PRACTICAL_1): practical_1.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("practical_1.Rmd", c("html_document", "word_document"), output_dir = "drafts/practicals/practical_1", output_options = list())'

$(PRACTICAL_2): practical_2.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("practical_2.Rmd", c("html_document", "word_document"), output_dir = "drafts/practicals/practical_2", output_options = list())'

$(SOLUTIONS_1): solutions_1.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("solutions_1.Rmd", c("html_document", "word_document"), output_dir = "drafts/solutions/solutions_1", output_options = list())'

$(SOLUTIONS_2): solutions_2.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("solutions_2.Rmd", c("html_document", "word_document"), output_dir = "drafts/solutions/solutions_2", output_options = list())'

$(TB_FACT): tb_fact_sheet.Rmd $(RESOURCES)
			R -e 'rmarkdown::render("tb_fact_sheet.Rmd", c("html_document", "word_document"), output_dir = "drafts/fact_sheets/tb_fact_sheet", output_options = list())'
