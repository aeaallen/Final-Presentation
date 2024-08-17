library(ggplot2)

library(readr)

library(dplyr)



# Load the dataset

wine_data <- read.csv(
  "C:/Users/Drew/Documents/CSC302Fi/CSC302Fi/winemag-data-130k-v2.csv")






# Remove missing values

wine_data <- na.omit(wine_data)



# Select the top 20 wine varieties based on frequency

top_20_varieties <- wine_data %>%
  
  group_by(variety) %>%
  
  tally(sort = TRUE) %>%
  
  top_n(20, wt = n) %>%
  
  pull(variety)

# Filter the dataset to include only the top 20 wine varieties

wine_data_top_20 <- wine_data %>% filter(variety %in% top_20_varieties)

# Sample data frame
wine_data <- data.frame(
  wine_type = sample(c("Pinot Gris", "Pinot Noir", "Merlot", "Chardonnay", 
                       "Grenache", "Syrah"
                       
                       ), 100, replace = TRUE),
  score = rnorm(100, mean = 75, sd = 10)
)

ggplot(wine_data, aes(x = score)) +
  geom_histogram(binwidth = 1, fill = "skyblue", color = "black", alpha = 0.7) +
  facet_wrap(~ wine_type) +
  labs(title = "Distribution of Wine Scores by Type",
       x = "Score",
       y = "Frequency") +
  theme_minimal()


