
data_list = list(
  "SNP Count per Tissue Group" =SNPcountperTissuegroup,
  "SNP by Trait Group" =SNP_by_traitgroupe0,
  "Logp*Direction x traitgroup" =pvalvstraitgroupe1,
  "Logp*Direction x traitgroup (No Other or Other gene Expression Change)" = pvalvstraitgroupNO_O_e2_leg,
  "Genomic Regions of these SNP-Trait Associations"=snpvsregion,
  "Genomic Diagram: SNPs Relative to Gene and Region" =gene_structure_RED+theme(legend.position = "top"))
circos_choice =list("Position to Tissue Group" =test,
                      "Tissue Group to Trait Group" = test2,
                      "Position to Traitgroup" = test3)
grid_col_choice = list("Position to Tissue Group" =grid_col_tissue,
                       "Tissue Group to Trait Group" = grid_col_trait,
                       "Position to Traitgroup" = grid_col_trait)
Top5_choice = list("Number 1 Trait Group" =e4_1,
                   "Number 2 Trait Group" =e4_2,
                   "Number 3 Trait Group" =e4_3,
                   "Number 4 Trait Group" =e4_4,
                   "Number 5 Trait Group" =e4_5,
                   "Other Gene Expression Change" = OGECe3)

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
          choices =c("SNP Count per Tissue Group",
                     "SNP by Trait Group",
                     "Logp*Direction x traitgroup",
                     "Logp*Direction x traitgroup (No Other or Other gene Expression Change)",
                     "Genomic Regions of these SNP-Trait Associations",
                     "Genomic Diagram: SNPs Relative to Gene and Region")
          
        )
      ),
      mainPanel(
        tabPanel("Plot",plotOutput("my_plot", width=700, height=500))
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
          choices =c("Position to Tissue Group",
                     "Tissue Group to Trait Group",
                     "Position to Traitgroup")
          
        )
      ),
      mainPanel(
        h1("Circos"),
        tabPanel("Circos Plot",plotOutput("my_circos", width=800, height=800))
      )
    )
  ),
  tabPanel(
    title="Detailed Top 5 Plots",
    sidebarLayout(
      sidebarPanel(
        width=3,
        h1("Pick a Plot to look at"),
        shiny::selectInput(
          inputId = "data_Top5_choice",
          label = "Plot choice",
          choices =c("Number 1 Trait Group",
                     "Number 2 Trait Group",
                     "Number 3 Trait Group",
                     "Number 4 Trait Group",
                     "Number 5 Trait Group",
                     "Other Gene Expression Change")
          
        )
      ),
      mainPanel(
        tabPanel("Plot",plotOutput("Top5_plot", height=2000, width=600))
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
  
  
  output$Top5_plot = renderPlot({
    g = rv_top5$Top5_choice_by_user
    g
  })
  
  # my_circos2 = renderPlot({
  #   circos.clear()
  #   circos.par( start.degree = 90 ) 
  #   chordDiagram(test2, 
  #                annotationTrackHeight = c(0.01, 0.01), 
  #                annotationTrack = "grid",
  #                big.gap =15,
  #                #small.gap = 1,
  #                column.col = grid_col_trait, # or col_mat
  #                grid.col = grid_col_trait,
  #                diffHeight = mm_h(5), 
  #                # (length(unique(simple_LUT$tissue_group)))
  #                preAllocateTracks = list(track.height = 0.2*max(strwidth(unlist(dimnames(test3))))),
  #                transparency = 0.5,
  #                order = c(rownames(test2), rev(colnames(test2)))
  #   )
  #   circos.track(track.index = 1, panel.fun = function(x, y) {
  #     circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index, 
  #                 facing = "clockwise", niceFacing = TRUE, adj = c(-0.2, 0.5), cex =0.5)
  #   }, bg.border = NA)
  # })
  # 
  # 
  # 
  # 
  # 
  # my_circos3 = renderPlot({
  #   circos.clear()
  #   circos.par( start.degree = 90 ) 
  #   chordDiagram(test3, 
  #                annotationTrackHeight = c(0.01, 0.01), 
  #                annotationTrack = "grid",
  #                big.gap =15,
  #                #small.gap = 1,
  #                column.col = grid_col_trait, # or col_mat
  #                grid.col = grid_col_trait,
  #                diffHeight = mm_h(5), 
  #                # (length(unique(simple_LUT$tissue_group)))
  #                preAllocateTracks = list(track.height = 0.2*max(strwidth(unlist(dimnames(test3))))),
  #                transparency = 0.5,
  #                order = c(rownames(test3), rev(colnames(test3)))
  #   )
  #   circos.track(track.index = 1, panel.fun = function(x, y) {
  #     circos.text(CELL_META$xcenter, CELL_META$ylim[1], CELL_META$sector.index, 
  #                 facing = "clockwise", niceFacing = TRUE, adj = c(-0.2, 0.5), cex =0.5)
  #   }, bg.border = NA)
  # })
  
}

shinyApp(ui = ui, server = server)
