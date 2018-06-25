setwd("~/Desktop/git-space/ranalysis/358b-content-sos/")
#load xml package
library(XML)
#load the xml file as a document object
doc <- xmlTreeParse("358b-stripped.xml", useInternalNodes=TRUE)
#retrieve specified nodes from the doc object with an XPath

#the following code blocks create hapax percentages for each play, which can then be visualized as bar graphs

#get each @work for individual analyses of each book

#pl
b1divs.ns.l <- getNodeSet(doc, "/body//div[@work='pl']")
#the following two list objects store the results of the
#succeeding forloop
b1divs.ns.l
divs.b1.l <- list()
div.b1freqs.l <- list()
div.b1raws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(b1divs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(b1divs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(b1divs.ns.l[[i]], "w", recursive = TRUE)
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
  divs.b1.l[[div.content]] <- word.v
  #calculate frequencies
  div.b1freqs.t <- table(word.v)
  div.b1raws.l[[div.content]] <- div.b1freqs.t
  div.b1freqs.l[[div.content]] <- 100*(div.b1freqs.t/sum(div.b1freqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.b1.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
div.b1raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
div.b1freqs.l
div.b1freqs.t

b1.hapax.v <- sapply(div.b1raws.l, function(x) sum(x == 1))
b1.lengths.m <- do.call(rbind, lapply(div.b1raws.l,sum))
b1hapax.percentage <- b1.hapax.v / b1.lengths.m

#pr
b2divs.ns.l <- getNodeSet(doc, "/body//div[@work='pr']")
#the following two list objects store the results of the
#succeeding forloop
b2divs.ns.l
divs.b2.l <- list()
divs.b2freqs.l <- list()
divs.b2raws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(b2divs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(b2divs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(b2divs.ns.l[[i]], "w", recursive = TRUE)
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
  divs.b2.l[[div.content]] <- word.v
  #calculate frequencies
  divs.b2freqs.t <- table(word.v)
  divs.b2raws.l[[div.content]] <- divs.b2freqs.t
  divs.b2freqs.l[[div.content]] <- 100*(divs.b2freqs.t/sum(divs.b2freqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.b2.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.b2raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.b2freqs.l
divs.b2freqs.t

b2.hapax.v <- sapply(divs.b2raws.l, function(x) sum(x == 1))
b2.lengths.m <- do.call(rbind, lapply(divs.b2raws.l,sum))
b2hapax.percentage <- b2.hapax.v / b2.lengths.m

#samson agonistes
b3divs.ns.l <- getNodeSet(doc, "/body//div[@work='samag']")
#the following two list objects store the results of the
#succeeding forloop
b3divs.ns.l
divs.b3.l <- list()
divs.b3freqs.l <- list()
divs.b3raws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(b3divs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(b3divs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(b3divs.ns.l[[i]], "w", recursive = TRUE)
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
  divs.b3.l[[div.content]] <- word.v
  #calculate frequencies
  divs.b3freqs.t <- table(word.v)
  divs.b3raws.l[[div.content]] <- divs.b3freqs.t
  divs.b3freqs.l[[div.content]] <- 100*(divs.b3freqs.t/sum(divs.b3freqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.b3.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.b3raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.b3freqs.l
divs.b3freqs.t

b3.hapax.v <- sapply(divs.b3raws.l, function(x) sum(x == 1))
b3.lengths.m <- do.call(rbind, lapply(divs.b3raws.l,sum))
b3hapax.percentage <- b3.hapax.v / b3.lengths.m

#get comus 
b4divs.ns.l <- getNodeSet(doc, "/body//div[@work='com']")
#the following two list objects store the results of the
#succeeding forloop
b4divs.ns.l
divs.b4.l <- list()
divs.b4freqs.l <- list()
divs.b4raws.l <- list()
#the for loop will tokenize and calculate words in eb4h div
for(i in 1:length(b4divs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(b4divs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(b4divs.ns.l[[i]], "w", recursive = TRUE)
  #combines word tag content within eb4h div
  div.words.v <- paste(sapply(words.ns, xmlValue))
  #convert charb4ters to lowercase
  words.lower.v <- tolower(div.words.v)
  #tokenize words, restricting content to alphabetical charb4ters,
  #apostrophes (for contrb4ted word forms), and hyphens (for compound expressions)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  #strsplit product is a list. restore to vector with unlist
  word.v <- unlist(words.l)
  #remove any remaining whitespb4e created from culled punctuation
  word.v <- word.v[which(word.v!="")]
  #create a list of the relevant nodes and their word content
  divs.b4.l[[div.content]] <- word.v
  #calculate frequencies
  divs.b4freqs.t <- table(word.v)
  divs.b4raws.l[[div.content]] <- divs.b4freqs.t
  divs.b4freqs.l[[div.content]] <- 100*(divs.b4freqs.t/sum(divs.b4freqs.t))
}

#outputs sequential node list and word tokens for the full object
divs.b4.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.b4raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.b4freqs.l
divs.b4freqs.t

b4.hapax.v <- sapply(divs.b4raws.l, function(x) sum(x == 1))
b4.lengths.m <- do.call(rbind, lapply(divs.b4raws.l,sum))
b4hapax.percentage <- b4.hapax.v / b4.lengths.m


#combine hapax percentages to be visualized
library(zoo)
#invoke "zoo" to merge each hapax % variable

#this plots three works
z <- merge(zoo(b1hapax.percentage), zoo(b2hapax.percentage), 
           zoo(b3hapax.percentage), zoo(b4hapax.percentage))
#label each graph as a column, following the order of each "zoo" invocation" 
colnames(z) <- c("Paradise Lost", "Paradise Regained", "Samson Agonistes", "Comus")

plot(z, main = "Lexical richness comparison, with hapax analysis, of Melville's markings in Milton", 
     xlab = "# of markings", 
     type = "h", 
     plot.type = "multiple", 
     col = 1, lwd = 4)
