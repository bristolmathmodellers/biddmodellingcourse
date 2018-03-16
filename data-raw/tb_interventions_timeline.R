## Key datas for UK TB vaccines, treatments etc
library(tibble)
library(readr)

tb_interventions_timeline <- tibble(year = c(1921, 1944, 1944, 1952, 1952, 1952, 1953, 1962, 1971, 1995, 2005, 2012),
                                  intervention = c("BCG",
                                                   "Streptomycin",
                                                   "4-Aminosalicylic acid",
                                                   "Isoniazid",
                                                   "Cycloserine",
                                                   "Pyrazinamide",
                                                   "School age BCG",
                                                   "Ethambutol",
                                                   "Rifampicin",
                                                   "DOTS",
                                                   "Neonatal high risk BCG",
                                                   "Bedaquiline"),
                                  type = c("Vaccination",
                                           "Antibiotic", 
                                           "Antibiotic",
                                           "Antibiotic",
                                           "Antibiotic",
                                           "Antibiotic",
                                           "Vaccination", 
                                           "Antibiotic",
                                           "Antibiotic",
                                           "Strategy",
                                           "Vaccination",
                                           "Antibiotic"),
                                  line = c("",
                                           "Second",
                                           "Second",
                                           "First",
                                           "Second",
                                           "First",
                                           "",
                                           "First",
                                           "First",
                                           "",
                                           "",
                                           "Second"),
                                  detail = c("The first use of the Bacillus Calmette–Guerin (BCG) vaccine in humans, it remains the only vaccine against Tuberculosis (TB). 
                                              Efficacy has been shown to vary depending on latitude (0-80%) and there is only strong evidence of protection for 
                                             10-15 years after vaccination.",
                                            "The first antibiotic and the first bacterial agent against TB.",
                                             "The second antiobiotic to be developed. Due to lower potency than other antibiotics it is not considered a first line
                                             treatment.",
                                             "Used against both active and latent TB, it may also be given as a 
                                             prophylatic therapy.",
                                             "An antibiotic with severe side effects such as kidney failure and neurological conditions, which is therefore restricted for use against multiple
                                             drug resistant Tuberculosis.",
                                             "First discovered in 1936, it was first used against TB in 1952. Although showing no effect in-vitro it was shown to be effective in treating TB in mice.
                                             Used only for treating TB and never on it's own.",
                                             "After a successful trial, which showed high effectiveness
                                             for the vaccine, BCG was introduced in the UK for those at school leaving age
                                             as peak incidence was then in young, working-adults.",
                                             "Believed to work by interfering with TB bacteria's metabolism. There are some concerns that it may not be safe to give during pregancy,
                                             as it may lead to vision loss in the baby.",
                                             "Taken daily for at least a period of 6 months, if given alone resistance develops quickly. It may also be used in the treatment
                                             of MRSA amongst other diseases.",
                                             "Directly Observed Treatment, Short-Course (DOTS) is introdued by the World Health Organisation as a control strategy for TB. The intermittent, supervised system
                                             aims to eliminate drug default.",
                                             "Due to a continued decline in TB incidence rates in the indigenous UK population, the BCG 
                                             programme was refocused as risk-based. This meant vaccinating high risk neonates rather than those 
                                             most likely to transmit TB.",
                                             "The first new antiobiotic for use against TB in 40 years, reserved for use against multiple drug resistant TB. Approved via a fast track process, higher mortality in those that recieve the antibiotic has caused
                                             significant concern."))





#' Add to package
devtools::use_data(tb_interventions_timeline, overwrite = TRUE)

#' Add as raw csv
write_csv(tb_interventions_timeline, "tb_intervetions_timeline.csv")

