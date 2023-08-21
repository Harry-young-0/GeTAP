library(shiny)
library(tidyverse)
library(plotly)
library(bslib)
library(circlize)

data_list = list(
  "A1 SNP Count per Tissue Group (Raw GTEx)" =A1SNPcountperTissuegroup,
  "A2 SNP Count per Tissue Group (after LD and PheWAS)" = A2SNPcountperTissuegroup,
  "A3 STA Count per Tissue Group" = A3STAcountperTissuegroup,
  "A4 Genomic Regions of these SNP-Trait Associations" = snpvsregion,
  "B r2 linear regression" = BCorrelation_tg,
  "B2 r2 linear regression, zoomed" = B2,
  "C SNP vs Number of Tissues Recorded by GTEx" =CPosition_count_OVERVIEW,
  "D SNP by Trait Group" =DSNP_by_traitgroup,
  "D2 SNP by Trait Group Relative to Full Database" =D2RELSNP_by_traitgroup,
  "E1 Number of STAs per Trait Group / Total number of STAs" =E1,
  "E2 E1 (without Other of Other Gene Expression Change)" = E2,
  "F1 Logp*Direction vs Trait Group" =F1pvalvstraitgroup,
  "F2 Logp*Direction vs Trait Group (No Other or Other Gene Expression Change)" = F2pvalvstraitgroupNO_O,
  "Genomic Diagram: SNPs Relative to Gene and Region (After LD and PheWAS)" =gene_structure_RED+theme(legend.position = "top"))
circos_choice =list("Position to Tissue Group" =test,
                      "Tissue Group to Trait Group" = test2,
                      "Position to Traitgroup" = test3)
grid_col_choice = list("Position to Tissue Group" =grid_col_tissue,
                       "Tissue Group to Trait Group" = grid_col_trait,
                       "Position to Traitgroup" = grid_col_trait)
Top5_choice = Top5_choice

ui = navbarPage(
  
  "Output",
  # Insert theme here
  tabPanel(
    title="Summary Plots",
    sidebarLayout(
      sidebarPanel(
        width=3,
        h1("Pick a Plot to look at"),
        shiny::selectInput(
          inputId = "dataset_choice",
          label = "Plot choice",
          choices =names(data_list)
          
        )
      ),
      mainPanel(
        tabPanel("Plot",plotOutput("my_plot",
                                   width=800, height=600))
        )
      )
    ),
  tabPanel(
    title="Circos",
    sidebarLayout(
      sidebarPanel(
        width=3,
        h1("Pick a Plot to look at"),
        shiny::selectInput(
          inputId = "dataset_circos_choice",
          label = "Plot choice",
          choices =names(circos_choice)
          
        )
      ),
      mainPanel(
        h1("Circos"),
        tabPanel("Circos Plot",
                 plotOutput("my_circos", width=800, height=800))
      )
    )
  ),
  tabPanel(
    title="Detailed STAs by Traitgroup",
    sidebarLayout(
      sidebarPanel(
        width=3,
        h1("Pick a Plot to look at"),
        shiny::selectInput(
          inputId = "data_Top5_choice",
          label = "Plot choice",
          choices = names(Top5_choice)
          
        )
      ),
      mainPanel(
        tabPanel("Plot",
                 plotOutput("By_traitgroup_plot", height=2000, width=600))
      )
    )
  ),
  )



# Server ####
server = function(input, output){
  rv =reactiveValues()
  rv_circos=reactiveValues()
  rv_top5 =reactiveValues()
  observe({
    rv$data_set = data_list %>% pluck(input$dataset_choice)
  })
  observe({
    rv_circos$circos_choice_by_user = circos_choice %>% pluck(input$dataset_circos_choice)
    rv_circos$grid_col_choice_by_user = grid_col_choice %>% pluck(input$dataset_circos_choice)
  })
  observe({
    rv_top5$Top5_choice_by_user = Top5_choice %>% pluck(input$data_Top5_choice)
  })
  
  output$my_plot = renderPlot({
    g = rv$data_set
    g
  })
  
  
  output$my_circos = renderPlot({
    
    circos.clear()
    circos.par( start.degree = -90 ) 
    chordDiagram(rv_circos$circos_choice_by_user, 
                 annotationTrackHeight = c(0.01, 0.01), 
                 annotationTrack = "grid",
                 big.gap =8,
                 #small.gap = 1,
                 column.col = rv_circos$grid_col_choice_by_user, # or col_mat
                 grid.col = rv_circos$grid_col_choice_by_user,
                 diffHeight = mm_h(1), 
                 # (length(unique(simple_LUT$tissue_group)))
                 preAllocateTracks = list(track.height = 0.4*max(strwidth(unlist(dimnames(rv_circos$circos_choice_by_user))))),
                 transparency = 0.5,
                 order = c(rownames(rv_circos$circos_choice_by_user), rev(colnames(rv_circos$circos_choice_by_user)))
    )
    circos.track(track.index = 1, panel.fun = function(x, y) {
      circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index, 
                  facing = "clockwise", niceFacing = TRUE, adj = c(0, 0.1), cex =0.7)
    }, bg.border = NA)
  })
  
  
  output$By_traitgroup_plot = renderPlot({
    g = rv_top5$Top5_choice_by_user
    g
  })
  
  
}

shinyApp(ui = ui, server = server)
