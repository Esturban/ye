random_quote<-function(){
  jsonlite::fromJSON("https://api.kanye.rest/")$quote
}
