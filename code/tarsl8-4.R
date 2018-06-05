library(XML)
doc <- xmlTreeParse("460.xml", useInternalNodes=TRUE)
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM'][not(contains(@mode, 'commentary'))]")
divs.ns.l
div.freqs.l <- list()
div.raws.l <- list()
for(i in 1:length(divs.ns.l)){
  div.content <- xmlValue(divs.ns.l[[i]], "div")[[1]]
  words.ns <- xmlElementsByTagName(divs.ns.l[[i]], "w", recursive = TRUE)
  div.words.v <- paste(sapply(words.ns, xmlValue), collapse=" ")
  words.lower.v <- tolower(div.words.v)
  words.l <- strsplit(words.lower.v, "[^a-z'-]")
  word.v <- unlist(words.l)
  word.v <- word.v[which(word.v!="")]
  }
positions.v <- which(word.v[]=="think")
positions.v
first.instance <- positions.v[1]
first.instance
word.v[first.instance]
word.v[5:7]
cat(word.v[(first.instance-1):(first.instance+1)])
context <- 5
for(i in 1:length(positions.v)){
  start <- positions.v[i]-context
  end <- positions.v[i]+context
  before <- word.v[start:(start+context-1)]
  after <- word.v[(start+context+1):end]
  keyword <- word.v[start+context]
  cat("--------------", i, "--------------", "\n")
  cat(before,"[",keyword, "]", after, "\n")
}
