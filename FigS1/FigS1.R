#load required libraries
library(ggplot2)

###Figure S1------------------------------------------------------------------------------------------
depth.data <- read.table(file = "PATH/TO/FILE/CM3_linear.rds")
colnames(depth.data) <- c("Contig", "POS", "depth")

Con2 <- subset(depth.data, Contig == "3")  #Contig 2 consists of two plasmids which are falsely joined

#Determine sequence length
max.pos <- max(Con2$POS)
min.pos <- 1

#vector for x axis breaks
b <- 20000
s <- seq(0, b*ceiling(max.pos/b), by = b)
s[length(s)] <- max.pos
s[1] <- min.pos
s <- s[-20]

#vector for y axis breaks
bb <- 100
ss <- seq(0, bb*ceiling(max(Con2$depth)/bb), by = bb)

#draw the plot for figure 1 (supplementary)
p <- ggplot(Con2, aes(x = POS, y= depth)) +
  geom_line(size = 0.1)+
  scale_x_continuous(expand = c(0,0), breaks = s) +
  scale_y_continuous(expand = c(0,0), breaks = ss, limits = c(-100, 1200)) +
  theme_bw()+
  theme(panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        panel.background = element_blank(), 
        axis.line = element_line(colour = "black"),
        strip.background = element_blank(),
        strip.text.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust =  1)
  )+
  xlab("Contig position [bp]") +
  ylab("Read depth")

print(p)