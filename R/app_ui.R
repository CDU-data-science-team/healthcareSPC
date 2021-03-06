#' The application User-Interface
#' 
#' @param request Internal parameter for `{shiny}`. 
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # List the first level UI elements here 
    fluidPage(
      mod_select_sigma_filter_ui("select_sigma_filter_ui_1"),
      tabsetPanel(
        id = "tabset", 
        tabPanel("Acuity", value = "acuity",
                 mod_facet_graph_ui("facet_graph_ui_1")
        ),
        tabPanel("Diagnosis", value = "diagnosis",
                 mod_facet_graph_ui("facet_graph_ui_2")
        ),
        tabPanel("Chief complaint", value = "complaint",
                 mod_facet_graph_ui("facet_graph_ui_3")
        ),
        tabPanel("Compare", value = "compare",
                 mod_single_double_graph_ui("single_double_graph_ui_1")
        )
      )
    )
  )
}

#' Add external Resources to the Application
#' 
#' This function is internally used to add external 
#' resources inside the Shiny application. 
#' 
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function(){
  
  add_resource_path(
    'www', app_sys('app/www')
  )
  
  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys('app/www'),
      app_title = 'healthcareSPC'
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert() 
  )
}

