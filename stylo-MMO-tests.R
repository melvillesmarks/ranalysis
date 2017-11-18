# stylo experiments
setwd("~/GitSpace/ranalysis/")
my.corpus = load.corpus.and.parse(files = c("460-markings-only.xml"),
                                  markup.type = "xml", ngram.size = 1)

make.frequency.list(my.corpus, value = FALSE, head = NULL,
                    relative = TRUE)
words = txt.to.words.ext(my.corpus)
make.frequency.list(words, value = TRUE)

make.samples(words, sampling = "normal.sampling", sample.size = 50)

complete.word.list = make.frequency.list(words)
make.table.of.frequencies(words, complete.word.list)
write.table(complete.word.list, "460.words.txt")

stylo()
