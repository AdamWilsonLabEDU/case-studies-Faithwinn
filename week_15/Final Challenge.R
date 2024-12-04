# Load required libraries
library(dplyr)
library(ggplot2)

# Define data URL and column names
data_url <- "http://scrippsco2.ucsd.edu/assets/data/atmospheric/stations/in_situ_co2/monthly/monthly_in_situ_co2_mlo.csv"
colnames <- c("year", "month", "excel", "decimal_year", "co2", 
              "co2_seasonal", "co2_fit", "co2_seasonalfit", 
              "co2_filled", "co2_seasonalfilled")

# Import data
co2_data <- read.csv(data_url, skip = 72, header = FALSE)  # Skip the header rows

# Update column names
colnames(co2_data) <- colnames

# Ensure correct column names
if (ncol(co2_data) == length(colnames)) {
  colnames(co2_data) <- colnames
} else {
  stop("Column count mismatch. Please check the input file format.")
}

# Verify column names
print(colnames(co2_data))

# Drop the last column if unnecessary
co2_data <- co2_data[, -ncol(co2_data)]

# Reassign column names
colnames(co2_data) <- colnames


# Filter out missing data
co2_data <- co2_data %>% 
  filter(co2 != -99.99)

# Calculate the mean CO2 for each year
mean_co2_per_year <- co2_data %>%
  group_by(year) %>%
  summarize(mean_co2 = mean(co2, na.rm = TRUE))

# Plot the mean annual CO2 concentration
ggplot(mean_co2_per_year, aes(x = year, y = mean_co2)) +
  geom_line(color = "blue", linewidth = 1) +
  labs(
    title = "Mean Annual CO2 Concentration",
    x = "Year",
    y = "Mean CO2 (ppm)"
  ) +
  theme_minimal()

