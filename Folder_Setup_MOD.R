# Create a whole load of directories based on a gene name list you gave the program
#1. Gene name list:
gene_names = c(
  "GPX1",
  "SOD2",
  "CAT",
  "OGG1",
  "ATM",
  "TXN",
  "ATR",
  "p53",
  "BRCA1",
  "BRCA2",
  "RAD17",
  #Biotransformation and detoxification 
  "AHR" ,
  "CYP1B1" ,
  "UGT1A1" ,
  "GSTM1" ,
  "ABCB6", 
  "ABCC1", 
  "CBR1", 
  "EPHX1", 
  "ALDH3A2", 
  "ADH7", 
  "NQO1", 
  #Antioxidant enzymes 
  "GPX4", 
  "GSR1", 
  "PRDX1" ,
  "SRXN1", 
  #Carbohydrate metabolism 
  "G6PD" ,
  "PGD" ,
  "TALDO1", 
  "TKT" ,
  "ME1", 
  "UGDH", 
  #Lipid metabolism 
  "ACOT7", 
  "ACOX1", 
  "SCD2",
  "SOD1", 
  #Haem and iron metabolism 
  "HMOX1", 
  "BLVRA", 
  "BLVRB", 
  "FECH",
  # Negative Controls
  "ATP5F1",
  "PGK1",
  "LMNB1",
  "B2M",
  "GAPDH")

# Set the working directory to your master folder e.g C:/Harry Young/Epidemiology/
setwd("DRIVE/YOUR FILE DIRECTORY")
dir.create("Trait and Tissue Groups")
dir.create("eGene")


for(name in gene_names){
  
  dir.create(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test"))
  setwd(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test"))
  subfolder_names <- c("Circos","Ensembl","Gtex","LDMatrix", "Sankey", "Gene_diagram_output") 
  for (n in 1:length(subfolder_names)){
    folder = dir.create(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test/",subfolder_names[n]))
  }
  
  setwd(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test/Ensembl"))
  dir.create("All_Exon_Options")
  
  setwd(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test/Gtex"))
  dir.create("Plots")
  
  setwd(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test/Gtex/Plots"))
  
  subfolder_names <- c("Gtex_egene","NES_vs_tissue_and_overview","p vs trait split by trait group and Expression direction","p vs traitgroup split Expression direction", "snp_against_Tissue", "Tissue_Group_and_Trait_Group_overlap","REG_region_counts") 
  for (n in 1:length(subfolder_names)){
    folder = dir.create(paste0("DRIVE/YOUR FILE DIRECTORY/",name,"_test/Gtex/Plots/",subfolder_names[n]))
  }
  
}
