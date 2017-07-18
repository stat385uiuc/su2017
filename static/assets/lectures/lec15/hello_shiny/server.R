data("Spam", package = "msos")

library(shiny)

shinyServer(                # Initialize Server
    function(input, output) { # Input and output
        
        dsInput = reactive({   # Reactive
            switch(input$ds,     # Load dataset
                   "iris" = iris,
                   "Spam" = Spam,
                   "mtcars" = mtcars)
        })
        
        
        output$summary = renderPrint({   # Summary Render
            summary(dsInput())
        })
        
        output$view = renderTable({      # Table Render
            head(dsInput(), n = input$obs)
        })
        
    }
)