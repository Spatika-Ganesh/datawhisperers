#data <- read.delim('data.txt')
#dest <- read.delim('dest.txt')

# remove irrelevant columns
data <- data[,c(1,3:9,18,20,27)]
dest <- dest[,c(1,6:144)]

# unique user ids
id_list <- unique(data$user_id)

user <- subset(data, data$user_id == id_list[2]) # all records for user from data
unique_dest <- unique(user$srch_destination_id) # all unique destinations
dest_counts <- vector() # number of times destination has been visited
for(d in unique_dest) {
  dest_counts <- c(dest_counts, sum(user$srch_destination_id == d))
}

# subset of dest where destination_id is one of user selected?
destinations <- subset(dest, dest$srch_destination_id %in% unique_dest)

correlations <- vector()

for(i in seq(2,140)) {
  plot(y = destinations[,i], x = dest_counts)
  correlations <- c(correlations, cor(destinations[,i], dest_counts))
}

plot(correlations)