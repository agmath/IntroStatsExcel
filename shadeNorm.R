library(tidyverse)

mu <- 18
sig <- 3

x <- seq(mu - 3.5*sig, mu + 3.5*sig, length.out = 500)
x_shade <- seq(mu - 3.5*sig, qnorm(0.03, mu, sig), length.out = 250)

ggplot() + 
  geom_ribbon(aes(x = x_shade, ymin = 0, ymax = dnorm(x_shade, mean = mu, sd = sig)),
              fill = "purple",
              alpha = 0.6) + 
  geom_line(aes(x = x, y = dnorm(x, mean = mu, sd = sig)),
            color = "black",
            lwd = 1.5) + 
  scale_x_continuous(breaks = c(10, 15, 18, 20, 25)) +
  labs(x = "Lifespan (months)", y = "") +
  theme_bw(base_size = 16)
