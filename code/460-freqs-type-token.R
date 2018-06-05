# experimenting with type / token ratios
setwd("~/GitSpace/ranalysis/markup/")
library(XML)
doc <- xmlTreeParse("460-markings-only.xml", useInternalNodes=TRUE)
divs.ns.l1c <- getNodeSet(doc, "/body//div[@play='1c']")
divs.ns.l7c <- getNodeSet(doc, "/body//div[@play='7c']")
divs.ns.l9c <- getNodeSet(doc, "/body//div[@play='9c']")
divs.ns.l10c <- getNodeSet(doc, "/body//div[@play='10c']")
divs.ns.l <- c(divs.ns.l1c, divs.ns.l7c, divs.ns.l9c, divs.ns.l10c)
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
div.freqs.un.v <- unlist(div.freqs.l)
sorted.div.freqs.v <- sort(div.freqs.un.v, decreasing=T)
sorted.div.freqs.v <- table(sorted.div.freqs.v)
write.csv(sorted.div.freqs.df, "460.1c-7c-9c-10c.freqs.v.sorted.csv")


length(div.raws.l)
sum(div.raws.l[[1]])
length(div.raws.l[[1]])
names(div.raws.l)
str(div.raws.l)
# mean word frequency
sum(div.raws.l[[1]])/length(div.raws.l[[1]])
mean(div.raws.l[[1]]) # meaning: each word type in the first chapter is used an average of 1.058 times

# to extract the frequency data from all of the chapters at once
lapply(div.raws.l,mean)
# putting results into a matric object
mean.word.use.m <- do.call(rbind, lapply(div.raws.l,mean))
dim(mean.word.use.m)
# this reports 703 rows in 1 column, but there's more info in the matrix

plot(mean.word.use.m, type = "h", main = "Mean word usage patterns in Melville's markings in Shakespeare",
     ylab = "mean word use", xlab = "nodes (each marking): 
     1-288, comedies; 290-355, histories; 355-363, other; 364-638, tragedies; 639-650, other",
     xaxt="n")
axis(1, at = seq(0,650,by=5), labels = FALSE, tck=-.015)
xtick <- seq(0, 650, by=25)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 25, xpd = TRUE)

# using scale to method has the effect of sub- tracting away the expected value 
# (expected as calculated by the overall mean) and then showing only the deviations from the mean
scale(mean.word.use.m)
plot(scale(mean.word.use.m), type = "h", main = "Scaled mean word usage patterns in Melville's markings in Shakespeare",
     ylab = "scaled mean word use", xlab = "nodes (each marking <div>): 
     1-288, comedies; 290-355, histories; 355-363, other; 364-638, tragedies; 639-650, other",
     xaxt = "n")
axis(1, at = seq(0,650,by=5), labels = FALSE, tck=-.01)
xtick <- seq(0, 650, by=25)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 25, xpd = TRUE)
# 0 on the y-axis corresponds to the mean across the entire set of markings
mean.word.use.m[order(mean.word.use.m, decreasing=TRUE),]
# calculate TTR for first node
length(div.raws.l[[1]])/sum(div.raws.l[[1]])*100
# now use lapply to run across all nodes
ttr.l <- lapply(div.raws.l, function(x) {length(x)/sum(x)*100})
ttr.m <- do.call(rbind, ttr.l)
ttr.m[order(ttr.m, decreasing = TRUE),]
plot(ttr.m, type = "h", main = "Type-token ratios in Melville's markings in Shakespeare",
     ylab = "lexical variety", xlab = "nodes (each marking <div>): 
     1-288, comedies; 290-355, histories; 355-363, other; 364-638, tragedies; 639-650, other",
     xaxt = "n")
axis(1, at = seq(0,650,by=5), labels = FALSE, tck=-.01)
xtick <- seq(0, 650, by=25)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 25, xpd = TRUE)
