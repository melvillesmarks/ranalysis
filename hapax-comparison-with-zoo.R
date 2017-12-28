setwd("~/GitSpace/ranalysis/")
#load xml package
library(XML)
#load the xml file as a document object
doc <- xmlTreeParse("460-markings-only.xml", useInternalNodes=TRUE)
#retrieve specified nodes from the doc object with an XPath


#get Measure for Measure hapax
MMdivs.ns.l <- getNodeSet(doc, "/body//div[@play='5a']")
#the following two list objects store the results of the
#succeeding forloop
MMdivs.ns.l
divs.MM.l <- list()
div.MMfreqs.l <- list()
div.MMraws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(MMdivs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(MMdivs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(MMdivs.ns.l[[i]], "w", recursive = TRUE)
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
  divs.MM.l[[div.content]] <- word.v
  #calculate frequencies
  div.MMfreqs.t <- table(word.v)
  div.MMraws.l[[div.content]] <- div.MMfreqs.t
  div.MMfreqs.l[[div.content]] <- 100*(div.MMfreqs.t/sum(div.MMfreqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.MM.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
div.MMraws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
div.MMfreqs.l
div.MMfreqs.t

MM.hapax.v <- sapply(div.MMraws.l, function(x) sum(x == 1))
MM.lengths.m <- do.call(rbind, lapply(div.MMraws.l,sum))
MMhapax.percentage <- MM.hapax.v / MM.lengths.m

#get Henry VIII hapax
H8divs.ns.l <- getNodeSet(doc, "/body//div[@play='6b']")
#the following two list objects store the results of the
#succeeding forloop
H8divs.ns.l
divs.h8.l <- list()
divs.h8freqs.l <- list()
divs.h8raws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(H8divs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(H8divs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(H8divs.ns.l[[i]], "w", recursive = TRUE)
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
  divs.h8.l[[div.content]] <- word.v
  #calculate frequencies
  divs.h8freqs.t <- table(word.v)
  divs.h8raws.l[[div.content]] <- divs.h8freqs.t
  divs.h8freqs.l[[div.content]] <- 100*(divs.h8freqs.t/sum(divs.h8freqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.h8.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.h8raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.h8freqs.l
divs.h8freqs.t

H8.hapax.v <- sapply(divs.h8raws.l, function(x) sum(x == 1))
H8.lengths.m <- do.call(rbind, lapply(divs.h8raws.l,sum))
H8hapax.percentage <- H8.hapax.v / H8.lengths.m

#get Antony and Cleopatra hapax
ACdivs.ns.l <- getNodeSet(doc, "/body//div[@play='4c']")
#the following two list objects store the results of the
#succeeding forloop
ACdivs.ns.l
divs.AC.l <- list()
divs.ACfreqs.l <- list()
divs.ACraws.l <- list()
#the for loop will tokenize and calculate words in each div
for(i in 1:length(ACdivs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(ACdivs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(ACdivs.ns.l[[i]], "w", recursive = TRUE)
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
  divs.AC.l[[div.content]] <- word.v
  #calculate frequencies
  divs.ACfreqs.t <- table(word.v)
  divs.ACraws.l[[div.content]] <- divs.ACfreqs.t
  divs.ACfreqs.l[[div.content]] <- 100*(divs.ACfreqs.t/sum(divs.ACfreqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.AC.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.ACraws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.ACfreqs.l
divs.ACfreqs.t

AC.hapax.v <- sapply(divs.ACraws.l, function(x) sum(x == 1))
AC.lengths.m <- do.call(rbind, lapply(divs.ACraws.l,sum))
AChapax.percentage <- AC.hapax.v / AC.lengths.m

#combine all together
library(zoo)
z <- merge(zoo(MMhapax.percentage), zoo(H8hapax.percentage), 
           zoo(AChapax.percentage, seq(AChapax.percentage)+.5))
colnames(z) <- c("Measure for Measure", "Henry VIII", "Antony & Cleopatra")
plot(z, main = "Lexical richness comparison, with hapax analysis", 
     xlab = "# of markings", 
     type = "h", 
     plot.type = "multiple", 
     col = 1, lwd = 10) 
