#load required libraries
library(tm)
library(wordcloud)

kafka <- Corpus (DirSource("./kafka"))
ignore <- c("a", "an", "the", "said", "of", "to", "by")
kafka <- tm_map(kafka, removeWords, ignore)
kafka <- tm_map(kafka, stripWhitespace)
kafka <- tm_map(kafka, content_transformer(tolower))
kafka <- tm_map(kafka, removeWords, stopwords("english"))
kafka <- tm_map(kafka, stemDocument)
kafka <- gsub("[[:punct:]]"," ",kafka)
wordcloud(kafka, scale=c(4,0.5), max.words=500, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Set1"))
