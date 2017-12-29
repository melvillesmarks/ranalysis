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

#get King Lear 
KLdivs.ns.l <- getNodeSet(doc, "/body//div[@play='7c']")
#the following two list objects store the results of the
#succeeding forloop
KLdivs.ns.l
divs.KL.l <- list()
divs.KLfreqs.l <- list()
divs.KLraws.l <- list()
#the for loop will tokenize and calculate words in eKLh div
for(i in 1:length(KLdivs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(KLdivs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(KLdivs.ns.l[[i]], "w", recursive = TRUE)
  #combines word tag content within eKLh div
  div.words.v <- paste(sapply(words.ns, xmlValue))
  #convert charKLters to lowercase
  words.lower.v <- tolower(div.words.v)
  #tokenize words, restricting content to alphabetical charKLters,
  #apostrophes (for contrKLted word forms), and hyphens (for compound expressions)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  #strsplit product is a list. restore to vector with unlist
  word.v <- unlist(words.l)
  #remove any remaining whitespKLe created from culled punctuation
  word.v <- word.v[which(word.v!="")]
  #create a list of the relevant nodes and their word content
  divs.KL.l[[div.content]] <- word.v
  #calculate frequencies
  divs.KLfreqs.t <- table(word.v)
  divs.KLraws.l[[div.content]] <- divs.KLfreqs.t
  divs.KLfreqs.l[[div.content]] <- 100*(divs.KLfreqs.t/sum(divs.KLfreqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.KL.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.KLraws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.KLfreqs.l
divs.KLfreqs.t

KL.hapax.v <- sapply(divs.KLraws.l, function(x) sum(x == 1))
KL.lengths.m <- do.call(rbind, lapply(divs.KLraws.l,sum))
KLhapax.percentage <- KL.hapax.v / KL.lengths.m

#get Timon 
Timondivs.ns.l <- getNodeSet(doc, "/body//div[@play='1c']")
#the following two list objects store the results of the
#succeeding forloop
Timondivs.ns.l
divs.Timon.l <- list()
divs.Timonfreqs.l <- list()
divs.Timonraws.l <- list()
#the for loop will tokenize and calculate words in eTimonh div
for(i in 1:length(Timondivs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(Timondivs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(Timondivs.ns.l[[i]], "w", recursive = TRUE)
  #combines word tag content within eTimonh div
  div.words.v <- paste(sapply(words.ns, xmlValue))
  #convert charTimonters to lowercase
  words.lower.v <- tolower(div.words.v)
  #tokenize words, restricting content to alphabetical charTimonters,
  #apostrophes (for contrTimonted word forms), and hyphens (for compound expressions)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  #strsplit product is a list. restore to vector with unlist
  word.v <- unlist(words.l)
  #remove any remaining whitespTimone created from culled punctuation
  word.v <- word.v[which(word.v!="")]
  #create a list of the relevant nodes and their word content
  divs.Timon.l[[div.content]] <- word.v
  #calculate frequencies
  divs.Timonfreqs.t <- table(word.v)
  divs.Timonraws.l[[div.content]] <- divs.Timonfreqs.t
  divs.Timonfreqs.l[[div.content]] <- 100*(divs.Timonfreqs.t/sum(divs.Timonfreqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.Timon.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.Timonraws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.Timonfreqs.l
divs.Timonfreqs.t

Timon.hapax.v <- sapply(divs.Timonraws.l, function(x) sum(x == 1))
Timon.lengths.m <- do.call(rbind, lapply(divs.Timonraws.l,sum))
Timonhapax.percentage <- Timon.hapax.v / Timon.lengths.m

#get Hamlet
Hamdivs.ns.l <- getNodeSet(doc, "/body//div[@play='9c']")
#the following two list objects store the results of the
#succeeding forloop
Hamdivs.ns.l
divs.Ham.l <- list()
divs.Hamfreqs.l <- list()
divs.Hamraws.l <- list()
#the for loop will tokenize and calculate words in eHamh div
for(i in 1:length(Hamdivs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(Hamdivs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(Hamdivs.ns.l[[i]], "w", recursive = TRUE)
  #combines word tag content within eHamh div
  div.words.v <- paste(sapply(words.ns, xmlValue))
  #convert charHamters to lowercase
  words.lower.v <- tolower(div.words.v)
  #tokenize words, restricting content to alphabetical charHamters,
  #apostrophes (for contrHamted word forms), and hyphens (for compound expressions)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  #strsplit product is a list. restore to vector with unlist
  word.v <- unlist(words.l)
  #remove any remaining whitespHame created from culled punctuation
  word.v <- word.v[which(word.v!="")]
  #create a list of the relevant nodes and their word content
  divs.Ham.l[[div.content]] <- word.v
  #calculate frequencies
  divs.Hamfreqs.t <- table(word.v)
  divs.Hamraws.l[[div.content]] <- divs.Hamfreqs.t
  divs.Hamfreqs.l[[div.content]] <- 100*(divs.Hamfreqs.t/sum(divs.Hamfreqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.Ham.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.Hamraws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.Hamfreqs.l
divs.Hamfreqs.t

Ham.hapax.v <- sapply(divs.Hamraws.l, function(x) sum(x == 1))
Ham.lengths.m <- do.call(rbind, lapply(divs.Hamraws.l,sum))
Hamhapax.percentage <- Ham.hapax.v / Ham.lengths.m

#get Othello 
Othellodivs.ns.l <- getNodeSet(doc, "/body//div[@play='10c']")
#the following two list objects store the results of the
#succeeding forloop
Othellodivs.ns.l
divs.Othello.l <- list()
divs.Othellofreqs.l <- list()
divs.Othelloraws.l <- list()
#the for loop will tokenize and calculate words in eOthelloh div
for(i in 1:length(Othellodivs.ns.l)){
  #specifies div content for retrieval
  div.content <- xmlValue(Othellodivs.ns.l[[i]], "div")[[1]]
  #specifies word tag content for retrieval
  words.ns <- xmlElementsByTagName(Othellodivs.ns.l[[i]], "w", recursive = TRUE)
  #combines word tag content within eOthelloh div
  div.words.v <- paste(sapply(words.ns, xmlValue))
  #convert charOthelloters to lowercase
  words.lower.v <- tolower(div.words.v)
  #tokenize words, restricting content to alphabetical charOthelloters,
  #apostrophes (for contrOthelloted word forms), and hyphens (for compound expressions)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  #strsplit product is a list. restore to vector with unlist
  word.v <- unlist(words.l)
  #remove any remaining whitespOthelloe created from culled punctuation
  word.v <- word.v[which(word.v!="")]
  #create a list of the relevant nodes and their word content
  divs.Othello.l[[div.content]] <- word.v
  #calculate frequencies
  divs.Othellofreqs.t <- table(word.v)
  divs.Othelloraws.l[[div.content]] <- divs.Othellofreqs.t
  divs.Othellofreqs.l[[div.content]] <- 100*(divs.Othellofreqs.t/sum(divs.Othellofreqs.t))
}
#for output varieties

#outputs sequential node list and word tokens for the full object
divs.Othello.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
divs.Othelloraws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
divs.Othellofreqs.l
divs.Othellofreqs.t

Othello.hapax.v <- sapply(divs.Othelloraws.l, function(x) sum(x == 1))
Othello.lengths.m <- do.call(rbind, lapply(divs.Othelloraws.l,sum))
Othellohapax.percentage <- Othello.hapax.v / Othello.lengths.m

#combine hapax percentages to be visualized
library(zoo)
z <- merge(zoo(Timonhapax.percentage), zoo(KLhapax.percentage), 
           zoo(Hamhapax.percentage), zoo(Othellohapax.percentage))
colnames(z) <- c("Timon of Athens", "King Lear", "Hamlet", "Othello")
plot(z, main = "Lexical richness comparison, with hapax analysis", 
     xlab = "# of markings", 
     type = "h", 
     plot.type = "multiple", 
     col = 8, lwd = 8) 
