setwd("~/GitSpace/ranalysis/markup/")
#load xml package
library(XML)
#load the xml file as a document object
doc <- xmlTreeParse("358b-stripped.xml", useInternalNodes=TRUE)
#retrieve specified nodes from the doc object with an XPath
#expression that id's desired attribute values and excludes others
divs.ns.l <- getNodeSet(doc, "/body//*[@section='pl8']")
#the following two list objects store the results of the
#succeeding forloop
divs.ns.l
div.freqs.l <- list()
div.raws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(divs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(divs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(divs.ns.l[[i]], "w", recursive = TRUE)
  #combines word tag content within each div
  div.words.v <- paste(sapply(words.ns, xmlValue))
  #convert characters to lowercase
  words.lower.v <- tolower(div.words.v)
  #tokenize words, restricting content to alphabetical characters,
  #apostrophes (for contracted word forms), and hyphens (for compound expressions)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  #strsplit product is a list. restore to vector with unlist
  word.v <- unlist(words.l)
  #remove any remaining whitespace created from culled punctuation
  word.v <- word.v[which(word.v!="")]
  #create a list of the relevant nodes and their word content
  div.raws.l[[div.content]] <- word.v
  #calculate frequencies
  div.freqs.t <- table(word.v)
  div.raws.l[[div.content]] <- div.freqs.t
  div.freqs.l[[div.content]] <- 100*(div.freqs.t/sum(div.freqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
(divs.genres.l)
divs.genres.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
div.raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
div.freqs.l
div.freqs.t
v1 <- xpathApply(doc, "//div[@play='5a']", xmlGetAttr, "play")
v2 <- xpathApply(doc, "//div[@play='6b']", xmlGetAttr, "play")
v3 <- xpathApply(doc, "//div[@play='4c']", xmlGetAttr, "play")
v4 <- xpathApply(doc, "//div[@play='1c']", xmlGetAttr, "play")
genres.hapax.v <- sapply(div.raws.l, function(x) sum(x == 1))
genres.lengths.m <- do.call(rbind, lapply(div.raws.l,sum))
hapax.percentage <- genres.hapax.v / genres.lengths.m

barplot(hapax.percentage, main = "Hapax Analysis of Marked Passages in Book 8 of Paradise Lost",
        ylab = "Lexical uniqueness",
        xlab = "Marked passages",
        beside=T, col="grey")
axis(1, at = seq(1, 22,by=1), labels = FALSE, tck=-.015)
xtick <- seq(1, 21, by=1)
text(x=xtick,  par("usr")[3], cex=.75, pos=1, 
     labels = xtick, srt = 0, xpd = TRUE)


