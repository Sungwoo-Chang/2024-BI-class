library(tidyverse)
library(openxlsx)
library(cols4all)

library(httpgd)

hgd()


dt <- read.xlsx("C:/Users/heung/OneDrive/Documents/scData/hiv/cellpercent.xlsx", 1)
dt
colnames(dt)[4] <- "Percentage"

head(dt)

dt$Tissue <- factor(dt$Tissue, levels = c("normal", "hiv"))

p <- ggplot(dt, aes(x = 2,
                    y = Percentage,
                    fill = Celltype)) +
  geom_col(width = 1,
           color = "white") +
  facet_grid(. ~ Tissue) +
  scale_x_continuous(breaks = NULL)

p

p1 <- p + coord_polar(theta = "y")
p2 <- p1 + xlim(c(0.2, 3.8))


c4a_gui()
mycol <- c4a("pastel", 10)
mycol2 <- c4a("20", 10)
mycol3 <- c4a("miller_stone", 10)

p3 <- p2 +
  scale_fill_manual(values = mycol3) +
  theme_void() +
  theme(
    strip.text.x = element_text(size = 14),
    legend.title = element_text(size = 15),
    legend.text = element_text(size = 14)
  )
p3
