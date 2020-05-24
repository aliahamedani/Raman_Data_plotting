# put the CSV files of Raman data in 2 columns in the same directory as the script and go on
library(tidyverse)
library(ggplot2)
Ramandata <- read.csv("AN05P60-2.csv") #replace AN05P60-2 with filename 
head(Ramandata)
ggplot(Ramandata, aes(x=`Raman.Shift..cm.1.`, y=`Intensity..counts.`)) +
       geom_line(colour="red", size= 0.5)+ xlim(250,2500) + #feel free to play with the scale
       xlab("Raman Shift (cm -1)") + ylab("Intensity (counts)") + theme_bw() +
       theme(axis.text.y = element_blank())