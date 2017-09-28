library(XML)
doc <- xmlTreeParse("460_1_c369.xml", useInternalNodes=TRUE)
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM']")
divs.ns.l[[1]]
divs.ns.l
xmlValue(divs.ns.l[[1]])
div.title <- xmlElementsByTagName(divs.ns.l[[1]], "w", recursive = TRUE)
div.title
div.freqs.l <- list()
div.raws.l <- list()
for(i in 1:length(divs.ns.l)){
  div.title <- xmlValue(divs.ns.l[[i]], "div")[[1]]
  words.ns <- xmlElementsByTagName(divs.ns.l[[i]], "w", recursive = TRUE)
  div.words.v <- paste(sapply(words.ns, xmlValue), collapse=" ")
  words.lower.v <- tolower(div.words.v)
  words.l <- strsplit(words.lower.v, "[^A-Za-z']")
  word.v <- unlist(words.l)
  word.v <- word.v[which(word.v!="")]
  div.freqs.t <- table(word.v)
  div.raws.l[[div.title]] <- div.freqs.t
  div.freqs.l[[div.title]] <- 100*(div.freqs.t/sum(div.freqs.t))
}
div.freqs.l
word.v
thy <- do.call(rbind, lapply(div.freqs.l, '[', 'thy'))
death <- do.call(rbind, lapply(div.freqs.l, '[', 'death'))
thy.death <- cbind(thy, death)
thy.death[which(is.na(thy.death))] <- 0
colnames(thy.death) <- c("thy", "death")
barplot(thy.death, beside=T, col="grey", main="Frequencies for 'thy' and 'death' in passages marked by Herman Melville in Shakespeare's Plays", ylab = "Term percentage value within text marked", xlab = "Comedies, Histories, and Tragedies combined")
thy.death.df <- as.data.frame(thy.death)
cor.test(thy.death.df$thy, thy.death.df$death)
