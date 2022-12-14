library(rvest)
library(tidyverse)

col_link ="https://covid19.ncdc.gov.ng/"
col_page = read_html(col_link)

col_table = col_page %>% html_nodes( "table#custom1") %>% html_table() 
col_table

covid_table = col_table[[1]]
View(covid_table)

covid_table[,1]


write.csv(covid_table, "C:/Users/HP/Desktop/Business-Data_Lab/covid19-ncdc/ncdc_data.csv",
          row.names = FALSE )
