---
title: RPostgreSQL Integration (works with RedShift)
layout: post
---

Now you can use RPostgreSQL directly in your R scripts (to call AWS RedShift for example).

## Example

### Create a chart using ggplot2 with data (query) from RedShift

	library("RPostgreSQL")
	require(ggplot2)
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
	chartFile <- commandArgs(trailingOnly=TRUE)[2]

	query <- paste0("SELECT field1, field2, field3 FROM table1 WHERE field3 IN ( SELECT field3 FROM table2 WHERE projectid = '", projectId, "') ORDER BY field1")

	print(query)

	data <- dbGetQuery(con, query)

	png(filename=chartFile, width=640, height=480)

	g <- ggplot(data, aes(field2, field2, color=field3))+geom_line(cex=.2)+theme(legend.position="none")

	print(g)
	dev.off();
