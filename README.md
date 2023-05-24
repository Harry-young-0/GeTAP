# Requirements before running for the first time:
### LD-Link token
This program uses the LDlink web server which requires a unique token to run. This is easily obtained by following this link: [https://ldlink.nci.nih.gov/?tab=apiaccess](https://ldlink.nih.gov/?tab=apiaccess) 

### Download and install R and RStudio:

R: https://www.stats.bris.ac.uk/R/ 

RStudio: https://posit.co/downloads/

Open RStudio.
Then continue with the "Quick start guide". NOTE: I am using a mac but it will work identically for a windows computer.

## Quick start guide:

1. Create a file directory – a folder on your desktop for example. This will be where the pipeline is saved and where the pipeline outputs all the data. For example: ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/2b254df0-a851-471f-9459-7d8661f70a1b)

2. Download the zip file from github and save within your chosen file directory. ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/02ac8751-b3de-4f32-ad89-02a36cb5b177)

3. Extract the files. This will contain the main pipeline, tissue and trait database csvs, readme.md and shiny app. These should be moved into the main folder and zip file deleted. Your file directory should look like this: ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/3b81aaa0-e885-4afa-a7c0-93659a86f136)
 
4. Open final_pipeline.Rmd in RStudio. (R-click>open with>Rstudio OR File > Open File... in RStudio). In the first run, several packages will be installed automatically to allow the pipeline to run. You may get a warning banner appear like this: ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/93e14a1c-6432-4d92-a595-04173f542c45)

This will be resolved automatically once you click run all but you can also click "install" on this banner if you wish. It makes no difference

5. Scroll down slightly and you will see gene_name, file_directory and LD_Token on lines 17, 21 and 27 respectively. Fill these out with your versions where:
 
 **gene_name** - The name of your human gene or human homolgue of your gene in all capitals as it appears in GTEx - you can check here: https://gtexportal.org/home/ - top right search box. e.g:
 
 **file_directory** - Path to your file directory, e.g C:/Harry/Documents/Example Directory
 
 **LD_Token** - Your unique 12 character token from LDlink (see above)

Before: ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7af50e7d-0487-4ae5-90cf-d76da18fa22c)
After: ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/b679c9db-3ef3-4bf9-a2e2-b0ec92a61cb9)
Please check these most common errors: (If it still errors please email me the error and your modified final_pipeline.rmd file): 

a. Make sure each of these changes are within speech marks. e.g: gene_name = "NFE2L2" not gene_name = NFE2L2

b. Make sure your gene name is as it appears in GTEx (check using https://gtexportal.org/home/ - top right search box).

c. Make sure your file_directory has "/" not "\". e.g: file_directory = "C:/Documents/Example directory" not file_directory = "C:\Documents\Example directory"

6. in the top right of the window click run all: ![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/5dfffe8f-c975-452d-a7fd-a82d2761b791)

7. Be patient! It should take around 20-30 mins to run.

# Output example
The point of the pipeline is to produce novel Gene-Trait associations by using SNPs that are associated with a change in expression of a gene of interest via GTEx. Here are two schamtics providing basic overview to the process:
![Graphical abstract only alt_whitebackground](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/524efa1a-b157-4e9d-97ac-829e46ef9934)
![pipeline overview v2-fig1](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/9f1aabde-8ad3-4b40-8067-8ccfab25f63d)

A - Summary of SNPs that alter expression of your gene of interest and the direction of that change, grouped by the tissue groups quantified by GTEx, colour = direction of expression change

[TissueGROUP-rsid_count_OVERVIEW.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555371/TissueGROUP-rsid_count_OVERVIEW.pdf)

B - Correlation of the number of unique traits in a Trait Group relative to the total number of possible traits in the full database. An indication of whether the results are due to chance.

[TG_dfcount_cor_leg.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555382/TG_dfcount_cor_leg.pdf)


C - number_of_tissues_each_SNP_affects_expression_in A summary of how many tissues the SNPs alter gene expression in (from GTEx eQTLs).

[d1-Position_count_OVERVIEW.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555386/d1-Position_count_OVERVIEW.pdf)


D - Number of SNP-Trait associations per trait group. color based on trait group. 

[e0-ntraitgroup_associations.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555388/e0-ntraitgroup_associations.pdf)

Normalised Version - normalised to the number of posible traits within the database. (Number of unique traits from SNP-Trait associations per trait group)/(Number of possible traits in each trait group from Full_trait_database.csv)

[e0-RELntraitgroup_associations.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555390/e0-RELntraitgroup_associations.pdf)

E - Above x axis, increased expression, Below x axis decreased expression, y axis: -log(p(trait change)) , color = direction of TRAIT change. i.e yellow = SNP increases trait, purple = SNP decreases trait


E1 - All Trait Groups with SNP-Trait associations in. 

[e1pvalvstraitgroup.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555394/e1pvalvstraitgroup.pdf)
E2 - E1 without Other Gene Expression Change or Other categories. These are often very big and so can obscure the other results.

[e2-e1_no_Other_or_OGEC_LEGEND.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555396/e2-e1_no_Other_or_OGEC_LEGEND.pdf)


E3 - Expanding just the Other Gene Expression Change category to look at the individual traits (in this case genes) your gene of interest/your SNPs effect.

[e3-e1_OGEC_only.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555405/e3-e1_OGEC_only.pdf)

E4 - Expanding the top 5 traitgroups (excluding Other Gene Expression Change and Other) to see individual traits within the categories. NOTE: these can often be very big, if the plot outright breaks hopefully you can find and fix it within the code but if not please email me and I'll be happy to modify it for you.

F1-2 - E1, normalised to the dataset, y axis: (number of SNP-Trait assocations within that category) / (total SNP-trait associations). 

F1 - E1, normalised to the dataset

[f1COUNTvstraitgroup_REL_overview_SEATLE_all.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555425/f1COUNTvstraitgroup_REL_overview_SEATLE_all.pdf)

F2 - F1 without other and other gene expression change for clarity (see above)

[f2-f1_no_OGEC.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555426/f2-f1_no_OGEC.pdf)

G - How many of your SNPs are based in regulatory regions (auto assigned from ensembl) - I always find this super interesting because so far the vast majority are not found in traditional regulatory regions

[RegRegion_COUNT_G_P.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555433/RegRegion_COUNT_G_P.pdf)

H - Circos displaying the overlap of Tissue Groups where teh SNPs were found compared to the Trait Groups their associated traits are in: 

[Tissue_trait_overlap.pdf](https://github.com/Hy14913/expression-trait_pipeline/files/11555455/Tissue_trait_overlap.pdf)

The pipeline will automatically open a shiny app of the data. All the plots shown can be found as pdfs in the Final_plots and Cricos folders if you'd prefer. Also, the Shiny app can be reopened anytime by using the shiny app rerun chunk on lines 3219-3230 (click the play symbol top right of the box). This will include the circos plots that display more nicely in that format than they do as the output pdfs in the circos subfolder

Circos

## Troubleshooting
This pipeline uses three servers, ieugwasr, LDlink and ensembl. All of these have a timeout if it takes too long to run. The pipeline will stop running and an error message will pop up in the console (bottom left box). If this happens please try again later, evenings are often less busy. If it keeps erroring let me know and I'll help as much as I can!

The main error this pipeline has is installing and updating the packages needed. Often this is made complicated if being run on an IT administered system because it is reading and writing RStudio System files. This is in no way dangerous. Everything being downloaded and installed are from verified and incredibly well-used sources. So if you run into trouble on a work computer. Consider asking for temporary admin rights or running on a home computer.

# Tissue-and-Trait-Databases
In the zip folder download there are two databases, full_tissue_database and full_trait_database. 

These are databases of Tissues and Traits manually grouped into Tissue Groups and Trait Groups.

Though exhaustive they can be modified to your own groupings by altering the group column. The plots will autmatically adjust to your edits as long as you do not change the column names.

# Using the main R Notebooks
There are a lot of instructions within the document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline if you're interested!

# Guide to Plots TO BE REMOVED
In all cases, Yellow = Positive, Purple = Negative
List of key plots, Letters to match code
(B) number_of_SNP-trait_associations_per_tissue_group 
(C) correlation_of_traits_to_total_possible_traits
(D) number_of_tissues_each_SNP_affects_expression_in
(E0) e0-number_of_SNP-trait_associations_per_traitgroup and e0-normalised (raw and normalised respectively)
(E1) e1--logp_x_expression_change_per_traitgroup
(E2) e2-e1_no_Other_or_OGEC
(E3) e3-e1-Other Gene Expression Change only
(E4) e4-Number_x_Traitgroup 
(F1) f1-nSNP-trait_associations_per_traitgroup_by_total
(F2) f2-f1_no_OGEC
(G) number_of_snps_per_regulatory_region

B - Summary of SNPs that alter expression of your gene of interest and the direction of that change, grouped by the tissue groups quantified by GTEx, colour = direction of expression change
C - Correlation of the number of unique traits in a Trait Group relative to the total number of possible traits in the full database. An indication of whether the results are due to chance.
D - number_of_tissues_each_SNP_affects_expression_in A summary of how many tissues the SNPs alter gene expression in (from GTEx eQTLs).
E0 - Number of SNP-Trait associations per trait group. color based on trait group. e0-normalised - normalised to the number of posible traits within the database. (Number of unique traits from SNP-Trait associations per trait group)/(Number of possible traits in each trait group from Full_trait_database.csv)

E1-3 - Above x axis, increased expression, Below x axis decreased expression, y axis: -log(p(trait change)) , color = direction of TRAIT change. i.e yellow = SNP increases trait, purple = SNP decreases trait

E1 - All Trait Groups with SNP-Trait associations in. 
E2 - E1 without Other Gene Expression Change or Other categories. These are often very big and so can obscure the other results.
E3 - Expanding just the Other Gene Expression Change category to look at the individual traits (in this case genes) your gene of interest/your SNPs effect.
E4 - Expanding the top 5 traitgroups (excluding Other Gene Expression Change and Other) to see individual traits within the categories. NOTE: these can often be very big, if the plot outright breaks hopefully you can find and fix it within the code but if not please email me and I'll be happy to modify it for you.

F1-2 - E1, normalised to the dataset, y axis: (number of SNP-Trait assocations within that category) / (total SNP-trait associations). 

F1 - E1, normalised to the dataset
F2 - F1 without other and other gene expression change for clarity (see above)
G - How many of your SNPs are based in regulatory regions (auto assigned from ensembl) - I always find this super interesting because so far the vast majority are not found in traditional regulatory regions
 

# Old - to be deleted
6. You will be redirected to gnomad. Click download csv and save within the gnomad directory in the file system (your_directory/gene_name_test/gnomad) ![Screenshot 2022-10-05 at 15 53 01](https://user-images.githubusercontent.com/66262215/194092004-bc811af5-d52a-42a2-b4c5-ee53f0598ad5.png)
7. Go back to RStudio and run all again 

