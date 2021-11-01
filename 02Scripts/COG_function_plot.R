df <- read.table("COG_function_stat.txt", sep = "\t", header = T, check.names = F)
library(reshape2)
library(ggplot2)
df2 <- melt(df)
df2 <- df2[,-2]
df2$group <- rep(c("INFORMATION_STORAGE_AND_PROCESSING","METABOLISM",
                   "CELLULAR_PROCESSES_AND_SIGNALING","METABOLISM","METABOLISM",
                   "METABOLISM","METABOLISM","METABOLISM","INFORMATION_STORAGE_AND_PROCESSING",
                   "INFORMATION_STORAGE_AND_PROCESSING","INFORMATION_STORAGE_AND_PROCESSING",
                   "CELLULAR_PROCESSES_AND_SIGNALING","CELLULAR_PROCESSES_AND_SIGNALING",
                   "CELLULAR_PROCESSES_AND_SIGNALING","METABOLISM","METABOLISM",
                   "POORLY_CHARACTERIZED","POORLY_CHARACTERIZED","CELLULAR_PROCESSES_AND_SIGNALING",
                   "CELLULAR_PROCESSES_AND_SIGNALING","CELLULAR_PROCESSES_AND_SIGNALING",
                   "CELLULAR_PROCESSES_AND_SIGNALING"),23)
df2$ID <- factor(df2$ID,levels=c("J", "K", "L", "B", "Z","D", "V", "T", "M", "N", 
                                 "U", "O", "C", "G", "E", "F", "H", "I", "P", "Q", "R", "S"))
ggplot(df2, aes(ID, value)) + geom_boxplot(aes(color=group)) + 
  geom_jitter(width = 0.2,aes(color=group))+
  scale_y_continuous(breaks=seq(0, 300, 20))+
  xlab("COG functional categories") +
  ylab("Number of genes") + 
  theme_classic() + theme_bw(base_size = 16) +
  theme(legend.position="none")+
  scale_color_manual(values = c("#EE3239", "#5EAA5F","#FECE00","#9D6AB9"))+
  ggsave(filename="COG_CAT_boxplot.pdf", height = 6,width = 8,scale=1)
