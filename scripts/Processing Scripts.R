# Process scripts for all seasons

# read PDFs for season 1 scripts
e101 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-101-Chapter-One-The-Vanishing-of-Will-Byers.pdf")
e102 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-102-Chapter-Two-The-Weirdo-on-Maple-Street.pdf")
e103 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-103-Chapter-Three-Holly-Jolly.pdf")
e104 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-104-Chapter-Four-The-Body.pdf")
e105 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-105-Chapter-Five-The-Flea-and-the-Acrobat.pdf")
e106 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-106-Chapter-Six-The-Monster.pdf")
e107 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-107-Chapter-Seven-The-Bathtub.pdf")
e108 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-108-Chapter-Eight-The-Upside-Down.pdf")

# read PDFs for season 2 scripts
e201 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-201-Chapter-One-MADMAX.pdf")
e202 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-202-Chapter-Two-Trick-or-Treat-Freak.pdf")
e203 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-203-Chapter-Three-The-Pollywog.pdf")
e204 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-204-Chapter-Four-Will-the-Wise.pdf")
e205 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-205-Chapter-Five-Dig-Dug.pdf")
e206 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-206-Chapter-Six-The-Spy.pdf")
e207 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-207-Chapter-Seven-The-Lost-Sister.pdf")
e208 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-208-Chapter-Eight-The-Mind-Flayer.pdf")
e209 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-209-Chapter-Nine-The-Gate.pdf")

# read PDFs for season 3 scripts
e301 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-301-Chapter-One-Suzie-Do-You-Copy.pdf")
e302 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-302-Chapter-Two-The-Mall-Rats.pdf")
e303 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-303-Chapter-Three-The-Case-of-the-Missing-Lifeguard.pdf")
e304 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-304-Chapter-Four-The-Sauna-Test.pdf")
e305 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-305-Chapter-Five-The-Flayed.pdf")
e306 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-306-Chapter-Six-E-Pluribus-Unum.pdf")
e307 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-307-Chapter-Seven-The-Bite.pdf")
e308 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-308-Chapter-Eight-The-Battle-of-Starcourt.pdf")

# read PDFs for season 4 scripts
e401 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-401-Chapter-One-The-Hellfire-Club.pdf")
e402 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-402-Chapter-Two-Vecnas-Curse.pdf")
e403 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-403-Chapter-Three-The-Monster-and-the-Superhero.pdf")
e404 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-404-Chapter-Four-Dear-Billy.pdf")
e405 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-405-Chapter-Five-The-Nina-Project.pdf")
e406 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-406-Chapter-Six-The-Dive.pdf")
e407 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-407-Chapter-Seven-The-Massacre-at-Hawkins-Lab.pdf")
e408 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-408-Chapter-Eight-Papa.pdf")
e409 <- pdf_text("https://8flix.com/assets/transcripts/s/tt4574334/Stranger-Things-transcript-409-Chapter-Nine-The-Piggyback.pdf")

# list of episodes by season
s1 <- list(e101, e102, e103, e104, e105, e106, e107, e108)
s2 <- list(e201, e202, e203, e204, e205, e206, e207, e208, e209)
s3 <- list(e301, e302, e303, e304, e305, e306, e307, e308)
s4 <- list(e401, e402, e403, e404, e405, e406, e407, e308, e209)

# list of seasons
seasons <- list(s1, s2, s3, s4)

# create blank dataframe
all_dialogue <- data.frame()

# process scripts into single dataframe
for (s in 1:length(seasons)) {
  
  # tidy scripts
  for (i in 1:length(seasons[[s]])) {
    
    it <- tidy_script(seasons[[s]][[i]])
    
    it$episode <- i
    it$season <- s
    
    all_dialogue <- rbind(all_dialogue, it)
    
  }
}

# save dataframe
write.csv(all_dialogue, "data/stranger_things_all_dialogue.csv", row.names = FALSE)
