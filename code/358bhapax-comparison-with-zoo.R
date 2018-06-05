setwd("~/GitSpace/ranalysis/corpus")

hm.text <- scan("hm-readings-all-words/milton-hm-markings-only.txt", what = "character", sep = "\n")
jm.text <- scan("milton-complete-works.txt", what = "character", sep = "\n")
library("rJava")
library("qdap")

type_token_ratio(hm.text.var = hm.text)

#combine hapax percentages to be visualized
library(zoo)
#invoke "zoo" to merge each hapax % variable

#this plots three plays in each category
z <- merge(zoo(MMhapax.percentage), zoo(H8hapax.percentage), 
           zoo(AChapax.percentage))
#label each graph as a column, following the order of each "zoo" invocation" 
colnames(z) <- c("Measure for Measure", "Henry VIII", "Antoy and Cleopatra")

plot(z, main = "Lexical richness comparison, with hapax analysis", 
     xlab = "# of markings", 
     type = "h", 
     plot.type = "multiple", 
     col = 1, lwd = 10)

#this plots four tragedies that HM mentioned

z <- merge(zoo(Timonhapax.percentage), zoo(KLhapax.percentage), 
           zoo(Hamhapax.percentage), zoo(Othellohapax.percentage))
colnames(z) <- c("Timon of Athens", "King Lear", "Hamlet", "Othello")

plot(z, main = "Lexical richness comparison, with hapax analysis", 
     xlab = "# of markings", 
     type = "h", 
     plot.type = "multiple", 
     col = 1, lwd = 10) 
