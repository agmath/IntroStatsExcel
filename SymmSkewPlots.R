library(tidyverse)

x_vals <- seq(0, 1, length.out = 500)
y_sym <- dnorm(x_vals, 0.5, 0.15)
y_right <- dbeta(x_vals, 2, 6)
y_left <- dbeta(x_vals, 6, 2)

ggplot() + 
  geom_line(aes(x = x_vals, y = y_sym),
            lwd = 1.1) + 
  labs(
    x = "",
    y = ""
  ) + 
  theme_bw()

ggplot() + 
  geom_line(aes(x = x_vals, y = y_left),
            lwd = 1.1) + 
  labs(
    x = "",
    y = ""
  ) + 
  theme_bw()

ggplot() + 
  geom_line(aes(x = x_vals, y = y_right),
            lwd = 1.1) + 
  labs(
    x = "",
    y = ""
  ) + 
  theme_bw()
