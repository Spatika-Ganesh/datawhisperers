if(!exists('userData')){
  userData <- read.delim("data.txt")
}
if(!exists('dest')){
  dest <- read.delim("dest.txt")
}



#n = length(unique(userData$user_id))
n=100
corData <- data.frame(user = numeric(n), interest1 = character(n),
                      interest2 = character(n), interest3 = character(n),
                      interest4 = character(n), interest5 = character(n),
                      interest6 = character(n), interest7 = character(n),
                      interest8 = character(n), interest9 = character(n),
                      interest10 = character(n), cor1 = numeric(n),
                      cor2 = numeric(n), cor3 = numeric(n),
                      cor4 = numeric(n), cor5 = numeric(n),
                      cor6 = numeric(n), cor7 = numeric(n),
                      cor8 = numeric(n), cor9 = numeric(n),
                      cor10 = numeric(n), stringsAsFactors = FALSE)
index = 0
count = 0

while(count < n){
  index <- index + 1
  
  id = unique(userData$user_id)[index]
  user <- userData[userData$user_id == id,]
  if(nrow(user) <= 3){
    next
  }
  destinations <- dest[dest$srch_destination_id %in% user$srch_destination_id,]
  if(nrow(destinations) <= 3){
    next
  }
  dest_counts <- vector()
  for(d in destinations$srch_destination_id) {
    dest_counts <- c(dest_counts, sum(user$srch_destination_id==d))
  }
  
  user_correlations <- data.frame(name = character(139), correlation = numeric(139), stringsAsFactors = FALSE)
  
  for(i in seq(6,144)){
    user_correlations[i-5,] <- rbind(user = toString(names(destinations[i])), cor(destinations[,i], dest_counts, method="pearson"))
  }
  
  user_correlations <- user_correlations[order(user_correlations$correlation, decreasing = TRUE),]
  
  user_top10 <- head(user_correlations, n=10)
  
  corData[count + 1,] <- c(id, user_top10[,1], user_top10[,2])
  
  print(count)
  
  count <- count + 1
    
}

write.csv(corData, file="corData.csv")