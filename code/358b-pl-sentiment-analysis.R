
setwd("~/Desktop/git-space/ranalysis/358b-content-sos/")
library(XML)
library(tidytext)
library(dplyr)
library(stringr)
library(glue)
library(tidyverse)

# stick together the path to the file & 1st file name
hmMarked <- glue("358b-pl-words.txt", sep = " ")

words <- data_frame(file = paste0("~/Desktop/git-space/ranalysis/358b-content-sos/", 
                                        c("358b-pl-words.txt"))) %>%
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
  scale_x_continuous("Location in Milton's 'Paradise Lost'") + 
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
  labs(y = "Marked Words in Milton's 'Paradise Lost'",
       x = NULL) +
  coord_flip()

library(wordcloud)
library(reshape2)

# create a sentiment wordcloud 

words %>%
  inner_join(get_sentiments("bing")) %>%
  count(word, sentiment, sort = TRUE) %>%
  acast(word ~ sentiment, value.var = "n", fill = 0) %>%
  comparison.cloud(max.words = 10000, scale = c(2.5,.6), 
                   random.order = FALSE,
                   colors = c("red", "blue"))


