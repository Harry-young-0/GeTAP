# Getting an LD-Link token
This program uses the LDlink web server which requires a unique token to run. THis is easily obtained by following this link: https://ldlink.nci.nih.gov/?tab=apiaccess 



# Quick start guide:
Download and install R and Rstudio:
R: https://www.stats.bris.ac.uk/R/ 
Rstudio: https://posit.co/downloads/
Then continue with the instructions
1. Download the zip file from github and save within your chosen file directory. 
2. Extract the files. This will contain the main pipeline, tissue and trait databases, readme.md and shiny app. These should be moved into the main folder and zip file deleted. So your folder that you want to be your file directory should look like this:<img width="918" alt="image" src="https://user-images.githubusercontent.com/66262215/236016871-663d8e18-b0c9-4542-8726-3864385cc08e.png">
3. Open final_pipeline.Rmd
4. In the top "chunk" you'll see gene_name, file_directory and LD_Token. Fill these out with your versions. There are also instructions within the file to help you.
5. in the top right of the window click run all: ![Screenshot 2022-10-05 at 15 49 52](https://user-images.githubusercontent.com/66262215/194095244-452d5831-41b8-4b1d-92ba-78df2f72be98.png)

6. Be patient! It should take around 20-30 mins to run.

## Important notes
This pipeline uses three servers, ieugwasr, LDlink and ensembl. All of these have a timeout if it takes too long to run. The pipeline will stop running and an error message will pop up in the console (bottom left box). If this happens please try again later, evenings are often less busy. If it keeps erroring let me know and I'll help as much as I can!

The pipeline will automatically open a shiny app of the data. All the plots shown can be found as pdfs in the Final_plots and Cricos folders if you'd prefer. Also, the Shiny app can be reopened anytime by using the shiny app rerun chunk on line 3448 (click the play symbol) Or by opening dedicated R file, within your main folder. 

Once the pipeline has been run it'll save the data in the final_data fodler and this can be used to reopen the shiny app to save you rerunning the pipeline every time! (more instructions / shiny support here)

The main error this pipeline has is installing and updating the packages needed. Often this is made complicated if being run on an IT administered system because it is reading and writing RStudio System files. This is in no way dangerous. Everything being downloaded and installed are from verified and incredibly well-used sources. So if you run into trouble on a work computer. Consider asking for temporary admin rights or running on a home computer.

# Tissue-and-Trait-Databases
Database of Tissues and Traits and their groupings

This simple repository is a way of storing the tissue and trait databases I built whilst designing the pipeline (add git link here).
These are free to download to your file system

# Using the main R Notebooks
There are a lot of instructions within the document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline if you're interested!

# Guide to Plots
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

