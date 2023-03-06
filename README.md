# Getting an LD-Link token
This program uses the LDlink web server which requires a unique token to run. THis is easily obtained by following this link: https://ldlink.nci.nih.gov/?tab=apiaccess 



# Quick start guide:

1. Download the zip file from github and save within your chosen file directory. 
2. Extract the files. This will contain the main pipeline, tissue and trait databases and shiny app
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



# Old - to be deleted
6. You will be redirected to gnomad. Click download csv and save within the gnomad directory in the file system (your_directory/gene_name_test/gnomad) ![Screenshot 2022-10-05 at 15 53 01](https://user-images.githubusercontent.com/66262215/194092004-bc811af5-d52a-42a2-b4c5-ee53f0598ad5.png)
7. Go back to RStudio and run all again 

