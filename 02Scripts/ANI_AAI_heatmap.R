# Thermus Comparative ANI/AAI heatmap# 
library(pheatmap)
library(RColorBrewer)
library(dplyr)

COLORS <- colorRampPalette(c("#1ba784", "#F9F7EB", "#f1908c"))
ANI <- read.table("ANIb_percentage_identity.txt", sep = "\t", header = T, row.names = 1, check.names = F)
ANI <- ANI * 100
glist <- c("Thermus_filiformis_ATCC_43280T","Thermus_oshimai_DSM_12092T","Thermus_islandicus_DSM_21543T",
           "Thermus_sediminis_L198","Thermus_aquaticus_Y51MC23T","Thermus_arciformis_CGMCC_1.6992T",
           "Thermus_composti_JCM_19902T","Thermus_thermophilus_HB8T","Thermus_thermophilus_HB27",
           "Thermus_thermophilus_JL-18","Thermus_thermophilus_SG0.5JP17-16","Thermus_parvatiensis_RL",
           "Thermus_brockianus_GE-1T","Thermus_igniterrae_ATCC_700962T","Thermus_thermamylovorans_CFH_72773T",
           "Thermus_caliditerrae_YIM_77777T","Thermus_tengchongensis_YIM_77401T","Thermus_caldifontis_YIM_73026T",
           "Thermus_amyloliquefaciens_YIM_77409T","Thermus_tenuipuniceus_YIM_76954T","Thermus_caldilimi_YIM_78456T",
           "Thermus_scotoductus_SA-01T","Thermus_antranikianii_DSM_12462T")
ani <- ANI[glist,glist]

pheatmap(ani,cluster_rows = F,cluster_cols = F,
         border_color = "white", cellwidth = 14, cellheight = 14,
         color = COLORS(100), legend_breaks = seq(75, 100, by=5),
         legend_labels = c("75", "80", "85", "90", "95", "100"), breaks = seq(75,100,length.out = 100),
         filename = "ANI.pdf")

AAI <- read.table(file="AAI_matrix.txt",sep = "\t", header = T, row.names = 1,check.names = F)

aai <- AAI[glist,glist]
pheatmap(aai,cluster_rows = F,cluster_cols = F,
         border_color = "white",cellwidth = 14,cellheight = 14,
         color = COLORS(100), legend_breaks = seq(75, 100, by=5),
         legend_labels = c("75", "80", "85", "90", "95", "100"), breaks = seq(75,100,length.out = 100),
         filename = "AAI.pdf")
