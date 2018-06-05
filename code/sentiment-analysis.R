
setwd("~/GitSpace/ranalysis/texts/hm-readings-all-words/")
library(XML)
library(tidytext)
library(dplyr)
library(stringr)
library(glue)
library(tidyverse)

# stick together the path to the file & 1st file name
fileName <- glue("shakespeare-complete.txt", sep = " ")
hmMarked <- glue("hm-marked-words-all.txt", sep = " ")

words <- data_frame(file = paste0(c("hm-markings-all.txt"))) %>%
  mutate(text = map(file, read_lines)) %>%
  unnest() %>%
  group_by(file = str_sub(basename(file), 1, -5)) %>%
  mutate(line_number = row_number()) %>%
  ungroup() %>%
  unnest_tokens(word, text)

allwords <- data_frame(file = paste0("~hm-readings-all-words/",
                                    c("hm-marked-words-all.txt"))) %>%
  mutate(text = map(file, read_lines)) %>%
  unnest() %>%
  group_by(file = str_sub(basename(file), 1, -5)) %>%
  mutate(line_number = row_number()) %>%
  ungroup() %>%
  unnest_tokens(word, text)

words_sentiment <- inner_join(words,
                              get_sentiments("bing")) %>%
  count(file, index = round(line_number/ max(line_number) * 100 / 5) * 5, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(net_sentiment = positive - negative)

words_sentiment %>% ggplot(aes(x = index, y = net_sentiment, fill = file)) + 
  geom_bar(stat = "identity", show.legend = FALSE) + 
  facet_wrap(~ file) + 
  scale_x_continuous("Location in the volume") + 
  scale_y_continuous("Bing net Sentiment")

HMwords_sentiment <- inner_join(hmWords,
                              get_sentiments("bing")) %>%
  count(file, index = round(line_number/ max(line_number) * 100 / 5) * 5, sentiment) %>%
  spread(sentiment, n, fill = 0) %>%
  mutate(net_sentiment = positive - negative)

HMwords_sentiment %>% ggplot(aes(x = index, y = net_sentiment, fill = file)) + 
  geom_bar(stat = "identity", show.legend = FALSE) + 
  facet_wrap(~ file) + 
  scale_x_continuous("Location in the volume") + 
  scale_y_continuous("Bing net Sentiment")

bing_word_counts <- words %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  ungroup()

bing_word_counts %>%
  group_by(sentiment) %>%
  top_n(20) %>%
  ungroup() %>%
  mutate(word = reorder(word, n)) %>%
  ggplot(aes(word, n, fill = sentiment)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~sentiment, scales = "free_y") +
  labs(y = "Word Frequency of Marked Passages in Shakespeare, Milton, and Homer",
       x = NULL) +
  coord_flip()
summary(bing_word_counts)

library(wordcloud)
library(reshape2)

# create a sentiment wordcloud 

words %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(max.words = 10000, scale = c(1.5,.5), 
                   random.order = FALSE,
                   colors = c("red", "blue"))

# table of freqs

iliad <- scan("hm-markings-iliad.txt", "character", sep = "\n") 
odyssey <- scan("hm-markings-odyssey.txt", "character", sep = "\n")

homer <- c(iliad, odyssey)
homer <- gsub("\\.", "", homer)
homer.words <- strsplit(homer, " ")
homer.words <- unlist(homer.words)
homer.words.freq <- table(unlist(homer.words))

homer.words.table <- cbind(names(homer.words.freq),as.integer(homer.words.freq))
top.homer.words <- sort(homer.words.freq, decreasing = TRUE)
write.table(top.homer.words, file = "top-homer-words.csv")

