corData <- read.csv("corData.csv")

for(int in seq(3,13)) {
  first_interests = unique(corData[1:100,][,int])
  n = length(first_interests)
  counts = vector()
  for(activity in first_interests) {
    counts = c(counts, sum(corData[1:100,][,int] == activity))
  }
  max_interests <- data.frame(name = character(n), count = numeric(n), stringsAsFactors = FALSE)
  for(i in seq(1,n)){
    max_interests[i,] <- data.frame(first_interests[i], counts[i])
    max_interests$name[i] <- levels(first_interests)[i+1]
  }
  max_interests <- max_interests[order(max_interests$count, decreasing = TRUE),]
  barplot(max_interests$count, names.arg=max_interests$name)
}