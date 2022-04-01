# Create a whole load of directories based on a gene name list you gave the program

# Below is an example list to get you started, add as many or as few as you like

#1. Gene name list:
gene_names = c("YOUR_GENE_NAME", "YOUR_GENE_NAME_2") # For example, "Nrf2", "KEAP1", 
for(name in gene_names){
  print(name)
}
dir.create("DRIVE:/YOUR FILE DIRECTORY/Trait and Tissue Groups")
dir.create("DRIVE:/YOUR FILE DIRECTORY/eGene")
for(name in gene_names){
  
  dir.create(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test"))
  setwd(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test"))
  subfolder_names <- c("Circos","Ensembl","Gtex","LDMatrix", "Sankey", "Gene_diagram_output","Gnomad", "final_data") 
  for (n in 1:length(subfolder_names)){
    folder = dir.create(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test/",subfolder_names[n]))
  }
  
  setwd(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test/Ensembl"))
  dir.create("All_Exon_Options")
  
  setwd(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test/Gtex"))
  dir.create("Plots")
  dir.create("Final Dataframes")
  setwd(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test/Gtex/Plots"))
  
  subfolder_names <- c("Gtex_egene","NES_vs_tissue_and_overview","p vs trait split by trait group and Expression direction","p vs traitgroup split Expression direction", "snp_against_Tissue", "Tissue_Group_and_Trait_Group_overlap","REG_region_counts") 
  for (n in 1:length(subfolder_names)){
    folder = dir.create(paste0("DRIVE:/YOUR FILE DIRECTORY/",name,"_test/Gtex/Plots/",subfolder_names[n]))
  }
  
}


