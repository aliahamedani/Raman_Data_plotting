# put the txt files of Raman data (2 columns) in the same directory as the script and go on
theme_Lacey2 <- function(base_size=16, base_family="Helvetica Neue", alt_family = base_family, legend.position = "top",
                         panel.background.fill = "#fafafa") {
  library(grid)
  library(ggthemes)
  (theme_foundation(base_size=base_size, base_family=base_family)
    + theme(plot.title = element_text(size = rel(1.3), hjust = 0, face = "bold"),
            plot.subtitle = element_text(face = "italic"),
            text = element_text(),
            panel.background = element_rect(fill = panel.background.fill),
            plot.background = element_rect(fill = "transparent", colour=NA),
            panel.border = element_rect(colour = "#333333", size = 0.3),
            axis.title = element_text(size = rel(1), colour="#333333"),
            axis.title.y = element_text(angle=90, colour="#333333"),
            axis.text = element_text(size = rel(0.8), family = alt_family),
            axis.ticks.length=unit(0.15, "cm"),
            axis.text.x = element_text(margin = margin(0.2, 0, 0.2, 0, "cm"), colour="#333333"),
            axis.text.y = element_text(margin = margin(0, 0.2, 0, 0.2, "cm"), colour="#333333"),
            panel.grid.major = element_line(colour="#eaeaea", size = 0.5),
            panel.grid.minor = element_line(colour="#eaeaea", size = 0.2),
            legend.key = element_rect(colour = NA),
            legend.key.size = unit(0.6, "cm"),
            legend.background = element_blank(),
            strip.background=element_rect(colour="#eaeaea",fill="#eaeaea"),
            strip.text = element_text(colour = "#333333", lineheight=0.7),
            legend.title = element_text(size = rel(0.8), family = alt_family),
            legend.position = legend.position
    ))
}
library(tidyverse)
library(ggplot2)
Ramandata <- read.table("AN05P60-6-n.txt", header = FALSE, sep = "") #find the corresponding txt file with tab
head(Ramandata)
Ramandata2=filter(Ramandata, V1>250, V1<2500)  #feel free to play with the scale
head(Ramandata2)
ggplot(Ramandata2, aes(`V1`, `V2`)) +
       geom_line(colour="red", size= 0.5)+ xlim(250,2000)+ ylim(0,150)+ #feel free to play with the scale
       xlab("Raman Shift (cm -1)") + ylab("Intensity (counts)") +
  theme_bw() +
  theme_Lacey2() +
  theme(axis.text.y = element_blank())+
  scale_x_continuous(breaks = c(500, 1000, 1500, 2000, 2500, 3000, 3500)) +
  theme(panel.grid.major.y = element_blank(),panel.grid.minor.y = element_blank())+
  theme(panel.grid.major.x = element_blank(),panel.grid.minor.x = element_blank())+
  theme(axis.ticks.y = element_blank())+
  theme(
    axis.title.x = element_text(size = 14),
    axis.text.x = element_text(size = 12, face="bold", colour = "black"),
    axis.title.y = element_text(size = 14),
    axis.text.y = element_blank())

       