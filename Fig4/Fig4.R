#load required libraries
library(ggplot2)

###Figure 4-------------------------------------------------------------------------------------------
depth.data <- read.table(file = "PATH/TO/FILE/CM3_false_join.rds")
colnames(depth.data) <- c("Contig", "POS", "depth")

Con2 <- subset(depth.data, Contig == "2")  #Contig 2 consists of two plasmids which are falsely joined

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

#set colors for the colored rectangles (different sequence regions)
colors <- c("#92D050", "#FFC000", "#0070C0")

#draw the plot for figure 4
p <- ggplot(Con2, aes(x = POS, y= depth)) +
  geom_rect(mapping=aes(xmin=0,      xmax = 205000, ymin=-100, ymax=0), alpha=0.5, fill = colors[1]) +
  geom_rect(mapping=aes(xmin=205000, xmax = 245000, ymin=-100, ymax=0), alpha=0.5, fill = colors[2]) +
  geom_rect(mapping=aes(xmin=245000, xmax = max(s), ymin=-100, ymax=0), alpha=0.5, fill = colors[3]) +
  geom_line(linewidth = 0.1)+
  scale_x_continuous(expand = c(0,0), breaks = s) +
  scale_y_continuous(expand = c(0,0), breaks = ss, limits = c(-100, 1200))+
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