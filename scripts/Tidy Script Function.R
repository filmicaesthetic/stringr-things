# tidy script function

tidy_script <- function(pdftext) {
  
  # paste as a single string
  ep_string <- paste(pdftext, sep = " ", collapse = "\\\n")
  
  # split by line with \n
  ep_byline <- str_extract_all(ep_string, "\\\n.*")
  
  # convert to dataframe
  ep_byline_df <- data.frame(ep_byline[[1]])
  
  # tidy text 
  ep_squish <-  ep_byline_df |>
    mutate(ep_byline..1.. = str_squish(ep_byline..1..))
  
  # get row containing page 1 text
  start_line <- which(ep_squish$ep_byline..1.. == "Page |1")
  
  # remove text above page 1
  ep_script <- data.frame(ep_squish[start_line:nrow(ep_squish),])
  
  colnames(ep_script) <- "raw_text"
  
  # filter out irrelevant lines
  ep_filt <- ep_script |>
    filter(!(raw_text %in% c("8FLiX.com TRANSCRIPT DATABASE", "FOR EDUCATIONAL USE ONLY", "\\", "", "This transcript is for educational use only.", "Not to be sold or auctioned.")),
           !(substr(raw_text, 1, 6) == "Page |"),
           !(substr(raw_text, 1, 6) == "P a g "))
  
  ep_split <- ep_filt |>
    mutate(time = ifelse(grepl("-->", raw_text) == TRUE, raw_text, NA),
           line = ifelse(grepl("^[0-9]+$", raw_text) == TRUE, as.numeric(raw_text), NA),
           stage_direction = str_squish(str_extract(raw_text, "\\[(.*?)\\]")),
           dialogue = str_squish(gsub("\\[(.*?)\\]", "", gsub("-", "", raw_text)))) |>
    fill(time, .direction = "down") |>
    fill(line, .direction = "down")
  
  ep_timesplit <- ep_split
  ep_timesplit[c("start_time", "end_time")] <- str_split_fixed(string = ep_timesplit$time, pattern = " --> ", n = 2)
  ep_timesplit <- ep_timesplit |>
    select(-time)
  
  
  ep_tidy <- ep_timesplit |>
    filter(grepl("[a-zA-Z]", raw_text) == TRUE)
  
  ep_groupline <- ep_tidy |>
    group_by(line) |>
    summarise(raw_text = paste0(raw_text, collapse = " "),
              stage_direction = paste0(stage_direction[!is.na(stage_direction)], collapse = " "),
              dialogue = paste0(dialogue, collapse = " "),
              start_time = first(start_time),
              end_time = first(end_time)) |>
    arrange(line) |>
    filter(!is.na(line)) |>
    select(season, episode, line, raw_text, stage_direction, dialogue, start_time, end_time)
  
  return(ep_groupline)
  
}
