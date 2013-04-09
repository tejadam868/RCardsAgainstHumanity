cards <- read.csv("./Cards Against Humanity - All Cards.csv", stringsAsFactors=FALSE)
black <- subset(cards, !White)
black$question <- !grepl("____", black$String)
black$String <- gsub("_____", "____", black$String, fixed=TRUE)
white <- subset(cards, White)

getCombo <- function(){
  samp.b <- black[sample(1:nrow(black), 1), ]
  samp.w <- white[sample(1:nrow(white), samp.b$Pick), ]
  
  fortune <- samp.b$String
  for(i in samp.w$String){
    if(samp.b$question) fortune <- paste(fortune, i, sep="\n") else
      fortune <- sub("____", gsub(".", "", i, fixed=TRUE), fortune, fixed=TRUE)
  }
  cat(fortune)
}


