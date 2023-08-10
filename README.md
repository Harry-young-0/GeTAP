An overview of the various Sections on this page:

#### Section A: Pipeline Rationale 
#### Section B: Software and tokens required prior to running the pipeline
#### [Section C: Quick start guide](#e1)
#### Section D: Understanding the Pipeline Output Plots
#### Section E: Modifying the Tissue-and-Trait-Databases
#### Section F: Using the main R Notebook to modify the code

## Section A: Pipeline Rationale

The goal of this pipeline is to suggest novel Gene-Trait associations by integrating two independent and publicly available datasets: (i) SNP-gene expression data from the GTEx Project and (ii) SNP-trait data from the PheWAS database.

The basic rationale of the Pipeline is illustrated in **Schematic A**. Firstly, using the GTEx Portal (https://www.gtexportal.org/home/), SNPs are identified that are associated with a change in the expression of a specific gene of interest. These specific SNPs are then searched in the PheWAS database (ieugwas::phewas https://gwas.mrcieu.ac.uk/phewas/) to find traits potentially associated with these SNPs. **The pipeline thus suggests traits potentially associated with expression changes in your gene of interest.**

More detail about the different steps of the pipeline are illustrated in **Schematic B**.

IMPORTANT NOTE: Traits and tissues were manually grouped into Trait Groups and Tissue Groups. This information is stored in the full_trait_database and full_tissue_database csvs found in the zip file. These groupings will be updated with each new release of GTEx and PheWAS. The groupings can also be manually rearranged if new group allocations are required. Further explanation below in section [Tissue-and-Trait-Databases](#-Tissue-and-Trait-Databases).

![schematic_for_github](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/a165c6e8-2290-4691-9410-4ab40897080a)

## Section B: Software and tokens required prior to running the pipeline
### 1. LDlink token
This pipeline uses the LDlink web server, which requires a unique token to run. The token is easily obtained here: [https://ldlink.nih.gov/?tab=apiaccess](https://ldlink.nih.gov/?tab=apiaccess). This step needs to be completed only once and then that token will stay with you for life (it is linked to your email address).

The LDlink website is currently saying the URL is out of date (yellow warning box). Please ignore this.

### 2. Download and install R and RStudio

This step should be performed the first time the pipeline is run, but do allow updates whenever prompted. You can find the downloads at the following links:

R: https://www.stats.bris.ac.uk/R/ 

RStudio: https://posit.co/downloads/

Following installation, open RStudio. Then continue following the instructions below for "Quick start guide". NOTE: I am using a Mac but the pipeline will work identically for a Windows computer.

## Section C: Quick start guide

### 1. Create a file directory

This will be where the pipeline is saved and where the pipeline outputs all the data. Create a suitable folder to act as the file directory e.g. on your desktop. For example: 

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/2b254df0-a851-471f-9459-7d8661f70a1b)

### 2. Download the pipeline (and all associated databases)

This information is contained in a zip file that can be accessed from this github page (see arrows in image below). After download, save the zip file to your chosen file directory.

![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/4c692d03-41f3-4841-934c-9554b343be85)

### 3. Extract the pipeline files from the zip file

The zip file contains the main pipeline, tissue and trait database csvs, readme.md and shiny app. After unzipping, these files should be moved into the main (directory folder) file and the original zip file should be deleted. Your file directory should now look like this: 

![Screenshot 2023-06-23 at 11 12 54](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/912a0897-cedb-4925-9ea3-a2512b9bc28e)

### 4. Open the Pipeline in RStudio

We now need to open the final_pipeline.Rmd in RStudio. This can be achieved by either: Right-click>open with>Rstudio, or, File > Open File... in RStudio. When the pipeline is run for the first time, several packages will be installed automatically. You may get a warning banner appear like this: 
 
![image](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/93e14a1c-6432-4d92-a595-04173f542c45)

This issue will be resolved automatically later on, once you click “run all”. To resolve the issue at this stage, you can also click "install" on this banner (this is optional).

### 5. Setting up the pipeline with your LDlink token, file directory and specific gene name

In RStudio, scroll down the pipeline slightly and you will see 'gene_name', 'file_directory' and 'LD_Token' on lines 17, 21 and 27 respectively. These defaults should now be replaced with your own versions. These are the only changes you need to make - please don't change anything else in the code unless you are specifically trying to tweak the pipeline.
 
 **gene_name** - The name of the human gene to be investigated, in all capitals as it appears in GTEx. You can check your gene name here: https://gtexportal.org/home/ in the dedicated search box. e.g: "NFE2L2"
 
 **file_directory** - The path to your own file directory, e.g "C:/Harry/Documents/Example Directory"
 
 **LD_Token** - Your unique 12 character token from LDlink (obtained above) e.g: "abc1def2ghi3"

#### Before your edit the pipeline appears: 

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

Once the pipeline has successfully and completely run, the various outputs of the pipeline will automatically be saved in a dedicated folder ('GENE_test') within the main directory folder.

_ADD IMAGE HERE OF RSTUDIO or OUTPUT FOLDER WHEN RUN IS COMPLETE
_
The pipeline will also automatically open a Shiny App of the data. The Shiny App can be reopened at anytime, by specifcally running the Shiny App rerun chunk on lines 3204-3215 - the code in this chuck needs to be updated with GENE-NAME and File_directory - then click the 'play' symbol at the top right of the box. All of the plots displayed in the Shiny App will also be saved as pdfs in the 'GENE_test' folder. The Shiny App will display the Circos plots in a nicer format than the output pdfs saved in the Circos folder.

_ALSO ADD IMAGE OF SHINY APP THAT POPS UP_

### 8. Troubleshooting
This pipeline uses three servers: ieugwasr, LDlink and ensembl. All of these will time-out if the pipeline takes too long to run. If this happens, the pipeline will stop running and an error message will pop up in the console (bottom left box). If this happens please try running the pipeline again at a later time, evenings are often less busy. If the pipeline keeps erroring, please let me know and I'll help as much as I can!

The main errors experienced during running of the pipeline occur during installation and updating of the packages. This is often complicated if the pipeline is run on an IT administered system, because it is reading and writing RStudio System files. This is in no way dangerous. All files being downloaded and installed are from verified and incredibly well-used sources. So if you experience trouble using a work computer, consider asking for temporary admin rights.

## Section D: Understanding the Pipeline Output Plots

The output of the pipeline will be automatically saved in a 'GENE_test' folder, which contains the following subfolders:

  - **Circos** Circos style plots
  - **Ensembl**  Data from....
  - **Final_data**  Data from......
  - **Final_plots**  Output plots of pipeline (see below for details)
  - **Gene_diagram_output** showing.....
  - **Gtex**  showing.....
  - **LDMatrix**  showing.....
  - **GENE_GtextoPHEWAS_RAW.csv**  showing.....

The **'Circos'** folder contains the following plots:

The **'Ensembl'** folder contains the following plots:

The **'Final_data'** folder contains the following files:

- Initial PheWAS ouput before LD removal
- Final output after LD removal (including Ensembl predicted regulatory regions)
- final_workspace_for_shiny 

The **'Final_plots'** folder contains the following plots:

### Plot A1 = SNPs vs tissue groups
_Before LD - not as a proportion, but just total number of SNPs that affect gene expression._

Summary of SNPs that alter expression of your gene of interest and the direction of that change as quantified by GTEx, grouped by the tissue groups. Colour = direction of expression change, rsid = unique SNP identifier

Title and axis says proportion of SNP-trait associations per tissue? Proportion calculated how????

![A](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/e079bc31-c6da-4e23-8a15-34f62526e4ef)

### Plot A2 = SNPs vs tissue groups

_after run through pipeline - number of SNPs that are associated with a trait, after LD removal. First as a total number of SNPs, optional to have also as a proportion_

### Plot B = Correlation
Correlation of the number of different traits in a Trait Group relative to the total number of different possible traits in the full database. An indication of whether the results are due to chance. This considers repeated SNP-Trait associations. If 100 different SNPs are all associated with LDL, this is recorded as 100 SNP-Trait associations. 

![B](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/cccbbfa0-6c86-4aec-adab-8cf4d0570e70)

### Plot C
A summary of how many tissues each SNP alters gene expression in (from GTEx eQTLs). Importantly, this also shows cases where a SNP is associated with a decrease in expression in one tissue and an increase in another. Though rare, these could provide further complexity or insight when interpreting the SNP-Trait associations.

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/c4dd5090-87ef-4963-b2bc-1a522d8747c7" width="150" height="1000">

### Plot D
Number of SNP-Trait associations per Trait Group. Colour based on Trait Group. i.e. Regardless of direction of expression change, which Trait Groups are affected by SNPs that alter a gene of interests expression.

![D](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/04631737-3c4d-4379-b79d-a3e13b292af4)

Normalised Version - normalised to the number of possible traits within the database. (Number of different traits from SNP-Trait associations per Trait Group)/(Number of possible traits in each Trait Group from Full_trait_database.csv).

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

I've made a custom chunk at the end of the pipeline, line: 3256, to help out

<img src="https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/1cffc88b-adc8-4e72-b165-570c48bfbca5" width="400" height="750">

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

## Section E: Modifying the Tissue-and-Trait-Databases
The pipeline relies on two manually curated databases: full_tissue_database and full_trait_database. These are located in the original zip folder.

The original tissue data was downloaded from GTEx: https://gtexportal.org/home/tissue/. The original trait data was downloaded from ieugwasr::gwasinfo(). These extensive databases of Tissues and Traits have already been manually grouped into Tissue Groups and Trait Groups. However, these groupings can be further modified and regrouped according to your own preferences, by altering the group column in the **FILE**. The output plots will automatically adjust to match your edits, as long as you do not change the column names.

A summary plot of each Trait group and the number of traits in each group is displayed below.

![Traits in trait database](https://github.com/Hy14913/expression-trait_pipeline/assets/66262215/7529ff3c-ef30-44d4-b842-5695a9debf21)

##  Section F: Using the main R Notebook to modify the code
There are a lot of instructions within the pipeline document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline if you're interested! 

