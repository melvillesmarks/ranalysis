setwd("~/git-space/ranalysis/texts/")
library("rJava")
library("qdap")

#lexical dispersion plots

hm.ws.text <- iconv(hm.ws.text, "latin1", "ASCII", "")
hm.ws.text <- paste(hm.ws.text, collapse = c(" ", "\n"))
hm.ws.text.prep <- qprep(hm.ws.text)
hm.ws.text.prep <- replace_contraction(hm.ws.text)
hm.ws.text.stripped <- strip(hm.ws.text.prep, char.keep = c("?", "."))
hm.ws.text.split <- sentSplit(hm.ws.text, "text")

#for all books
hm.marks.all <- c(hm.homer.text, hm.il.text, hm.jm.text, hm.ws.text)
dispersion_plot(hm.marks.all, c("death", "fear", "fall", "lost", "poor", "great", "love", "heaven", "wise", "virtue", "joy"),
                color = "black", bg.color = "grey90", horiz.color = "grey85",
                total.color = "black", symbol = "|", title = "Lexical Dispersion Plot in Homer, Milton, and Shakespeare",
                rev.factor = TRUE, wrap = "'", xlab = NULL, ylab = "Word Frequencies",
                size = 3, plot = TRUE)

#for shakespeare 
dispersion_plot(hm.ws.text.text, c("world", "nature", "man", "fear", "hate", "death", "lost", "love", "good", "wise", "virtue"),
                color = "black",
                total.color = "black", symbol = "|", title = "Lexical Dispersion Plot in Shakespeare",
                rev.factor = TRUE, wrap = "'", xlab = "Words", ylab = "Frequencies",
                size = 3, plot = TRUE)
