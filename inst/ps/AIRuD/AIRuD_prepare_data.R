# Data preparation for the RTutor problem set AIRuD
#
# Creates the data sets df1.dta to df7.dta used in the problem set from the
# replication files of Baruffaldi, Simeth, and Wehrheim (2024, Management
# Science, doi:10.1287/mnsc.2023.4721).
#
# This script is not part of the interactive problem set. It documents how the
# data in inst/ps/AIRuD/material/ were generated. To rerun it, place the
# original replication files (bsw2022+data+*.dta) in raw_dir.

library(haven)
library(dplyr)

raw_dir <- "."   # folder containing the original replication files
out_dir <- "."   # folder to which df1.dta to df7.dta are written

read_raw  <- function(file) read_dta(file.path(raw_dir, file))
write_out <- function(data, file) write_dta(data, file.path(out_dir, file))


# Shared preparation of the baseline sample (bsw2022+data+T2.dta)
# LN_PUB is stored as ln(1 + PUB), so the publication count is recovered by
# back-transforming and rounding to the nearest integer.
prepare_baseline <- function() {
  read_raw("bsw2022+data+T2.dta") %>%
    select(-IHS_PUB) %>%
    mutate(PUB = round(exp(LN_PUB) - 1)) %>%
    relocate(FYEAR, E_ID, FIRM_ID) %>%
    relocate(PUB, COV, BASPRD, .after = LN_PUB)
}


# df1: baseline sample without treatment indicators
df1 <- prepare_baseline() %>%
  select(-TREATED, -POST, -TREATED_X_POST)
write_out(df1, "df1.dta")


# df2: baseline sample with treatment indicators as leading columns
df2 <- prepare_baseline() %>%
  relocate(TREATED_X_POST, TREATED, POST)
write_out(df2, "df2.dta")


# df3: data for the event-study figure (bsw2022+data+FIG1.dta)
write_out(read_raw("bsw2022+data+FIG1.dta"), "df3.dta")


# df4: matched sample with matching weights (bsw2022+data+T3.dta)
df4 <- read_raw("bsw2022+data+T3.dta") %>%
  select(weight = `_weight`, TREATED_X_POST, TREATED, POST,
         FYEAR, E_ID, FIRM_ID, LN_PUB, COV, BASPRD)
write_out(df4, "df4.dta")


# df5 to df7: samples for the three heterogeneity splits
write_out(read_raw("bsw2022+data+T4+A+2.dta"), "df5.dta")
write_out(read_raw("bsw2022+data+T4+B+2.dta"), "df6.dta")
write_out(read_raw("bsw2022+data+T4+C+1.dta"), "df7.dta")
