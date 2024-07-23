library(tidyverse)
#ieugwasr::gwasinfo()
ieu_token="eyJhbGciOiJSUzI1NiIsImtpZCI6ImFwaS1qd3QiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJhcGkub3Blbmd3YXMuaW8iLCJhdWQiOiJhcGkub3Blbmd3YXMuaW8iLCJzdWIiOiJoYXJyeS55b3VuZ0BicmlzdG9sLmFjLnVrIiwiaWF0IjoxNzIwNDQxNDM4LCJleHAiOjE3MjE2NTEwMzh9.wWtI9tCuFzPpQllCQmZqGnWfulfJdPulZbMuv0pcmKQmnaWpZf6kZAY_GmvdLYycRnMoMTSeWqpl1PfE3pPfc4PpIOGXcW5RnFcsfPd_tfov2JMS3ElqzAwtYrSldDNt6h0C6EOA0YBuYIL69goAtxtfW4Nn1h2zTRbUpYNjjaA0H61IXi0Y1Fu_05_gPNNGQ3x8BPg5la1Z2AqUQnSn-ma50dK6w7e9sF6VRL34RD6QA1jGdkLPXhYLCJYts0gNB-Df3_IxzqAvkdCpoHktsIw6KZoyRgZzkkswf7lPLvtuu2AEs1iAyrsqv8ywCCVmfk9mkY29y07rn2jwBYUJoQ"
new_database = ieugwasr::gwasinfo(opengwas_jwt = ieu_token)
new_database =new_database[2]
backup = new_database
new_database = full_join(Full_trait_database, backup)
new_database=unique(new_database)
write_csv(new_database, "~/Local work folder/RA_2024/Full_trait_database_NEWJul24.csv")


new_database = read.csv("~/Local work folder/RA_2024/Full_trait_database_EDITED.csv")
new_database=unique(new_database)
test = read.csv("/Users/hy14913/Documents/Local_work_folder/JUL_TEST/Trait and Tissue Groups/Full_trait_database.csv")

setdiff(new_database,test)





# if(n==1){
#   print("First dataframe")
#   Gtex_PHEWAS = phewas(test, pval = 1e-04) # Adjustable p-value here #
#   if(length(Gtex_PHEWAS)==12){
#     completed_snps = test
#   }else{
#     test = na.omit(unique_Gtex_snps[(((n+1-1)*15)+1):((n+1)*15)])
#     print("First query ")
#     Gtex_PHEWAS = phewas(test, pval = 1e-04) # Adjustable p-value here #
#     }
# }
# 

