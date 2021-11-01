genes_tab <- read.table("narGHIJ_gene_cluster.txt", header = T,sep="\t")
library(ggplot2)
library(gggenes)
library(RColorBrewer)

getPalette <- colorRampPalette(brewer.pal(n = 12, name ="Set3"))

ggplot(genes_tab, aes(xmin = start, xmax = end, y = molecule, fill = gene,label=gene)) +
  geom_gene_arrow(show.legend = F) +
  facet_wrap(~ molecule, scales = "free",ncol = 1) +
  scale_fill_brewer(palette = "Set3",direction = -1) +
  geom_gene_label(align = "centre",size=12) + labs(y="")+
  theme_genes() + ggsave("thermus_operon_nrGHIJ.pdf")
