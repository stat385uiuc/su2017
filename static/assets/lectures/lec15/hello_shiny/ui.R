library(shiny)

shinyUI(      # Initialize a UI container in Shiny
    fluidPage(
        sidebarLayout(
            sidebarPanel(
                h3("Data Selection"),             # Note the , 
                
                # Dropdown
                selectInput("ds",                 # Name
                            "Choose a dataset:",  # Label
                            choices = c("iris", "Spam", "mtcars")),
                
                numericInput("obs",               # Name
                             "Number of Obs:",    # Label
                             10),                 # Default Value
                
                submitButton("Load Preview Data") # Update data
            ),
            mainPanel(
                h3("Head of the Dataset"),    # HTML
                tableOutput("view"),          # Table View
                
                h3("Dataset Summary"),        # HTML
                verbatimTextOutput("summary") # Output
            )
            )       
    ) # Make a page layout
)





