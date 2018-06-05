setwd(" ")
#load xml package
library(XML)
#load the xml file as a document object
doc <- xmlTreeParse("460-markings-only.xml", useInternalNodes=TRUE)
#retrieve specified nodes from the doc object with an XPath
#expression that id's desired attribute values and excludes others
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM']
                        [not(contains(@mode, 'commentary'))][not(contains(@type, 'notation'))]")
#the following two list objects store the results of the
#succeeding forloop
divs.ns.l
divs.all.l <- list()
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
  divs.all.l[[div.content]] <- word.v
  #calculate frequencies
  div.freqs.t <- table(word.v)
  div.raws.l[[div.content]] <- div.freqs.t
  div.freqs.l[[div.content]] <- 100*(div.freqs.t/sum(div.freqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
(divs.all.l)
divs.all.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
div.raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
div.freqs.l
div.freqs.t

all.hapax.v <- sapply(div.raws.l, function(x) sum(x == 1))
all.lengths.m <- do.call(rbind, lapply(div.raws.l,sum))
hapax.percentage <- all.hapax.v / all.lengths.m
barplot(hapax.percentage, main = "Hapax analysis of all Melville's markings in Shakespeare's plays",
        xlab = "Each marking", ylab = "Lexical variety", beside=T, col="grey", names.arg = seq(1:length(div.freqs.l)))

