An overview of the various Sections on this page:

 - [Section A: Pipeline Rationale](##-Section-A)
 
 - [Section B: Software and tokens required prior to running the Pipeline](##-section-B)
 
 - [Section C: Quick Start Guide and Troubleshooting](##-section-C)
 
 - [Section D: Understanding the Pipeline Output Plots](#section-d)

 - [Section E: Pipeline extension: Multiple gene comparisons](#section-e)
 
 - [Section F: Modifying the Tissue-and-Trait-Databases](#section-f)
 
 - [Section G: Using the main R Notebook to modify the code](#section-g)

## Section A: Pipeline Rationale

The goal of this pipeline is to suggest novel Gene-Trait associations by integrating two independent and publicly available datasets: (i) SNP-gene expression data from the GTEx Project and (ii) SNP-trait data from the PheWAS database.

The basic rationale of the Pipeline is illustrated in **Schematic A**. Firstly, using the GTEx Portal (https://www.gtexportal.org/home/), SNPs are identified that are associated with a change in the expression of a specific gene of interest. These specific SNPs are then searched in the PheWAS database (ieugwas::phewas https://gwas.mrcieu.ac.uk/phewas/) to find traits potentially associated with these SNPs. **The pipeline thus suggests traits potentially associated with expression changes in your gene of interest.**

More detail about the different steps of the pipeline are illustrated in **Schematic B**.

IMPORTANT NOTE: Traits and tissues were manually grouped into Trait Groups and Tissue Groups. This information is stored in the full_trait_database and full_tissue_database csvs found in the zip file. These groupings will be updated with each new release of GTEx and PheWAS. The groupings can also be manually rearranged if new group allocations are required. Further explanation below in section [Tissue-and-Trait-Databases](#-Tissue-and-Trait-Databases).

![shematic_for_github](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c46895a6-a306-4c44-84a9-aa49de639dc8)

## Section B: Software and tokens required prior to running the pipeline

### 1. LDlink token
This pipeline uses the LDlink web server, which requires a unique token to run. The token is easily obtained here: [https://ldlink.nih.gov/?tab=apiaccess](https://ldlink.nih.gov/?tab=apiaccess). This step needs to be completed only once and then that token will stay with you for life (it is linked to your email address).

The LDlink website is currently saying the URL is out of date (yellow warning box). Please ignore this.

### 2. Download and install R and RStudio

This step should be performed the first time the pipeline is run, but do allow updates whenever prompted. You can find the downloads at the following links:

R: https://www.stats.bris.ac.uk/R/ 

RStudio: https://posit.co/downloads/

Following installation, open RStudio. Then continue following the instructions below for "Quick start guide". The pipeline was built on a Mac but will work identically on a Windows computer.

Important: If you already have R and Rstudio installed prior to your first run, please either fresh install or reset all of your packages.

### 3. Create an ieugwas access token
To use the IEU OpenGWAS, you need to authenticate your account. To authenticate, you need to generate a token from the OpenGWAS website using the following steps:

a. Login to https://api.opengwas.io/profile/ , creating a profile if needed

b. Generate a new token

c. Save it, you'll need to enter it (see instructions below)

NOTE: This token resets monthly so you will need to login again and click generate if more than a month has passed since your last run. 

![IEUGWAS token](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/1c1db561-f8c4-4175-a0ef-a129d6d71195)

## Section C: Quick Start Guide (incl. Troubleshooting)

### 1. Create a file directory

This will be where the pipeline is saved and where the pipeline outputs all the data. Create a suitable folder to act as the file directory e.g. on your desktop, or in your documents folder. For example: 

<img width="741" alt="Step 1 Github" src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/a2266e2c-1d13-41b4-8014-463053764575">

### 2. Download the pipeline (and all associated databases)

This information is contained in a zip file that can be accessed from this github page (see arrows in image below). After download, save the zip file to your chosen file directory.

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/4c692d03-41f3-4841-934c-9554b343be85)

### 3. Extract the pipeline files from the zip file

The zip file contains the main pipeline, tissue and trait database csvs, readme.md and shiny app. After unzipping, these files should be moved into the main (directory folder) file and the original zip file should be deleted. Your file directory should now look like this: 

<img width="495" alt="step3 github" src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/009da7dd-3b21-43e6-9ebf-0419acfe02eb">

### 4. Open the Pipeline in RStudio

We now need to open the final_pipeline.Rmd in RStudio. This can be achieved by either: Right-click>open with>Rstudio, or, File > Open File... in RStudio. When the pipeline is run for the first time, several packages will be installed automatically. You may get a warning banner appear like this: 
 
![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/93e14a1c-6432-4d92-a595-04173f542c45)

This issue will be resolved automatically later on, once you click “run all”. To resolve the issue at this stage, you can also click "install" on this banner (this is optional).

### 5. Setting up the pipeline with your LDlink token, file directory and specific gene name

In RStudio, scroll down the pipeline slightly and you will see 'gene_name', 'file_directory', 'LD_Token' amd 'ieu_token' on lines 17, 21, 26 and 31 respectively. These defaults should now be replaced with your own versions. These are the only changes you need to make - please don't change anything else in the code unless you are specifically trying to tweak the pipeline.
 
 **gene_name** - The name of the human gene to be investigated, in all capitals as it appears in GTEx. You can check your gene name here: https://gtexportal.org/home/ in the dedicated search box. e.g: "NFE2L2"
 
 **file_directory** - The path to your own file directory, e.g "C:/Harry/Documents/Example Directory"
 
 **LD_Token** - Your unique 12 character token from LDlink (obtained above) e.g: "abc1def2ghi3"

 **ieu_token** - Your unique many character token from ieugwas (obtained above) e.g: "akjhwbd......hj34lkug"

#### Before your edit the pipeline appears: 
UPDATED SCREENSHOT NEEDED
![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7af50e7d-0487-4ae5-90cf-d76da18fa22c)

#### After your edit the pipeline appears: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/b679c9db-3ef3-4bf9-a2e2-b0ec92a61cb9)

#### Please check these common errors:

a. Make sure each of these changes are within speech marks. e.g: gene_name = "NFE2L2" not gene_name = NFE2L2

b. Make sure your gene name is exactly as it appears in GTEx (check using https://gtexportal.org/home/).

c. Make sure your file_directory has "/" not "\\". e.g: file_directory = "C:/Documents/Example directory" not file_directory = "C:\Documents\Example directory". This is the default for Windows so is a very common problem.

If the pipeline still errors, please email me with details of the error and your modified final_pipeline.rmd file.

### 6. Running the pipeline

In the top right of the RStudio window, click 'run all': 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/5dfffe8f-c975-452d-a7fd-a82d2761b791)

### 7. Be patient! The pipeline should take ~20-30 mins to run.

I COULD PUT THIS AS A SEPERATE SCRIPT? - NOT SURE WHAT IS EASIER

The pipeline will automatically open a Shiny App to display the data. The Shiny App can be reopened at anytime, by specifcally running the Shiny App rerun chunk on lines 3204-3215 - the code in this chunk needs to be updated with GENE-NAME and File_directory in the same way as at teh start of the pipeline - then click the 'play' symbol at the top right of the box. All of the plots displayed in the Shiny App will also be saved as pdfs in the 'GENE_test' folder. The Shiny App will display the Circos plots in a nicer format than the output pdfs saved in the Circos folder.

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/be747c60-8cfe-426c-9ca0-f6628b19e1e3)

All outputs of the pipeline will automatically be saved in a dedicated folder ('GENE_test') within the main directory folder.

<img width="739" alt="Step7 gituhub" src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/5464b4d0-8bae-40c2-8229-1490e0ff8732">


### 8. Troubleshooting
This pipeline uses three servers: ieugwasr, LDlink and ensembl. All of these will time-out if the pipeline takes too long to run. If this happens, the pipeline will stop running and an error message will pop up in the console (bottom left box). If this happens please try running the pipeline again at a later time, evenings are often less busy. If the pipeline keeps erroring, please let me know and I'll help as much as I can!

The main errors experienced during running of the pipeline occur during installation and updating of the packages. This is often complicated if the pipeline is run on an IT administered system, because it is reading and writing RStudio System files. This is in no way dangerous. All files being downloaded and installed are from verified and incredibly well-used sources. So if you experience trouble using a work computer, consider asking for temporary admin rights.


## Guide to files:
The output of the pipeline will be automatically saved in a 'GENE_test' folder, which contains the following subfolders in alphabetical order:

### Circos:
Circos style plots.
+ **G-Tissue_trait_overlap:** Main trait tissue overlap plot.
+ **Position_Gtex_P:** Position of SNP on the Chromosome linked to each Tissue Group (after PheWAS and LD removal).
+ **tissue_LUT:** Seperated legend, a guide to tissue group colors
+ **Tissue_trait_overlap_NO_OTHER:** Alternate version of H, excluding the "Other" category.
+ **trait_position:** Position of SNP on the Chromosome linked to each Trait Group.
+ **trait_position_NO_OTHER:** Position of SNP on the Chromosome linked to each Trait Group (No "Other" category).

  
### Ensembl:
Data relating to Ensembl - gene and regulatory regions.
+ **GENE_full_REG_region.csv:** Overview of each regulatory region within 2mB of your gene of interest.
+ **NFE2L2_structure_FIN.csv:** Ensembl download of your gene's region including introns,exons, 5'UTR and 3'UTR.

  
### Final_data:
Main data output.
+ **final_df.csv:** The pipeline output from which all plots are created.
+ **final_workspace_for_shiny.RData:** Rstudio workspace, to be reloaded for rerunning the shiny app, detailed above.
+ **NFE2L2_GtextoPHEWAS_RAW.csv:** Original search of GTEx SNPs into PheWAS() - before LD removal and all pipeline cleaning/mod steps.

  
### Final Plots:
Output plots of pipeline (see below for details).

### Gene_diagram_output:
Curved gene diagrams for use with circos plots + straight versions,
+ **Curved_gene_diagram_G_Colour:**  (BEFORE PheWAS and LD) KEY: y=-log(p) (of GTEx NES value), x=Chromosome position, color = regulatory region each SNP is found in.
+ **Curved_gene_diagram_G:** (BEFORE PheWAS and LD) KEY: y=-log(p) (of GTEx NES value), x=Chromosome position, color = Blue.
+ **Curved_gene_diagram_P_FULL_Colour:** (AFTER PheWAS and LD) KEY: y=-log(p) (of trait beta value), x=Chromosome position, color = regulatory region each SNP is found in.
+ **Curved_gene_diagram_P_FULL:** (AFTER PheWAS and LD) KEY: y=-log(p) (of trait beta value), x=Chromosome position, color = Blue.
+ **Curved_gene_diagram_RED_colour:** (AFTER PheWAS and LD) KEY: y=-log(p) (of GTEx NES value), x=Chromosome position, color = regulatory region each SNP is found in.
+ **Curved_gene_diagram_RED:** (AFTER PheWAS and LD) KEY: y=-log(p) (of GTEx NES value), x=Chromosome position, color = Blue.
+ **Gene_structure_G:**  (BEFORE PheWAS and LD) KEY: y=-log(p) (of GTEx NES value), x=Chromosome position, color = regulatory region each SNP is found in.
+ **Gene_structure_gtex_RED:** (AFTER PheWAS and LD) KEY: y=-log(p) (of GTEx NES value), x=Chromosome position, color = regulatory region each SNP is found in.
  
### Gtex
Data from GTEx - tissue/expression change centric
+ **Gtex_cleaned.csv:** GTEx data download after some minor cleaning steps to make it more readable with some additional columns (|NES|, Gene regions, UTRs) 
+ **Gtex_cleaned_REG.csv:** GTEx data download after some minor cleaning steps to make it more readable AND all predicted regulatory regions assigned - from Ensembl.
+ **GENE_Gtex_cleaned.csv:** GTEx data download after some minor cleaning steps to make it more readable.
+ **NFE2L2_gtexPHEWAS_no_ukaORAmbig_FINAL_linkagetempr20.5:** The last step before LD removal. Providing an alternative final_df if you wanted to not filter based on LD. In this case an r2 cutoff of 0.5 was used (this is very leniant LD already).
+ **NFE2L2_merge_GTEX_PHEWAS.csv:** Initial output of GTEx SNPs into PheWAS().
+ **unique_Gtex_snps.csv:** List of all GTEx SNPs altering your Genes expression.

### LDMatrix
Data on LD calculations
+ **NFE2L2_r2.csv:** Full matrix of r2 scores from LDLink.
+ **rs_overlap_ALL_NFE2L2:** Data object for R of r2 scores in case you want to visualise the data as a matrix.

## Section D: Understanding the Pipeline Output Plots
## Final Plots:

### Plot A1: Number of SNPs per Tissue Group from GTEx
An overview of which tissue groups the SNPs that alter expression of your gene of interest were detected in by GTEx cis-eQTLs, grouped by the tissue groups. This is generated using the initial download from GTEx before running through the pipeline or assessing linkage disequilibrium.

Colour = direction of expression change, rsid = unique SNP identifier

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/01bc79e2-3c3e-427e-b88c-3e5f234da1b7" width="600" height="400">

### Plot A2: Number of SNPs after PheWAS search and LD removal

The same plot as described in A1 but after running the pipeline, thereby removing SNPs that have not been associated with a phenotype in the IEU Open GWAS project PheWAS database ([mecieu](https://gwas.mrcieu.ac.uk/)) or that are in linkage disequilibrium ([LDlink](https://ldlink.nih.gov/?tab=home))

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/457bd4c2-9f88-4610-9ca7-77f0759cdf07" width="600" height="400">


## Plot A3: Number of SNP-Trait Associations per Tissue (after LD removal)

An overview of the SNP-Trait Associations (STAs) per tissue group. The pipeline aims to match known STAs with expression changes. This plot shows which Tissue Groups the SNPs in those STAs were found in, relative to the direction of expression change.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c946c14d-7820-468a-95ee-0034058f3b8e" width="600" height="400">


### Plot A4: Overview of regulatory regions SNPs are found in
An overview of which regulatory regions (auto assigned from ensembl) the SNPs from STAs outputted from the pipeline are found in.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/223fe739-0ba7-4726-a335-65a1c86fb62a" width="500" height="300">


### Plot B: Correlation of STAs to number of traits in database
Correlation of the number of different traits in a Trait Group relative to the total number of different possible traits in the full database. An indication of whether the results are due to chance. This considers repeated SNP-Trait associations. If 100 different SNPs are all associated with LDL, this is recorded as 100 SNP-Trait associations. 
+ zoomed version on the 15% x 15% region to avoid big outliers (B2)

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/75587bab-e594-4a15-84c7-01573083fa9c" width="400" height="500">

### Plot C: Number of tissues each SNP affects expression in
A summary of how many tissues each SNP alters gene expression in (from GTEx eQTLs). Importantly, this also shows cases where a SNP is associated with a decrease in expression in one tissue and an increase in another. Though rare, these could provide further complexity or insight when interpreting the SNP-Trait associations.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/03d3d006-565e-42bc-97e4-5011f7bba577" width="180" height="1000">

### Plot D1: Number of STAs in Each Traitgroup
Number of SNP-Trait associations per Trait Group. Colour based on Trait Group. i.e. Regardless of direction of expression change, which Trait Groups are affected by SNPs that alter a gene of interests expression.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c0d60e4c-8c26-4b4d-94a2-d974f4a487e2" width="540" height="300">

### Plot D2: Proportion of STAs in Each Traitgroup Relative to Database
Normalised Version of D1 - normalised to the number of possible traits per Trait Group within the database. (Number of different traits from SNP-Trait associations per Trait Group)/(Number of possible traits in each Trait Group from Full_trait_database.csv).

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/0e965ab5-5f2b-47a1-b8d1-4addebde261a" width="540" height="300">

### Plots E1-E2
These plots are grouped together to summarise the number of STAs per Trait Group while considering expression change and beta change (the direction of change of a trait). The number of STAs in each group is normalised to the total number of STAs across all Trait Groups. This also allows direct comparison between different genes run through the pipeline.

**Key**: Above x-axis, increased expression, Below x axis decreased expression, y axis: Number of STAs in a traitgroup / Number of total STAs in output dataframe, colour = direction of trait change. i.e. Yellow = SNP increases trait, Purple = SNP decreases trait.

### E1: STAs relative to total in df
Individual SNP-trait associations grouped by Trait Group. 

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/b9478432-d0d4-4133-ae62-ad09fbd81a70" width="600" height="300">

### E2: STAs relative to total in df (No Other or Other Gene Expression Change)
Modified version of E1 without Other Gene Expression Change or Other categories because these are often very big and so can obscure the other results. "Other Gene Expression Change" is a Trait Group where every trait is another gene ID with altered expression, often according to GTEx data. "Other" consists of traits I could not categorise easily. For example, "geographical location: North". Though both of these categories may be important, they are often large and so are removed for clarity here.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/324f0fa2-8fe7-448b-b84e-da52f199e5a6" width="600" height="300">

### Plots F1-2
These graphs offer an alternate way of visualising the plots in E. Here we include p-value as -log(p) and display the each individual STA within each Trait Group. the -log(p) value is then multiplied by the direction of expression change caused by that SNP. E.g. if rs1; decreseas expression; decreases LDL; -log(p) = 22 -> log(p)*direction = -22

**Key**: y-axis: SNP-Trait assocations -log(p) x Direction of expression change. Colour = direction of trait change. Below x-axis, SNPs that decrease the gene of interests expression. Above x-axis, SNPs that increase the gene of interests expression

### F1: Overview of STAs in Traitgroups and their -log(p) values
Individual STAs per Trait group, including p value, direction of expression change and direction of trait change (beta)
<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/4d9c9f2b-ab1e-4215-98c7-6efa935f0743" width="600" height="300">

### F2: Overview of STAs in Traitgroups and their -log(p) values (No Other or Other Gene Expression Change)
Modified version of F1 without "Other" and "Other Gene Expression Change" for clarity (see E2 for explanation).

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/d40e3047-25b3-41f1-850e-1f9617da0999" width="600" height="300">

### F3: Other Gene Expression Change only
Expanding just the Other Gene Expression Change category to look at the individual traits (in this case genes) your gene of interest/your SNPs effect.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/a2675cb7-7d2f-4a4f-99ac-fa4a995fcbb6" width="450" height="800">

### F4: Each trait group indivdually
Expanding all the Trait Groups to visualise individual traits within the categories. In this case displaying just one example: Bodyfat/Size. NOTE: these can often be very big, if the plot is unreadable, hopefully you can find and fix it within the code but if not please email me and I'll be happy to modify it for you. Simply replace the final '}' on line 1724 with:

  }else if(for_label>200){
    ggsave(filename, height=700, width=230, unit="mm")
  }
}

and alter "height=x" accordingly if the plots still don't fit.

Example of the bodyfat/size subcategory shown here:

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/2c108f72-8df2-4f39-8c76-d0b5c0e23eef" width="400" height="750">

### Plot G
Circos plot displaying the overlap of Tissue Groups where the SNPs were found compared to the Trait Groups their associated traits are in. 

![Circos](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/fc2dbdea-f5f6-4767-90e3-30fdfef71ddf)

## Section E: Pipeline extension: Multiple gene comparisons

Once two or more genes have been run through the pipeline, you can compare the results between these genes using heatmaps and stacked bar charts. This is a seperate .rmd file named comparisons_between_genes.rmd.

### Quick Start:
1. Modify line 24 of the comparisons_between_genes.rmd file to genes_for_heatmap = c("GENE_1","GENE_2","GENE_3") - where GENE_1 to GENE_3 are genes you have run through the pipeline and exist in your file directory as GENE_test. OR to genes_for_heatmap = c("All") to find all genes you have run.
2. Similar to the pipeline itself, you need to specify the file directory in line 28 to the SAME directory your pipeline has been working in. Screenshot pointing to the lines to modify:

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/e2b0f42e-9af3-4a2f-a37a-f3172c78bd44)

Your directory should look something like shown below. If you have altered the names of any folders you will need to change them back to the format GENE_test.

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/0a21ea24-b5dc-49f8-95ef-45c7593ecab4)

Genes will appear on the graphs in the order you place them here. If "All" then they are displayed in alphabetical order by default.

Once this section has run a new folder called "Heatmaps" will have appeared containing df_merge.csv, a dataframe of the compared genes and a plots folder containing INCOMPLETE, FILL IN HERE

INCOMPLETE : EXAMPLE GRAPHS ONCE WE HAVE CHOSEN ONES!

## Section F: Modifying the Tissue-and-Trait-Databases
The pipeline relies on two manually curated databases: full_tissue_database and full_trait_database. These are located in the original zip folder.

The original tissue data was downloaded from GTEx: https://gtexportal.org/home/tissue/. The original trait data was downloaded from ieugwasr::gwasinfo(). These extensive databases of Tissues and Traits have already been manually grouped into Tissue Groups and Trait Groups. However, these groupings can be further modified and regrouped according to your own preferences, by altering the group column in the **FILE**. The output plots will automatically adjust to match your edits, as long as you do not change the column names.

A summary plot of each Trait group and the number of traits in each group is displayed below.

![Traits in trait database](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7529ff3c-ef30-44d4-b842-5695a9debf21)

##  Section F: Using the main R Notebook to modify the code
There are a lot of instructions within the pipeline document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline if you're interested! 

##  Section G: Alternate instructions and advanced usage cases
ieugwas token alt setup if the one above doesn't work:
c. Open your .Renviron file by typing "file.edit("~/.Renviron")" into the console 

d. Copy and paste your ieugwas token into the following: "OPENGWAS_JWT="\<token\>" (i.e., replacing the "\<token\>" with your own token") and save (Ctrl-S or Cmd-S) (see screenshot below)

e. Restart your R session (close RStudio and reopen again)

