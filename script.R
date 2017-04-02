if(!exists('userData')){
  userData <- read.delim("data.txt")
}
if(!exists('dest')){
  dest <- read.delim("dest.txt")
}

n = length(unique(userData$user_id))
corData <- data.frame(user = numeric(n), interest1 = character(n),
                      interest2 = character(n), interest3 = character(n),
                      interest4 = character(n), interest5 = character(n),
                      interest6 = character(n), interest7 = character(n),
                      interest8 = character(n), interest9 = character(n),
                      interest10 = character(n), stringsAsFactors = FALSE)
index = 1

for(id in unique(userData$user_id)[1:100]){
  user <- subset(userData, user_id == id)
  destinations <- subset(dest, srch_destination_id %in% user$srch_destination_id)
  dest_counts <- vector()
  for(d in destinations$srch_destination_id) {
    dest_counts <- c(dest_counts, sum(user$srch_destination_id==d))
  }
  
  user_correlations <- data.frame(name = character(139), correlation = numeric(139), stringsAsFactors = FALSE)
  
  for(i in seq(6,144)){
    user_correlations[i-5,] <- c(toString(names(destinations[i])), cor(destinations[,i], dest_counts, method="pearson"))
  }
  
  user_correlations <- user_correlations[order(user_correlations$correlation, decreasing = TRUE),]
  
  user_top10 <- head(user_correlations, n=10)
  
  corData[index,] <- c(id, user_top10[,1])
  
  print(index)
  
  index <- index + 1

    
}

write.csv(corData, file="corData.csv")