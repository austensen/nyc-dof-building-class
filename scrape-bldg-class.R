library(dplyr) # data manipulation
library(readr) # write files
library(janitor) # clean_names()
library(rvest) # web scraping
library(xml2) # read_html()


dof_page <- read_html("https://www1.nyc.gov/assets/finance/jump/hlpbldgcode.html")

buildig_classes <- dof_page %>% 
  html_node("table") %>% 
  html_table() %>% 
  clean_names() %>% 
  filter(building_code != description)

write_csv(buildig_classes, "data/dof_bldg_class_desc.csv")
