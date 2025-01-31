library(tidyverse)

x_vals <- seq(-3.5, 3.5, length.out = 500)
y_vals <- dnorm(x_vals, 0, 1)

x1_vals <- seq(-1, 1, length.out = 250)
x2_vals <- seq(-2, 2, length.out = 500)
x3_vals <- seq(-3, 3, length.out = 500)

ggplot() + 
  geom_ribbon(aes(x = x3_vals, ymin = 0, ymax = dnorm(x3_vals)),
              fill = "purple",
              alpha = 0.4) +
  geom_ribbon(aes(x = x2_vals, ymin = 0, ymax = dnorm(x2_vals)),
              fill = "purple",
              alpha = 0.6) +
  geom_ribbon(aes(x = x1_vals, ymin = 0, ymax = dnorm(x1_vals)),
              fill = "purple",
              alpha = 0.8) +
  geom_line(aes(x = x_vals, y = y_vals),
            color = "black",
            lwd = 1.25) + 
  theme_bw() +
  labs(x = "", y = "") +
  scale_x_continuous(breaks = c(-3, -2, -1, 0, 1, 2, 3), labels = c("μ - 3σ", "μ - 2σ", "μ - σ", "μ", "μ + σ", "μ + 2σ", "μ + 3σ"))
