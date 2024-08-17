library(ggplot2)

library(readr)

library(dplyr)



# Load the dataset

wine_data <- read_csv(
  "G: / My Drive / CSC 302 / Final Presentation / winemag - data - 130k -
    v2.csv")



# View structure and summary of the data

str(wine_data)

summary(wine_data)



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



# Create a violin plot of wine ratings by variety for the top 20 varieties

ggplot(wine_data_top_20, aes(x = variety, y = points)) +

  geom_violin(trim = FALSE, fill = "lightblue", color = "darkblue") +

  labs(x = "Wine Variety", y = "Points", title = "Violin Plot of Wine Ratings by Top 20 Varieties") +

  theme_minimal() + # Use a minimal theme

  theme(axis.text.x = element_text(angle = 90, hjust = 1)) # Rotate x-axis labels for better readability





