library(factoextra)
library(cluster)
# Load the data set
data(USArrests)
# Remove any missing value (i.e, NA values for not available)
# That might be present in the data
USArrests <- na.omit(USArrests)
# View the first 6 rows of the data
head(USArrests, n = 6)

desc_stats <- data.frame(
  Min = apply(USArrests, 2, min), # minimum
  Med = apply(USArrests, 2, median), # median
  Mean = apply(USArrests, 2, mean), # mean
  SD = apply(USArrests, 2, sd), # Standard deviation
  Max = apply(USArrests, 2, max) # Maximum
  )
desc_stats <- round(desc_stats, 1)
head(desc_stats)

df<-scale(USArrests)
res <- get_clust_tendency(df, 40, graph = FALSE)
# Hopskin statistic
res$hopkins_stat

# Compute k-means
set.seed(123)
km.res <- kmeans(df, 4, nstart = 25)
head(km.res$cluster, 20)

# Visualize clusters using factoextra
fviz_cluster(km.res, USArrests)