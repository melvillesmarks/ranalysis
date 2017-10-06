library(XML)
doc <- xmlTreeParse("460.xml", useInternalNodes=TRUE)
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM']")
divs.ns.l
div.freqs.l <- list()
div.raws.l <- list()
for(i in 1:length(divs.ns.l)){
  div.content <- xmlValue(divs.ns.l[[i]], "div")[[1]]
  words.ns <- xmlElementsByTagName(divs.ns.l[[i]], "w", recursive = TRUE)
  div.words.v <- paste(sapply(words.ns, xmlValue), collapse=" ")
  words.lower.v <- tolower(div.words.v)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  word.v <- unlist(words.l)
  word.v <- word.v[which(word.v!="")]
  div.freqs.t <- table(word.v)
  div.raws.l[[div.content]] <- div.freqs.t
  div.freqs.l[[div.content]] <- 100*(div.freqs.t/sum(div.freqs.t))
}
div.freqs.l
love <- do.call(rbind, lapply(div.freqs.l, '[', 'love'))
death <- do.call(rbind, lapply(div.freqs.l, '[', 'death'))
love.death <- cbind(love, death)
love.death[which(is.na(love.death))] <- 0
colnames(love.death) <- c("love", "death")
barplot(love.death, beside=T, col="grey", main="Frequencies for 'love' and 'death' in passages marked by Herman Melville in Shakespeare's Plays", ylab = "Term percentage value within text marked", xlab = "Comedies, Histories, and Tragedies combined")
love.death.df <- as.data.frame(love.death)
cor.test(love.death.df$love, love.death.df$death)
