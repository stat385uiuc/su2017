## ----setup, include=FALSE------------------------------------------------
options(width = 60)
knitr::opts_chunk$set(echo = TRUE, cache = TRUE)

## ---- echo = F, message=F, cache = FALSE---------------------------------
library("shiny")

## ----movie_explorer, out.width = "225px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/movie_explorer.png")

## ----hello_shiny, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/hello_shiny.png")

## ----eval = F------------------------------------------------------------
## # install.packages("shiny") # Install if on local
## library(shiny)              # Load Shiny
## runExample("01_hello")      # Run above example

## ----new_project, out.width = "150px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/new_project.png")

## ----new_directory, out.width = "225px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/new_directory.png")

## ----shiny_project, out.width = "225px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/shiny_project.png")

## ----name_shiny, out.width = "225px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/name_shiny.png")

## ----shiny_app_load, out.width = "225px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/shiny_app_load.png")

## ----run_app, out.width = "150px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/run_app.png")

## ----running_example, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/project/running_example.png")

## ----r_talks_to_web_browser, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/r_talks_to_web_browser.png")

## ----backend_v_frontend, out.width = "175px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/frontend_v_backend.jpg")

## ----basic_ui, eval = F--------------------------------------------------
## shinyUI(      # Initialize a UI container in Shiny
##   fluidPage() # Make a page layout
## )

## ----basic_server, eval = F----------------------------------------------
## shinyServer(                # Initialize Server
##   function(input, output) { # Input and output
##   }
## )

## ----blank_shiny, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/blank_shiny.png")

## ----ui_content, eval = F------------------------------------------------
## shinyUI(
##   fluidPage(
##     titlePanel("My Shiny App Title"), # Title
## 
##     sidebarLayout(
## 
##       sidebarPanel(
##         h1("SideBar Title")           # Sidebar Text
##         ),                            # Note HTML
## 
##       mainPanel("Main Content")       # Content Text
##     )
##   )
## )

## ----content_interface, out.width = "300px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/content_interface.png")

## ----ui_widgets, eval = F------------------------------------------------
## sidebarLayout(
##   sidebarPanel(
##     h3("Data Selection"),             # Note the ,
## 
##     # Dropdown
##     selectInput("ds",                 # Name
##                 "Choose a dataset:",  # Label
##                 choices = c("iris", "Spam", "mtcars")),
## 
##     numericInput("obs",               # Name
##                  "Number of Obs:",    # Label
##                  10),                 # Default Value
## 
##     submitButton("Load Preview Data") # Update data
##   ),
##   mainPanel())# Not Displayed         # Content

## ----load_preview, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/load_preview.png")

## ----eval = F------------------------------------------------------------
## sidebarLayout(
##   sidebarPanel(), # Given previously
##   mainPanel(
##     h3("Head of the Dataset"),    # HTML
##     tableOutput("view"),          # Table View
## 
##     h3("Dataset Summary"),        # HTML
##     verbatimTextOutput("summary") # Output Asis
##   )
## )

## ----roles_implement, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/roles_implement.png")

## ----eval = F------------------------------------------------------------
## library("msos"); library("dataset")
## data("Spam")
## shinyServer(function(input, output) {
## 
##   dsInput = reactive({   # Reactive
##     switch(input$ds,     # Load dataset
##            "iris" = iris,
##            "Spam" = Spam,
##            "mtcars" = mtcars)
##   })
## 
## })

## ----eval = F------------------------------------------------------------
## shinyServer(function(input, output) {
## 
##   ## Hiding data set reactive
## 
##   output$summary = renderPrint({   # Summary Render
##     summary(dsInput())
##   })
## 
##   output$view = renderTable({      # Table Render
##     head(dsInput(), n = input$obs)
##   })
## })

## ----full_app, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/full_app.png")

## ---- eval = F-----------------------------------------------------------
## load("data.rda")            # Once during startup
## 
## shinyServer(                # Once during startup
## 
##   function(input, output) {
##     toad = "Hello"
## 
##     output$test = renderUI({
## 
##     })
##   }
## )

## ---- eval = F-----------------------------------------------------------
## 
## load("data.rda")
## 
## shinyServer(
## 
##   function(input, output) {  # Once per user
##     toad = "Hello"
## 
##     output$test = renderUI({
## 
##     })
##   }
## )

## ---- eval = F-----------------------------------------------------------
## 
## load("data.rda")
## 
## shinyServer(
## 
##   function(input, output) {
##     toad = "Hello"
## 
##     output$test = renderUI({
##                              # Many Times
##     })
##   }
## )

## ----shiny_web_head, out.width = "250px", fig.retina = NULL, fig.align='center', cache = TRUE, echo = FALSE----
knitr::include_graphics("img/shiny_web_head.png")

