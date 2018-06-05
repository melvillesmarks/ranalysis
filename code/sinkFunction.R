library(XML)
doc <- xmlTreeParse("460-nolines.xml", useInternalNodes=TRUE)
divs.ns.l <- getNodeSet(doc, "/body//*[@attribution='HM'][not(contains(@mode, 'commentary'))][not(contains(@type, 'notation'))]")
#Creates and names a file in the working directory
sink("divs.txt")
#sink function exports specified object to the newly created file
print(divs.ns.l)
#cancels the sink function
sink()
