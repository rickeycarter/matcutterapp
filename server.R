library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    output$frameplot <- renderPlot({
        
        ## make frame df
        x1 <- 0
        x2 <- input$width_frame
        y1 <- 0
        y2 <- input$height_frame
        
        
        
        ## append the df to include the mat positioning
        mathalfwidth <- (input$width_photo)/2
        mathalfheight <- (input$height_photo)/2
        
        mx1 <- x2 / 2 - mathalfwidth
        mx2 <- x2 / 2 + mathalfwidth
        
        my1 <- y2 / 2 - mathalfheight + input$bottom_weight
        my2 <- y2 / 2 + mathalfheight + input$bottom_weight
        
        bx1 <- mx1 - input$buffer_photo
        bx2 <- mx2 + input$buffer_photo
        by1 <- my1 - input$buffer_photo
        by2 <- my2 + input$buffer_photo
        
        xlow <- c(x1, bx1, mx1)
        xhigh <- c(x2,  bx2, mx2)
        ylow <- c(y1, by1, my1)
        yhigh <- c(y2, by2, my2)
        
        framedf <- data.frame(xlow,xhigh,ylow,yhigh)
        
   p1 <- ggplot(data=framedf) + 
       geom_rect(xmin=xlow, xmax=xhigh, ymin=ylow, ymax=yhigh, fill=c("white", "grey70", "black")) +
       ylim(0, input$height_frame) +
       xlim(0, input$height_frame)
   
   return(p1)
    })

})
