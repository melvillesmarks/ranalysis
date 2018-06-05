# stylo experiments
setwd("~/GitSpace/ranalysis/texts/")
library(stylo)

corpus <- as.data.frame("corpus/")

my.corpus <- load.corpus.and.parse(files = c("chapman-iliad.txt", "chapman-odyssey.txt",
                                             "milton-complete-works.txt", "battle-pieces.txt",
                                             "confidence-man.txt", "israel-potter.txt", "moby-dick.txt",
                                             "piazza-tales.txt", "pierre.txt"),
                                  markup.type = "text", ngram.size = 1)


make.frequency.list(my.corpus, value = FALSE, head = NULL,
                    relative = TRUE)
words = txt.to.words.ext(my.corpus)
make.ngrams(words, ngram.size = 2)

make.frequency.list(words, value = TRUE)

make.samples(words, sampling = "normal.sampling", sample.size = 50)

complete.word.list = make.frequency.list(words)
make.table.of.frequencies(words, complete.word.list)

tokenized.corpus <- txt.to.words.ext(my.corpus, language = "English.all",
                                     preserve.case = FALSE)
summary(tokenized.corpus)

sliced.corpus <- make.samples(tokenized.corpus, sampling = "normal.sampling",
                              sample.size = 10000)
frequent.features <- make.frequency.list(sliced.corpus, head = 3000)

frequent.features[100:120]

stylo()

stylo.results <- stylo()
stylo.results$features
stylo.results$distance.table

corpus.all <- txt.to.words.ext(corpus, language = "English.all",
                               preserve.case = TRUE)
corpus.ws <- corpus.all[grep("shakespeare", names(corpus.all))]
corpus.md <- corpus.all[grep("moby-dick", names(corpus.all))]

zeta.results <- oppose(primary.corpus = corpus.ws,
                       secondary.corpus = corpus.md, gui = FALSE)

zeta.results$words.preferred[1:20]

zeta.results$words.avoided[1:20]

