# Tissue-and-Trait-Databases
Database of Tissues and Traits and their groupings

This simple repository is a way of storing the tissue and trait databases I built whilst designing the pipeline (add git link here).
These are free to download to your file system or can be accessed via github (coded within the pipeline - INCOMPLETE March21)

# Using the main R Notebook
There are a lot of instructions within the document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline. That being said I understand a lot of you just want to shove a gene in and not think about it to much.

So here is my quick start guide:
## Set up the filing system:
ONCE ONLY!
1. In your computer setup a master folder for use as a working folder. For example mine would be C:/Harry Young/local work folder
2. Open the folder_setup_MOD.R file in RStudio,
3. Change the gene_names list to include as many of the genes as you want to run as you like. If you're unsure just put a couple of dummy names in you can decide later as this is only setting up the folders!
4. Change where you're going to create the file directory. Use ctrl+f and type in the left-hand box "DRIVE/YOUR FILE DIRECTORY" and then put whatever your fodler is called. E.g. C:/Harry Young/local work folder in the right-hand box. NOTE: If you are on Mac this is slightly different. It will almost always be: "/UserYOUR FILE DIRECTORY", for example mine is : "/User/Harry/Local Work Folder"
6. Now simply press the button to the right of "Replace" labelled "All". Screenshots 1-3.
7. Now press run on this file (top right corner)
8. Download and save the tissue and trait database files and save within your Trait and Tissue Groups folder
9. Download and Save the sample-egene_info_Gtex.csv into the eGene folder

![Screenshot 2021-06-11 at 14 54 52](https://user-images.githubusercontent.com/66262215/121697916-6d891300-cac5-11eb-88ae-0f9cef521ed8.png)
![Screenshot 2021-06-11 at 14 56 02](https://user-images.githubusercontent.com/66262215/121697934-70840380-cac5-11eb-942a-c2025defaa1f.png)
![Screenshot 2021-06-11 at 14 56 21](https://user-images.githubusercontent.com/66262215/121697926-6f52d680-cac5-11eb-916b-ad402a7d7fa7.png)




## Downloading the key data that can't be automatically downloaded
REPEATED PER GENE FROM YOUR GENE LIST
Annoying there are some bits I just can't automate. I've attached a video and screenshots of the exact steps for these instructions but just to have it in words for completeness:
1. Go to the Gtex website: https://www.gtexportal.org/home/ 
2. Use the search bar in the top right to search your gene name.
3. Click on the correct gene in the resultant table (screenshot 2)
4. Download the graph of expression (optional -screenshot 3)
5. Download the csv of single-tissue eQTLs (screenshot 4)
6. Click the ensembl link from the first table (screenshot 5)
7. Click the  transcript ID (screenshot 6)
8. Click the "x" exons link (screenshot 7)
9. Click the "Download what you see" button (screenshot 8)
10. Repeat steps 7-9 until all transcripts are downloaded.
11. Copy and paste the Gtex Portal.csv and the gene-exp-plot.svg into the gtex folder and ALL transcript files into Ensembl/All_Exon_Options.

WHILE THE NEXT STEP IS RUNNING I PREP THE NEXT GENE


## Getting started with putting your first gene in the pipeline
REPEATED PER GENE FROM YOUR GENE LIST
1. Open up the Shortened_Instructions.Rmd document in RStudio.
2. Do the same find and replace steps as before:  Use ctrl+f and type in the left-hand box "DRIVE/YOUR FILE DIRECTORY" and then put whatever your folder is called. E.g. C:/Harry Young/local work folder in the right-hand box.
3. Next use the find and replace system to find all YOURGENE and replace with your gene name e.g. "NRF2" - again ctrl+f, left-hand box: YOURGENE, right-hand box: NRF2(whatever your gene name is), press the "All" button right of Replace.
5. Now run all using the "run" dropdown... run all in the top right, or ctrl+alt+enter


