library(tidyverse)
library(ggthemes)


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

###It seems that plotting the data in boxplots is a better idea.
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
  geom_smooth(se = FALSE)

## 10. these two different?
### same. One above assigns veriables in global level, while the other assigns veriables in local levels.
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
