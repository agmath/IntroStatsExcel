library(tidyverse)

x_vals <- seq(-3.5, 3.5, length.out = 500)
t3 <- dt(x_vals, df = 3)
t10 <- dt(x_vals, df = 10)
t15 <- dt(x_vals, df = 15)
t30 <- dt(x_vals, df = 30)
norm <- dnorm(x_vals)

my_data <- tibble(
  x_vals = rep(x_vals, 4),
  tdist = c(t3, t10, t15, t30),
  degrees_freedom = c(rep("3", 500), rep("10", 500), rep("15", 500), rep("30", 500))
) %>%
  mutate(degrees_freedom = factor(degrees_freedom, levels = c("3", "10", "15", "30")))

ggplot() + 
  geom_ribbon(aes(x = x_vals, ymin = 0, ymax = norm),
              color = "black",
              alpha = 0.25) +
  geom_line(aes(x = x_vals, y = norm),
            color = "black", 
            alpha = 0.25) +
  geom_line(data = my_data,
            aes(x = x_vals, y = tdist, color = degrees_freedom)) + 
  theme_bw(base_size = 18) + 
  theme(legend.position = "bottom") + 
  labs(x = "", y = "")

t13 <- dt(x_vals, df = 13)

ggplot() + 
  geom_line(aes(x = x_vals, y = t13)) + 
  theme_bw(base_size = 18) + 
  labs(x = "t", y = "")

x_shade <- seq(1.5, 3.5, length.out = 250)
dt_shade <- dt(x_shade, df = 13)

ggplot() + 
  geom_ribbon(aes(x = x_shade, ymin = 0, ymax = dt_shade),
              fill = "purple",
              alpha = 0.7) +
  geom_line(aes(x = x_vals, y = t13),
            color = "black") +
  theme_bw(base_size = 18) + 
  theme(legend.position = "bottom") + 
  labs(x = "t", y = "") +
  scale_x_continuous(breaks = c(-2, 0, 1.5, 2))

t11 <- dt(x_vals, df = 11)

ggplot() + 
  geom_line(aes(x = x_vals, y = t11)) + 
  theme_bw(base_size = 18) + 
  labs(x = "t", y = "")

x_shade <- seq(qt(0.95, df = 11), 3.5, length.out = 250)
t11_shade <- dt(x_shade, df =  11)

ggplot() + 
  geom_ribbon(aes(x = x_shade, ymin = 0, ymax = t11_shade),
              fill = "purple",
              alpha = 0.75) +
  geom_ribbon(aes(x = -x_shade, ymin = 0, ymax = t11_shade),
              fill = "purple",
              alpha = 0.75) +
  geom_line(aes(x = x_vals, y = t11)) + 
  geom_text(aes(x = -0.2, y = 0.1), label = "0.90", size = 10) +
  geom_text(aes(x = -2.75, y = 0.05), label = "0.05", size = 6) +
  geom_text(aes(x = 2.75, y = 0.05), label = "0.05", size = 6) +
  geom_vline(xintercept = qt(0.95, df = 11), lwd = 1.25, linetype = "dashed") +
  geom_text(aes(x = 2.3, y = 0.25), label = "Critical\nValue", size = 4) +
  theme_bw(base_size = 18) + 
  labs(x = "t", y = "")

x_vals <- seq(-4, 4, length.out = 500)
x_shade <- seq(-4, qt(0.025, df = 41), length.out = 250)
t41 <- dt(x, df = 41)
t41_shade <- dt(x_shade, df = 41)

ggplot() + 
  geom_ribbon(aes(x = x_shade, ymin = 0, ymax = t41_shade),
              fill = "purple",
              alpha = 0.75) +
  geom_ribbon(aes(x = -x_shade, ymin = 0, ymax = t41_shade),
              fill = "purple",
              alpha = 0.75) +
  geom_line(aes(x = x_vals, y = t41)) + 
  geom_text(aes(x = -0.1, y = 0.1), label = "0.95", size = 14) +
  geom_text(aes(x = -3, y = 0.05), label = "0.025", size = 10) +
  geom_text(aes(x = 3, y = 0.05), label = "0.025", size = 10) +
  geom_vline(xintercept = qt(0.975, df = 41), lwd = 1.25, linetype = "dashed") +
  geom_text(aes(x = 2.75, y = 0.25), label = "Critical\nValue", size = 10) +
  theme_bw(base_size = 18) + 
  labs(x = "t", y = "")
