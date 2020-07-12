## [DS-E-02] New York City Airbnb listings ##

# Importing the data (edit path) #
df = read.csv('airbnb.csv', stringsAsFactors=FALSE)

# Exploration #
str(df)
head(df)

# Q1. Count and drop duplicates #
sum(duplicated(df))
df = unique(df)

# Q2a. For how many listings the host started before 2010? #
expr = df$host_since < '2009-12-31' & df$host_since != ''
sum(expr)

# Q2b. How many hosts started before that year? #
length(unique(df$host_id[expr]))

# Q3. Proportion of listings whose rating is missing #
mean(is.na(df$rating))

# Q4a. Use a histogram to explore the distribution of the price #
hist(df$price)

# Q4b. Trim the data to get a better picture #
summary(df$price)
expr = df$price >= 50 & df$price <= 250
hist(df$price[expr])

# Q5a. What is the average price per room type? #
tapply(df$price, INDEX=df$room_type, FUN=mean)

# Q5b. Is it better to use the median? #
tapply(df$price, df$room_type, median)

# Q6. Variation of median price across neighborhoods #
bronx = df[df$neighbourhood == 'Bronx', ]
tapply(bronx$price, bronx$room_type, median)
brooklyn = df[df$neighbourhood == 'Brooklyn', ]
tapply(brooklyn$price, brooklyn$room_type, median)
manhattan = df[df$neighbourhood == 'Manhattan', ]
tapply(manhattan$price, manhattan$room_type, median)
queens = df[df$neighbourhood == 'Queens', ]
tapply(queens$price, queens$room_type, median)
staten = df[df$neighbourhood == 'Staten Island', ]
tapply(staten$price, staten$room_type, median)

# Q7. Replace the median price by number of listings #
tapply(bronx$price, bronx$room_type, length)
tapply(brooklyn$price, brooklyn$room_type, length)
tapply(manhattan$price, manhattan$room_type, length)
tapply(queens$price, queens$room_type, length)
tapply(staten$price, staten$room_type, length)

