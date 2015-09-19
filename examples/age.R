(today <- Sys.Date())
(year <- format(today, "%Y"))
(birthYear <- commandArgs(trailingOnly=TRUE)[1])
as.numeric(year) - as.numeric(birthYear)