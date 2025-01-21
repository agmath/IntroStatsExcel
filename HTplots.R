library(tidyverse)

mu <- 200
x_bar <- 258
s <- 57
n <- 63

x_vals <- seq(mu - 3.5*s, mu + 3.5*s, length.out = 500)
y_vals <- dnorm(x_vals, mu, s)

ggplot() + 
  geom_line(aes(x = x_vals, y = y_vals)) + 
  theme_bw(base_size = 18) + 
  labs(x = "Step Count Error", y = "")

x_shade <- seq(qnorm(0.95, mu, s), mu + 3.5*s, length.out = 250)
y_shade <- dnorm(x_shade, mu, s)

ggplot() + 
  geom_ribbon(aes(x = x_shade, ymin = 0, ymax = y_shade),
              fill = "purple",
              alpha = 0.75) +
  geom_line(aes(x = x_vals, y = y_vals)) + 
  theme_bw(base_size = 18) + 
  labs(x = "Step Count Error", y = "")

t_vals <- seq(-4, 4, length.out = 500)
y_vals <- dt(t_vals, df = 11)

t_shade <- seq(3.53, 4, length.out = 250)
y_shade <- dt(t_shade, df = 11)

ggplot() + 
  geom_ribbon(aes(x = t_shade, ymin = 0, ymax = y_shade),
              fill = "purple",
              alpha = 0.75) +
  geom_vline(xintercept = 3.53, linetype = "dashed", lwd = 1.5) +
  geom_line(aes(x = t_vals, y = y_vals)) + 
  theme_bw(base_size = 18) + 
  labs(x = "t", y = "")
