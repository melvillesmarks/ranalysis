setwd("~/git-space/ranalysis/texts/")
library("rJava")
library("qdap")

hm.text.all <- scan("hm-readings-all-words/hm-marked-words-all.txt", what = "character", sep = "\n")

hm.jm.text <- scan("hm-readings-all-words/hm-markings-milton.txt", what = "character", sep = "\n")
jm.text <- scan("corpus/milton-complete-works.txt", what = "character", sep = "\n")

hm.ws.text <- scan("hm-readings-all-words/hm-markings-shakespeare.txt", what = "character", sep = "\n")
ws.text <- scan("corpus/shakespeare-complete.txt", what = "character", sep = "\n")

hm.il.text <- scan("hm-readings-all-words/hm-markings-iliad.txt", what = "character", sep = "\n")
il.text <- scan("corpus/chapman-iliad.txt", what = "character", sep = "\n")

hm.od.text <- scan("hm-readings-all-words/hm-markings-odyssey.txt", what = "character", sep = "\n")
od.text <- scan("corpus/chapman-odyssey.txt", what = "character", sep = "\n")

hm.homer.text <- c(hm.il.text, hm.od.text)
homer.text <- c(il.text, od.text)

beale.text <- scan("beale-natural-history-sperm-whale.txt", what = "character", sep = "\n")
moby.text <- scan("moby-dick.txt", what = "characters", sep = "\n")
battle.pieces <- scan("battle-pieces.txt", what = "characters", sep = "\n")

hm.markings <- scan("hm-marked-word-all.txt", what = "character", sep = "\n")
type_token_ratio(text.var = hm.markings) #.512

type_token_ratio(text.var = hm.jm.text) #.563
type_token_ratio(text.var = jm.text) #.52

type_token_ratio(text.var = hm.ws.text.text) #.49
type_token_ratio(text.var = ws.text) #.43 

type_token_ratio(text.var = hm.homer.text) #.507
type_token_ratio(text.var = homer.text) #.48

type_token_ratio(text.var = beale.text) #.423
type_token_ratio(text.var = moby.text) #.471
type_token_ratio(text.var = battle.pieces) #.538

