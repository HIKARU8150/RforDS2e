library(tidyverse)
library(ggthemes)
library(nycflights13)


?geom_density

# 2 Data visualization ----------------------------------------------------

penguins <- palmerpenguins::penguins

ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
       ) + 
  geom_point(mapping = aes(color = species, shape = species)) + 
  geom_smooth(method = "lm") + 
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adeline, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) + 
  scale_color_colorblind()

# 2.2.5 Exercises ####

## 1 How many rows are in penguins? How many columns?
dim(penguins)

## 2 What does the bill_depth_mm variable in the penguins data frame describe?
?penguins

## 3 Make a scatterplot of bill_depth_mm vs. bill_length_mm.
ggplot(
  data = penguins,
  mapping = aes(x = bill_length_mm, y = bill_depth_mm,
                shape = species,
                color = species)
) + 
  geom_point() +
  geom_smooth(method = "lm") + 
  labs(
    title = "Bill Depth and Bill Length",
    subtitle = "Grouped by Species",
    x = "Bill Length",
    y = "Bill Depth"
  ) + 
  scale_color_wsj()

## 4 what happens if you make a scatterplot of species vs. bill_depth_mm?
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) + 
  geom_point()

###It seems that plotting the data in boxplots is a better idea since species are categorical.
ggplot(
  data = penguins,
  mapping = aes(x = species, y = bill_depth_mm)
) + 
  geom_boxplot()

## 5. How would you fix this?
ggplot(data = penguins) + 
  geom_point()

### The error message says "the following missing aesthetics: x and y"

## 6. na.rm argument in geom_point()
?geom_point
### na.rm
###	If FALSE, the default, missing values are removed with a warning. 
### If TRUE, missing values are silently removed.

ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(mapping = aes(color = species, shape = species), na.rm = TRUE) + 
  geom_smooth(method = "lm", na.rm = TRUE) + 
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adeline, Chinstrap, and Gentoo Penguins",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) + 
  scale_color_colorblind()

## 7. Add caption
?labs()
ggplot(data = penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
) + 
  geom_point(mapping = aes(color = species, shape = species), na.rm = TRUE) + 
  geom_smooth(method = "lm", na.rm = TRUE) + 
  labs(
    title = "Body mass and flipper length",
    subtitle = "Dimensions for Adeline, Chinstrap, and Gentoo Penguins",
    caption = "Data come from the palmerpenguins package",
    x = "Flipper length (mm)", y = "Body mass (g)",
    color = "Species", shape = "Species"
  ) + 
  scale_color_colorblind()

## 8. Recreate the visualization
ggplot(data =penguins,
       mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point(mapping = aes(color = bill_depth_mm)) + 
  geom_smooth()

## 9. Run this code
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g, color = island)
) +
  geom_point() +
  geom_smooth(se = FALSE) #se argument displays confidence interval around smooth.

?geom_area

## 10. these two different?
### same. The first one assigns variables in global level, while the other assigns variables in local levels.
ggplot(
  data = penguins,
  mapping = aes(x = flipper_length_mm, y = body_mass_g)
) +
  geom_point() +
  geom_smooth()

ggplot() +
  geom_point(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  ) +
  geom_smooth(
    data = penguins,
    mapping = aes(x = flipper_length_mm, y = body_mass_g)
  )

# 2.4.3 Exercises

## 1. A bar plot of species of penguins
ggplot(penguins, aes(y = species)) + 
  geom_bar()

## 2. color of bars
### fill is more useful

ggplot(penguins, aes(x = species)) +
  geom_bar(color = "red")

ggplot(penguins, aes(x = species)) +
  geom_bar(fill = "red")

## 3. bins argument in geom_histogram()
?geom_histogram
#Number of bins. Overridden by binwidth. Defaults to 30.

## 4. Diamonds dataset
diamonds <- diamonds

ggplot(diamonds, aes(x = carat)) +
  geom_histogram(binwidth = 0.2)

### ビン数の案としてのスタージェスの公式
### 1 + log2(n)
num_bin = 1 + trunc(log2(dim(diamonds)[1]))

ggplot(diamonds, aes(x = carat)) + 
  geom_histogram(bin = num_bin)

ggplot(penguins, aes(x = body_mass_g, color = species)) +
  geom_density(linewidth = 1.5)

mpg_data <-mpg

ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave("mpg-plot.pdf")
unlink("mpg-plot.pdf")

?ggsave

# 3.5 Exercise
my_bar_plot <- ggplot(mpg, aes(x = class)) +
  geom_bar()
my_scatter_plot <- ggplot(mpg, aes(x = cty, y = hwy)) +
  geom_point()
ggsave(filename = "mpg-plot.png", plot = my_bar_plot)

# 4
flights |> 
  filter(month %in% c(1,2) & day %in% c(1,2)) 

flight_data <- flights
