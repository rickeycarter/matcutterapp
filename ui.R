
library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Mat and Photograph Layout Options"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("width_photo",
                        "Photo width, CM:",
                        min = 10,
                        max = 50,
                        value = 20),
            sliderInput("height_photo",
                        "Photo height, CM:",
                        min = 10,
                        max = 50,
                        value = 30),
            sliderInput("width_frame",
                        "Frame width, CM:",
                        min = 10,
                        max = 75,
                        value = 30),
            sliderInput("height_frame",
                        "Frame width, CM:",
                        min = 10,
                        max = 75,
                        value = 40),
            sliderInput("buffer_photo",
                        "Buffer between mat and photo, CM:",
                        min = 1,
                        max = 15,
                        value = 1),
            sliderInput("bottom_weight",
                        "Vertical Shift, CM:",
                        min = -25,
                        max = 25,
                        value = 0)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("frameplot")
        )
    )
))
