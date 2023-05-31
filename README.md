# Software and tokens required prior to running the pipeline for the first time
### LD-Link token
This program uses the LDlink web server which requires a unique token to run. This is easily obtained by following this link: [https://ldlink.nih.gov/?tab=apiaccess](https://ldlink.nih.gov/?tab=apiaccess). This only needs to be completed once and then that token will stay with you for life (linked to your email).

Currently saying the URL is out of date (yellow warning box). Ignore this.

### Download and install R and RStudio

First time only, update whenever prompted.

R: https://www.stats.bris.ac.uk/R/ 

RStudio: https://posit.co/downloads/

Open RStudio.
Then continue with the "Quick start guide". NOTE: I am using a mac but it will work identically for a windows computer.

# Quick start guide

### 1. Create a file directory

A folder on your desktop for example. This will be where the pipeline is saved and where the pipeline outputs all the data. For example: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/2b254df0-a851-471f-9459-7d8661f70a1b)

### 2. Download the zip file from github and save within your chosen file directory

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/4c692d03-41f3-4841-934c-9554b343be85)

### 3. Extract the files from the zip files

This will contain the main pipeline, tissue and trait database csvs, readme.md and shiny app. These should be moved into the main folder and zip file deleted. Your file directory should look like this: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/3b81aaa0-e885-4afa-a7c0-93659a86f136)
 
### 4. Open final_pipeline.Rmd in RStudio

(Right-click>open with>Rstudio OR File > Open File... in RStudio). In the first run, several packages will be installed automatically to allow the pipeline to run. You may get a warning banner appear like this: 
 
![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/93e14a1c-6432-4d92-a595-04173f542c45)

This issue will be resolved automatically later on once you click “run all”, but you can also click "install" on this banner if you wish.

### 5. Replace defaults with your gene name, token and file directory

Scroll down slightly and you will see gene_name, file_directory and LD_Token on lines 17, 21 and 27 respectively. Replace with your versions.
 
 **gene_name** - The name of your human gene or human homolgue of your gene in all capitals as it appears in GTEx - you can check here: https://gtexportal.org/home/ - top right search box. e.g: "NFE2L2"
 
 **file_directory** - Path to your file directory, e.g "C:/Harry/Documents/Example Directory"
 
 **LD_Token** - Your unique 12 character token from LDlink (see above) e.g: "abc1def2ghi3"

### Before your edit: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7af50e7d-0487-4ae5-90cf-d76da18fa22c)

### After your edit: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/b679c9db-3ef3-4bf9-a2e2-b0ec92a61cb9)

### Please check these common errors: (If it still errors please email me the error and your modified final_pipeline.rmd file): 

a. Make sure each of these changes are within speech marks. e.g: gene_name = "NFE2L2" not gene_name = NFE2L2

b. Make sure your gene name is as it appears in GTEx (check using https://gtexportal.org/home/ - top right search box).

c. Make sure your file_directory has "/" not "\". e.g: file_directory = "C:/Documents/Example directory" not file_directory = "C:\Documents\Example directory" - This is the default for Windows so is a very common problem.

### 6. In the top right of the window click run all: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/5dfffe8f-c975-452d-a7fd-a82d2761b791)

### 7. Be patient! It should take around 20-30 mins to run.

# Pipeline Output Example
The pipeline will automatically open a shiny app of the data. All the plots shown can also be found as pdfs in the Final_plots and Circos folders. Also, the Shiny app can be reopened anytime by using the shiny app rerun chunk on lines 3204-3215 (click the play symbol top right of the box). This will include the circos plots that display more nicely in that format than they do as the output pdfs in the circos subfolder.

The goal of the pipeline is to suggest novel Gene-Trait associations by using SNPs that are associated with a change in expression of a gene of interest via GTEx. 

Below are two schematics providing an overview to the whole process. In Schematic A, the basic rationale of the pipeline is shown. Briefly, SNPs associated with a change in expression of a gene of interest are firstly collected from GTEx, and then searched in the PheWAS database (ieugwas::phewas) to find traits potentially associated with these SNPs. The pipeline output thus suggests traits potentially associated with expression changes in your gene of interest. In Schematic B, more detail is included about the different steps of the pipeline.

NOTE: Traits and tissues were manually grouped into Trait Groups and Tissue Groups and stored in the full_trait_database and full_tissue_database csvs in the zip file. These will be updated with each new release of GTEx and PheWAS but are also modifiable if you would like to regroup for something specific. Further explanation below in section [Tissue-and-Trait-Databases](#-Tissue-and-Trait-Databases).

![schematic_for_github](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/a165c6e8-2290-4691-9410-4ab40897080a)

## Example Output Plots
### Plot A
Summary of SNPs that alter expression of your gene of interest and the direction of that change as quantified by GTEx, grouped by the tissue groups. Colour = direction of expression change, rsid = unique SNP identifier

![A](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/e079bc31-c6da-4e23-8a15-34f62526e4ef)

### Plot B
Correlation of the number of different traits in a Trait Group relative to the total number of different possible traits in the full database. An indication of whether the results are due to chance. This considers repeated SNP-Trait associations. If 100 different SNPs are all associated with LDL, this is recorded as 100 SNP-Trait associations. 

![B](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/cccbbfa0-6c86-4aec-adab-8cf4d0570e70)

### Plot C
A summary of how many tissues each SNP alters gene expression in (from GTEx eQTLs). Importantly, this also shows cases where a SNP is associated with a decrease in expression in one tissue and an increase in another. Though rare, these could provide further complexity or insight when interpreting the SNP-Trait associations.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c4dd5090-87ef-4963-b2bc-1a522d8747c7" width="150" height="1000">

### Plot D
Number of SNP-Trait associations per Trait Group. Colour based on Trait Group. i.e. Regardless of direction of expression change, which Trait Groups are affected by SNPs that alter a gene of interests expression.

![D](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/04631737-3c4d-4379-b79d-a3e13b292af4)

Normalised Version - normalised to the number of posible traits within the database. (Number of different traits from SNP-Trait associations per Trait Group)/(Number of possible traits in each Trait Group from Full_trait_database.csv).

![D2](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/84020a7d-512c-4942-96f3-eaee0b21d67f)

### Plots E1-E4
These plots are grouped together to summarise the SNP-Trait assocations as part of their respective Trait Groups whilst considering p-value, expression change and beta change (the direction of change of a trait).

**Key**: Above x-axis, increased expression, Below x axis decreased expression, y axis: -log(p(trait change)) x direction of expression change , colour = direction of trait change. i.e. Yellow = SNP increases trait, Purple = SNP decreases trait.

### E1 
Individual SNP-trait associations grouped by Trait Group. 

![E1](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c0bc1a0a-55dd-47e5-9b40-48dea82ae38b)

### E2 
Modified version of E1 without Other Gene Expression Change or Other categories because these are often very big and so can obscure the other results. "Other Gene Expression Change" is a Trait Group where every trait is another gene ID with altered expression, often according to GTEx data. "Other" consists of traits I could not categorise easily. For example, "geographical location: North". Though both of these categories may be important, they are often large and so are removed for clarity here.

![E2](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c4fef5ab-7fff-40ab-b866-415b573ac29e)

### E3
Expanding just the Other Gene Expression Change category to look at the individual traits (in this case genes) your gene of interest/your SNPs effect.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7cd0514d-c796-4aa3-9dfb-93bad8ed7c93" width="450" height="800">

### E4
Expanding all the Trait Groups (excluding Other Gene Expression Change and Other) to see individual traits within the categories. In this case displaying just one example. NOTE: these can often be very big, if the plot is unreadable, hopefully you can find and fix it within the code but if not please email me and I'll be happy to modify it for you.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/8dede27f-da50-43f0-87b4-361fd0c4b61e" width="700" height="600">

### Plots F1-2
These graphs offer an alternate way of visualising the plots in E. Here we ignore p-value and display the number of SNP-trait associations within each Trait Group. The number in each group is then normalised to the total number of SNPs across all Trait Groups. This will also allow direct comparison between different genes run throught he pipeline as it normalises for a different number of SNP-Trait associations between genes. **Key**: y-axis: (number of SNP-Trait assocations within that category) / (total SNP-trait associations). Colour = direction of trait change. Below x-axis, SNPs that decrease the gene of interests expression. Above x-axis, SNPs that increase the gene of interests expression

### F1 
E1 but normalised to the total dataset as described above.

![F1](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/5cc5f83b-5ad4-4b74-9171-7bbc549b1442)

### F2
Modified version of F1 without "Other" and "Other Gene Expression Change" for clarity (see E2 for explanation).

![F2](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/ce0b2298-199e-4598-b68f-347d4e58c7dd)

### Plot G
How many of your SNPs are based in regulatory regions (auto assigned from ensembl).

![G](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/1c9444a0-7683-4bd2-9dff-51f0bfde26a8)

### Plot H
Circos plot displaying the overlap of Tissue Groups where the SNPs were found compared to the Trait Groups their associated traits are in. 

![Circos](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/fc2dbdea-f5f6-4767-90e3-30fdfef71ddf)

## Troubleshooting
This pipeline uses three servers, ieugwasr, LDlink and ensembl. All of these have a timeout if it takes too long to run. The pipeline will stop running and an error message will pop up in the console (bottom left box). If this happens please try again later, evenings are often less busy. If it keeps erroring let me know and I'll help as much as I can!

The main error this pipeline has is installing and updating the packages needed. Often this is made complicated if being run on an IT administered system because it is reading and writing RStudio System files. This is in no way dangerous. Everything being downloaded and installed are from verified and incredibly well-used sources. So if you run into trouble on a work computer. Consider asking for temporary admin rights or running on a home computer.

# Tissue-and-Trait-Databases
In the zip folder download there are two databases, full_tissue_database and full_trait_database. 

These are databases of Tissues and Traits manually grouped into Tissue Groups and Trait Groups. Originally tissue data was downloaded from GTEx: https://gtexportal.org/home/tissue/. Trait data from ieugwasr::gwasinfo().

Though exhaustive they can be modified to your own groupings by altering the group column. The plots will autmatically adjust to your edits as long as you do not change the column names.

A summary plot of each Trait group and the number of traits in each is displayed below.

![Traits in trait database](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7529ff3c-ef30-44d4-b842-5695a9debf21)

# Using the main R Notebook to modify the code
There are a lot of instructions within the document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline if you're interested! 

