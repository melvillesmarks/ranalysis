getWordTableList <- function(doc.object){
  divs <- getNodeSet(doc.object, "/body//*[@attribution='HM']")
  wordtags <- xmlElementsByTagName(divs[[1]], "w", recursive = TRUE)
  words <- paste(sapply(wordtags, xmlValue), collapse=" ")
  words.lower <- tolower(words)
  words.l <- strsplit(words.lower, "[^A-Za-z']")
  word.v <- unlist(words.l)
  div.freqs.t <- table(word.v[which(word.v!="")])
  div.freqs.rel.t <- 100*(div.freqs.t/sum(div.freqs.t))
  return(div.freqs.rel.t)
}
