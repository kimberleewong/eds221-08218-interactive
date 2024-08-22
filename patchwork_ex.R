library(tidyverse)
library(patchwork)
library(here)

lizards <- read_csv(here("data_tidy", "lizards.csv"))

two_lizards <- lizards %>% 
  filter(common_name %in% c("eastern fence", "western whiptail"))


p1 <- ggplot(two_lizards, aes(x = total_length, y = weight)) +
  geom_point(aes(colour = common_name)) +
  scale_color_manual(values = c("cadetblue", "purple"),
                     name = "lizard species:",
                     labels = c("Eastern fence lizard",
                                "Western whiptail lizard")) +
  theme_light() +
  theme(legend.position = c(0.2,0.8),
        legend.background = element_blank()) +
  labs(x ="Total length(mm)",
       y = "Weight (grams)") 


p2 <- ggplot(lizards, aes(x = weight, y = site)) +
  geom_boxplot() +
  labs(x = "weight (grams)",
       y = "site")

p3 <- ggplot(lizards, aes(weight)) +
  geom_histogram() +
  labs(x = "weight (grams)",
     y = "counts (n)")

p4 <- ((p1 + p2) / p3) 

ggsave("patchwork_example.png", p4)






