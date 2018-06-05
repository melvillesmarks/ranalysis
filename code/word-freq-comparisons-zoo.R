#load xml package
library(XML)
setwd("GitSpace/ranalysis/markup")
#load the xml file as a document object
doc <- xmlTreeParse("358b-stripped(1).xml", useInternalNodes=TRUE)


#retrieve specified nodes from the doc object with an XPath
#expression that id's desired attribute values and excludes others
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM'][not(contains(@mode, 'commentary'))][not(contains(@type, 'notation'))]")
#the following two list objects store the results of the
#succeeding forloop
divs.ns.l

divs.checkmark.underline.l <- list()
div.freqs.l <- list()
div.raws.l <- list()
#the for loop will tokenize and calculate words in each div
#for output varieties
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
  div.freqs.l[[div.content]] <- word.v
  #calculate frequencies
  div.freqs.t <- table(word.v)
  div.raws.l[[div.content]] <- div.freqs.t
  div.freqs.l[[div.content]] <- 100*(div.freqs.t/sum(div.freqs.t))
}
#outputs sequential node list and word tokens for the full object
divs.checkmark.underline.l
#outputs nodes and word tokens for the full object, with raw word counts in nodes
#outputs nodes and word tokens for the full object, with relative word frequencies in nodes

#isolates instances and node-level relative frequency for specified words
man <- do.call(rbind, lapply(div.freqs.l, '[', 'man'))
world <- do.call(rbind, lapply(div.freqs.l, '[', 'world'))
love <- do.call(rbind, lapply(div.freqs.l, '[', 'love'))
#death <- do.call(rbind, lapply(div.freqs.l, '[', 'death'))
#good <- do.call(rbind, lapply(div.freqs.l, '[', 'good'))
man.world.love <- cbind(man, world, love)
love.death <- cbind(love, death)
#identifies positions wherein specified word instances have N/A and excludes those by converting this value to 0.00000
man.world.love[which(is.na(man.world.love))] <- 0
love.death[which(is.na(love.death))] <- 0
#specifies column names for x axis in barplot
colnames(man.world.love) <- c("man", "world", "love")
colnames(love.death) <- c("love", "death")
#produces barplot for relative frequencies across nodes, with additional specifications for x and y axis labeling
barplot(man.world.good, beside=T, col="grey", main="Frequencies for 'man,' 'world', and 'good' in passages marked by Herman Melville in Shakespeare's Plays", ylab = "Term percentage value within text marked", xlab = "Comedies, Histories, and Tragedies combined")
#coerce instances to a dataframe for purpose of correlation
love.death.df <- as.data.frame(love.death)
cor(love.death)
#determine correlation of frequency for specified words
cor.test(love.death.df$love, love.death.df$death)
mycor <- cor(love.death[,"love"], love.death[,"death"])
mycor

library(zoo)
z <- merge(zoo(man.world.love))
plot(z, main="Term Frequencies", xlab = "Each instance in Melville's Shakespeare Markings", 
     type = "h", 
     plot.type = "multiple", 
     col = 1, lwd = 2)
