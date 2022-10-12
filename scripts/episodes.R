# Stranger Things writers and directors
# Last updated 2022-10-12

# Load packages ----

library(janitor)
library(tidyverse)

# Extract tables from url ----

# set url
url <- "https://en.wikipedia.org/wiki/List_of_Stranger_Things_episodes"

# read the HTML code from the website
webpage <- rvest::read_html(url)

# use CSS selectors to scrape the table and convert to data frames
tables <- rvest::html_nodes(webpage, "table.wikitable") |> 
  rvest::html_table(header = TRUE, na.strings = c(NA, ""), convert = TRUE)

# Season 01 ----

s01 <- tables[[2]] |> 
  janitor::clean_names() |> 
  dplyr::mutate(season = 1,
                episode = no_inseason,
                title = gsub('.*"(.*)".*', "\\1", title),
                original_release_date = lubridate::as_date(gsub(".*\\((.*)\\).*", "\\1", original_release_date)),
                written_by = dplyr::case_when(episode == 8 ~ "Paul Dichter (story) & The Duffer Brothers (teleplay)",
                                              TRUE ~ written_by)) |> 
  dplyr::select(season, episode, title:original_release_date)


# Season 02 ----

s02 <- tables[[3]] |> 
  janitor::clean_names() |> 
  dplyr::mutate(season = 2,
                episode = no_inseason,
                title = gsub('.*"(.*)".*', "\\1", title),
                original_release_date = lubridate::as_date(gsub(".*\\((.*)\\).*", "\\1", original_release_date))) |> 
  dplyr::select(season, episode, title:original_release_date)

s02

# Season 03 ----

s03 <- tables[[4]] |> 
  janitor::clean_names() |> 
  dplyr::mutate(season = 3,
                episode = no_inseason,
                title = gsub('.*"(.*)".*', "\\1", title),
                original_release_date = lubridate::as_date(gsub(".*\\((.*)\\).*", "\\1", original_release_date))) |> 
  dplyr::select(season, episode, title:original_release_date)

# Season 04 ----

s04 <- tables[[5]] |> 
  janitor::clean_names() |> 
  dplyr::filter(!no_overall %in% c("Volume 1", "Volume 2")) |> 
  dplyr::mutate(season = 4,
                episode = no_inseason,
                title = gsub('.*"(.*)".*', "\\1", title),
                original_release_date = lubridate::as_date(gsub(".*\\((.*)\\).*", "\\1", original_release_date))) |> 
  dplyr::select(season, episode, title:original_release_date)

s04

# Regroup all seasons in 1 table ----

episodes <- rbind(s01, s02, s03, s04)

# Export dataset ----

readr::write_csv(episodes, "data/episodes.csv")
