# Tissue-and-Trait-Databases
Database of Tissues and Traits and their groupings

This simple repository is a way of storing the tissue and trait databases I built whilst designing the pipeline (add git link here).
These are free to download to your file system or can be accessed via github (coded within the pipeline - INCOMPLETE March21)

# Using the main R Notebooks
There are a lot of instructions within the document itself and you are more than welcome to go through running chunk by chunk to get used to how I've setup this pipeline. That being said I understand a lot of you just want to shove a gene in and not think about it to much.

So here is my quick start guide:
## Set up the filing system:
ONCE ONLY!
1. Open and run packages.R 
2. In your computer setup a master folder for use as a working folder. For example mine would be C:/Harry Young/local work folder
3. Open the folder_setup_FINAL.R file in RStudio,
4. Change the gene_names list to include as many of the genes as you want to run as you like. If you're unsure just put a couple of dummy names in you can decide later as this is only setting up the folders!
5. Change where you're going to create the file directory. Use ctrl+f and type in the left-hand box "DRIVE:/YOUR FILE DIRECTORY/" and then put whatever your fodler is called. E.g. C:/Harry Young/local work folder/ in the right-hand box. NOTE: If you are on Mac this is slightly different. It will almost always be: "/User/YOUR FILE DIRECTORY/", for example mine is : "/User/Harry/Local Work Folder/"
6. Now simply press the button to the right of "Replace" labelled "All". Screenshots 1-3.
7. Now press run on this file (top right corner)
8. Download and save the tissue and trait database files and save within your Trait and Tissue Groups folder
9. Download and Save the sample-egene_info_Gtex.csv into the eGene folder

![Screenshot 2021-06-11 at 14 54 52](https://user-images.githubusercontent.com/66262215/121697916-6d891300-cac5-11eb-88ae-0f9cef521ed8.png)
![Screenshot 2021-06-11 at 14 56 02](https://user-images.githubusercontent.com/66262215/121697934-70840380-cac5-11eb-942a-c2025defaa1f.png)
![Screenshot 2021-06-11 at 14 56 21](https://user-images.githubusercontent.com/66262215/121697926-6f52d680-cac5-11eb-916b-ad402a7d7fa7.png)




## Downloading the key data that can't be automatically downloaded
REPEATED PER GENE FROM YOUR GENE LIST
Annoying there are some bits I just can't automate. I've attached screenshots (ADD IN A VIDEO TOO?) of the exact steps for these instructions but just to have it in words for completeness:
1. Go to the Gtex website: https://www.gtexportal.org/home/ 
2. Use the search bar in the top right to search your gene name (screenshot 1).
3. Click on the correct gene in the resultant table (screenshot 2)
4. Download the graph of expression (optional)
5. Download the csv of single-tissue eQTLs (screenshot 3) and save as "Gtex_YOUR_GENE_NAME_START.csv" (e.g. Gtex_NRF2_START) in the Gtex folder
6. Click the ensembl link from the first table (screenshot 4)
7. Click the  transcript ID (screenshot 5)
8. Click the "x" exons link (screenshot 6)
9. Click the "Download what you see" button (screenshot 7)
10. Repeat steps 7-9 until all transcripts are downloaded.
11. Copy and paste the Gtex Portal.csv and the gene-exp-plot.svg into the gtex folder and ALL transcript files into DRIVE:/YOUR FILE DIRECTORY/YOUR_GENE_NAME/Ensembl/All_Exon_Options.

![Screenshot 2021-06-11 at 15 10 23](https://user-images.githubusercontent.com/66262215/121699983-5ba86f80-cac7-11eb-95f4-63c9cfcd477b.png)
![Screenshot 2021-06-11 at 15 10 55](https://user-images.githubusercontent.com/66262215/121699986-5cd99c80-cac7-11eb-8243-fc50f2f9c17a.png)
![Screenshot 2021-06-11 at 15 11 31](https://user-images.githubusercontent.com/66262215/121699998-5f3bf680-cac7-11eb-9519-5970ffa6d5df.png)
![Screenshot 2021-06-11 at 15 13 05](https://user-images.githubusercontent.com/66262215/121700246-9ca08400-cac7-11eb-996e-388f0ee70bb4.png)
![Screenshot 2021-06-11 at 15 14 21](https://user-images.githubusercontent.com/66262215/121700762-20f30700-cac8-11eb-9ad9-6f68b9765bc5.png)
![Screenshot 2021-06-11 at 15 15 28](https://user-images.githubusercontent.com/66262215/121700764-22243400-cac8-11eb-9be2-327172224f80.png)
![Screenshot 2021-06-11 at 15 17 06](https://user-images.githubusercontent.com/66262215/121700767-22243400-cac8-11eb-97f8-c3e4c50536cc.png)




WHILE THE NEXT STEP IS RUNNING I PREP THE NEXT GENE


## Getting started with putting your first gene in the pipeline
PRE-SETUP: Open up packages.R and run, this will install all the required packages into your Rstudio.


REPEAT PER GENE FROM YOUR GENE LIST, changing YOUR_GENE_NAME to the genes name each time
1. Open up the Shortened_Instructions_FINAL.Rmd document in RStudio.
2. Do the same find and replace steps as before:  Use ctrl+f and type in the left-hand box "DRIVE:/YOUR FILE DIRECTORY/" and then put whatever your folder is called. E.g. C:/Harry Young/local work folder/ in the right-hand box.
3. Next use the find and replace system to find all YOUR_GENE_NAME and replace with your gene name e.g. "NRF2" - again ctrl+f, left-hand box: YOUR_GENE_NAME, right-hand box: NRF2(whatever your gene name is), press the "All" button right of Replace.
5. Now run all using the "run" dropdown... run all in the top right, or ctrl+alt+enter (SCREENSHOT BELOW)
 
![Screenshot 2021-06-11 at 15 27 54](https://user-images.githubusercontent.com/66262215/121702318-acb96300-cac9-11eb-8996-3228b3aa950f.png)



