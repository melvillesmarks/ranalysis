# experimenting with type / token ratios
setwd("~/GitSpace/ranalysis/")
library(XML)
doc <- xmlTreeParse("358b-markings-only.xml", useInternalNodes=TRUE)
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM'][not(contains(@mode, 'commentary'))][not(contains(@type, 'notation'))]")
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
div.freqs.un.v <- unlist(div.freqs.l)
sorted.div.freqs.v <- sort(div.freqs.un.v, decreasing=T)
write.table(sorted.div.freqs.v, "358b.freqs.v.sorted.txt")

length(div.raws.l)
names(div.raws.l)
str(div.raws.l)
sink("358bdivs.txt")
#sink function exports specified object to the newly created file
print(div.raws.l)
#cancels the sink function
sink()

# mean word frequency
sum(div.raws.l[[1]])/length(div.raws.l[[1]])
mean(div.raws.l[[1]]) # meaning: each word type in the first chapter is used an average of 1.058 times

# to extract the frequency data from all of the chapters at once
lapply(div.raws.l,mean)
# putting results into a matric object
mean.word.use.m <- do.call(rbind, lapply(div.raws.l,mean))
dim(mean.word.use.m)
# this reports 703 rows in 1 column, but there's more info in the matrix
plot(mean.word.use.m, type = "h", main = "Mean word usage patterns in Melville's markings in Milton",
     ylab = "mean word use", xlab = "nodes (each marking)",
     xaxt="n")
axis(1, at = seq(0,490,by=5), labels = FALSE, tck=-.015)
xtick <- seq(0, 490, by=20)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 20, xpd = TRUE)
# using scale to method has the effect of sub- tracting away the expected value 
# (expected as calculated by the overall mean) and then showing only the deviations from the mean
scale(mean.word.use.m)
plot(scale(mean.word.use.m), type = "h", main = "Scaled mean word usage patterns in Melville's markings in Milton's works",
     ylab = "mean word use", xlab = "nodes (each marking)", xaxt = "n") 
axis(1, at = seq(0,490,by=5), labels = FALSE, tck=-.015)
xtick <- seq(0, 490, by=20)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 20, xpd = TRUE)
# 0 on the y-axis corresponds to the mean across the entire set of markings
mean.word.use.m[order(mean.word.use.m, decreasing=TRUE),]
# calculate TTR for first node
length(div.raws.l[[1]])/sum(div.raws.l[[1]])*100
# now use lapply to run across all nodes
ttr.l <- lapply(div.raws.l, function(x) {length(x)/sum(x)*100})
ttr.m <- do.call(rbind, ttr.l)
ttr.m[order(ttr.m, decreasing = TRUE),]
plot(ttr.m, type = "h", main = "Type-token ratios in Melville's markings in Milton's works",
     ylab = "lexical variety", xlab = "nodes (each marking)", xaxt = "n")
axis(1, at = seq(0,490,by=5), labels = FALSE, tck=-.015)
xtick <- seq(0, 490, by=20)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 20, xpd = TRUE)
