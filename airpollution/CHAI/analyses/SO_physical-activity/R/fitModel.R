library(dplyr)

## Create similar but simpler data frame to yours
df <- data.frame(
  scenario = rep(1:3, 2),
  year = rep(2010:2011, each = 3),
  age_25_29 = rnorm(6),
  age_30_34 = rnorm(6),
  age_35_39 = rnorm(6)
)

## Subset the columns you want to sum over and use apply over margin 1. See ?apply
row_sum <- apply(df[, 3:5], 1, sum)
## Add new column with sums to the original data frame
df$row_sum <- row_sum

df %>%
  group_by(scenario, year) %>%
  summarize(pop_sum = sum(row_sum))
