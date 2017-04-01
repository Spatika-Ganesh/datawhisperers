if(!exists('data')){
  data <- read.delim("data.txt")
}
if(!exists('dest')){
  dest <- read.delim("dest.txt")
}

n = length(unique(data$user_id))
corData <- data.frame(user = numeric(n), interest1 = character(n),
                      interest2 = character(n), interest3 = character(n),
                      interest4 = character(n), interest5 = character(n),
                      interest6 = character(n), interest7 = character(n),
                      interest8 = character(n), interest9 = character(n),
                      interest10 = character(n))
index = 1

for(id in unique(data$user_id)){
  user <- subset(data, user_id == id)
  destinations <- subset(dest, srch_destination_id %in% user$srch_destination_id)
  dest_counts <- vector()
  for(d in destinations$srch_destination_id) {
    dest_counts <- c(dest_counts, sum(user$srch_destination_id==d))
  }
  
  user_correlations <- data.frame(name = character(138), correlation = numeric(138))
  
  for(i in seq(6,144)){
    user_correlations$name[i] <- toString(names(destinations[i]))
    user_correlations$correlations[i] <- cor(destinations[,i], dest_counts, method="pearson")
  }
  
  user_correlations[order(user_correlations$corellation, decreasing = TRUE),]
  
  user_top10 <- head(user_correlations, n=10)
  
  corData$user[index] <- id
  corData$interest1[index] <- user_top10[1]
  corData$interest2[index] <- user_top10[2]
  corData$interest3[index] <- user_top10[3]
  corData$interest4[index] <- user_top10[4]
  corData$interest5[index] <- user_top10[5]
  corData$interest6[index] <- user_top10[6]
  corData$interest7[index] <- user_top10[7]
  corData$interest8[index] <- user_top10[8]
  corData$interest9[index] <- user_top10[9]
  corData$interest10[index] <- user_top10[10]

  
  plot(user_top10)
  
  index <- index + 1

    
}