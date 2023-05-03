# Getting an LD-Link token
This program uses the LDlink web server which requires a unique token to run. THis is easily obtained by following this link: https://ldlink.nci.nih.gov/?tab=apiaccess 



# Quick start guide:

1. Download the zip file from github and save within your chosen file directory. 
2. Extract the files. This will contain the main pipeline, tissue and trait databases and shiny app. These should be moved into the main folder and zip file deleted. Looking like this: ![image](https://user-images.githubusercontent.com/66262215/235876391-cab32c9f-ec77-4edb-9f3c-5fef0dbb4d3a.png)
3. Open final_pipeline.Rmd
4. In the top "chunk" you'll see gene_name, file_directory and LD_Token. Fill these out with your versions. There are also instructions within the file to help you.
5. in the top right of the window click run all: ![Screenshot 2022-10-05 at 15 49 52](https://user-images.githubusercontent.com/66262215/194095244-452d5831-41b8-4b1d-92ba-78df2f72be98.png)

6. Be patient! It should take around 20-30 mins to run.

## Important notes
This pipeline uses three servers, ieugwasr, LDlink and ensembl. All of these have a timeout if it takes too long to run. The pipeline will stop running and an error message will pop up in the console (bottom left box). If this happens please try again later, evenings are often less busy. If it keeps erroring let me know and I'll help as much as I can!

The pipeline will automatically open a shiny app of the data. All the plots shown can be found as pdfs in the Final_plots and Cricos folders if you'd prefer. 

Once the pipeline has been run it'll save the data in the final_data fodler and this can be used to reopen the shiny app to save you rerunning the pipeline every time! (more instructions / shiny support here)

The main error this pipeline has is installing and updating the packages needed. Often this is made complicated if being run on an IT administered system because it is reading and writing RStudio System files. This is in no way dangerous. Everything being downloaded and installed are from verified and incredibly well-used sources. So if you run into trouble on a work computer. Consider asking for temporary admin rights or running on a home computer.

# Tissue-and-Trait-Databases
Database of Tissues and Traits and their groupings

This simple repository is a way of storing the tissue and trait databases I built whilst designing the pipeline (add git link here).
These are free to download to your file system

# Using the main R Notebooks
There are a lot of instructions within the document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline if you're interested!

# Guide to Plots
In all cases, Yellow = Positive, Purpe = Negative

A-RAW_GTEXTissueGROUP-rsid_count_OVERVIEW.pdf - Summary of SNPs that alter expression, grouped by the tissues quantified by GTEx, colour = direction of expression change

e0/e0REL - Number of SNP-Trait associations per trait category (trait group). color based on trait group. REL = normalised to the number of posible traits within the database. (Number of unique traits from SNP-Trait associations per trait group)/(Number of possible traits in each trait group from Full_trait_database.csv)

e1-3 - Above x axis, increased expression, Below x axis decreased expression, y axis: -log(p) (how certain we are that SNP is truly causing a change to this trait), color = direction of TRAIT change. i.e yellow = SNP increases trait, purple = SNP decreases trait

f1-2 - Proportional to the dataset so y axis is: (number of SNP-trait assocations within that category) / (total SNP-trait associations). f2- removed other and other gene expression change for clarity

Number_x_traitgroup... - Each of your top 5 traitgroups (excluding other gene expression change and other if they are in the top 5) split to see each individual SNP-trait association within the traitgroup

RegRegion_COUNT_G_P.pdf  - Where your SNPs are based on their regulatory region (auto assigned from ensembl) - I always find this super interesting because so far the vast majority are not found in traditional regulatory regions

# Old - to be deleted
6. You will be redirected to gnomad. Click download csv and save within the gnomad directory in the file system (your_directory/gene_name_test/gnomad) ![Screenshot 2022-10-05 at 15 53 01](https://user-images.githubusercontent.com/66262215/194092004-bc811af5-d52a-42a2-b4c5-ee53f0598ad5.png)
7. Go back to RStudio and run all again 

