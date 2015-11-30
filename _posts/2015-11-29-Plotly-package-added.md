---
title: Plotly package added
layout: post
---

Create amazing charts with the power of **[Plotly]** and save it wherever you want (without needing a Plotly account).

## Example

<iframe width="100%" height="500px" src="http://nafiux.com.s3-website-us-east-1.amazonaws.com/test/plotly-r.html"></iframe>

### Create a chart using **Plotly** with data (query) from RedShift

	library("RPostgreSQL")
	drv <- dbDriver("PostgreSQL")
	con <- dbConnect(
		drv,
		host="YourDataWareHouse.us-east-1.redshift.amazonaws.com",
		port="5439",
		dbname="tehuixtla",
		user="pueblo",
		password="querido"
	)
	projectId <- commandArgs(trailingOnly=TRUE)[1]
	query <- paste0("SELECT field1, field2, field3 FROM table1 WHERE field3 IN ( SELECT field3 FROM table2 WHERE projectid = '", projectId, "') ORDER BY field1")
	records <- dbGetQuery(con, query)

	library(plotly)

	p <- plot_ly(records, x = field1, y = field2, color = field3)
	p
	
	##########################
	### Two magic lines!!! ###
	##########################

	files <- list.files(tempdir(), pattern = "\\.html$", recursive=TRUE)
	file.copy(paste0(tempdir(), "/", files[1]), paste0("/tmp/", projectId, ".html"), overwrite = TRUE)

### About the two magic lines

Every time that you runs R, it creates a new temporary folder for each session, so that when you call plot_ly function, it creates a html file in this temporary folder.

Having this in mind, you can get the html output file from the temporary folder and save it wherever you need.

[Plotly]: https://github.com/ropensci/plotly