library(ggplot2)
library(reshape)
Core = colMeans(read.table("number_of_conserved_genes.Rtab"))
Pan = colMeans(read.table("number_of_genes_in_pan_genome.Rtab"))
Core = Core[-length(Core)]
Pan = Pan[-length(Pan)]
genes = data.frame( genes_to_genomes = c(Core,Pan),
                    genomes = c(c(1:length(Core)),c(1:length(Core))),
                    Key = c(rep("Core",length(Core)), rep("Pan",length(Pan))) )

df1 = read.table("number_of_conserved_genes.Rtab")
df1 = df1[,-dim(df1)[2]]
df1 <- melt(df1)
df1$pancore <- rep("Core",dim(df1)[1])
colnames(df1) <-c("genomes","genes","Key")


df2 = read.table("number_of_genes_in_pan_genome.Rtab")
df2 = df2[,-dim(df2)[2]]
df2 <- melt(df2)
df2$pancore <- rep("Pan",dim(df2)[1])
colnames(df2) <-c("genomes","genes","Key")

df3 <- rbind(df1,df2)

df3$genomes <- gsub("V","",df3$genomes,perl = T)
df3$genomes <- factor(df3$genomes, levels = 1:57)

ggplot(df3,aes(x=genomes,y=genes,colour = Key))+geom_boxplot(position=position_identity())+
  geom_line(data = genes, mapping = aes(x = genomes, y = genes_to_genomes, group=Key,linetype=Key,)) +
  geom_point(data=genes, mapping=aes(x=genomes,y=genes_to_genomes,color=Key),shape=16,size=2)+
  theme_classic() +
  scale_y_continuous(breaks=seq(500, 18000, 2000))+
  xlab("No. of genomes") +
  ylab("No. of genes")+ theme_bw(base_size = 16) +  
  theme(legend.justification=c(-0.2,1.2),legend.position=c(0,1.02),
        panel.grid.major.x  = element_blank(),
        panel.grid.minor.y  = element_blank())+
  scale_color_manual(values = c("#E7B800", "#FC4E07"))+
  ggsave(filename="pan_core_genes_boxplot.pdf", scale=1)
