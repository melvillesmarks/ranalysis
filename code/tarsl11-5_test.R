library(XML)#lines 2-11 below combine multiple files into one object for analysis
input.dir <- "460_xml2"
files.v <- dir(path=input.dir, pattern=".*xml")
for (i in 1:length(files.v)){
  #some code here
}
file.path(input.dir, files.v[1])
length(files.v)
file.path(input.dir, files.v[i])
doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
doc.object
source("corpusFunctions.r")
div.freqs.l <- list()
for(i in 1:length(files.v)){
  doc.object <- xmlTreeParse(file.path(input.dir, files.v[i]), useInternalNodes=TRUE)
  worddata <- getWordTableList(doc.object)
  div.freqs.l[[files.v[i]]] <- worddata
}
worddata
div.freqs.l
thy <- do.call(rbind, lapply(div.freqs.l, '[', 'thy'))
death <- do.call(rbind, lapply(div.freqs.l, '[', 'death'))
thy.death <- cbind(thy, death)
thy.death[which(is.na(thy.death))] <- 0
colnames(thy.death) <- c("thy", "death")
barplot(thy.death, beside=T, col="grey", main="Frequencies for 'thy' and 'death' in passages marked by Herman Melville in Shakespeare's Plays", ylab = "Term percentage value within text marked", xlab = "Comedies, Histories, and Tragedies combined")
thy.death.df <- as.data.frame(thy.death)
cor.test(thy.death.df$thy, thy.death.df$death)
