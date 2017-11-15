setwd("~/Desktop/git-space/ranalysis/")
source("~/Desktop/Jockers-TextAnalysisWithR/code/mmo-shakespeare-functions.R")
#load xml package
library(XML)
#load the xml file as a document object
doc <- xmlTreeParse("460.xml", useInternalNodes=TRUE)
#retrieve specified nodes from the doc object with an XPath
#expression that id's desired attribute values and excludes others
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM'][@mode='tragedy']
                        [not(contains(@mode, 'commentary'))][not(contains(@type, 'notation'))]")
#the following two list objects store the results of the
#succeeding forloop
divs.ns.l
divs.tragedy.l <- list()
div.freqs.l <- list()
div.raws.l <- list()
#the for loop will tokenize and calculate words in each div
#for output varieties

#outputs sequential node list and word tokens for the full object
get.MMO.words(divs.tragedy.l)
divs.tragedy.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
div.raws.l
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes
div.freqs.l
div.freqs.t

tragedy.hapax.v <- sapply(div.raws.l, function(x) sum(x == 1))
tragedy.lengths.m <- do.call(rbind, lapply(div.raws.l,sum))
hapax.percentage <- tragedy.hapax.v / tragedy.lengths.m
barplot(hapax.percentage, beside=T,col="grey", names.arg = seq(1:length(div.freqs.l)))

