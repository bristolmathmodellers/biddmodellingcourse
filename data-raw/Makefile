default: all
RDIR = .

all: tb_not_ew.csv tb_interventions_timeline.csv

## Update incidence rate data
tb_not_ew.csv: tb_not_ew.R
			Rscript tb_not_ew.R
			
## Update policy data
tb_interventions_timeline.csv: tb_interventions_timeline.R
			Rscript tb_interventions_timeline.R