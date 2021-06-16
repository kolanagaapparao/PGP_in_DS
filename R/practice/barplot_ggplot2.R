########################################################################################
# Use the mtcars data set for exploring and learning ggplot2 for graphing.
#
# BOXPLOT
# 
#########################################################################################

library("ggplot2")

#####
# GRAPHICAL PRIMITIVES
#####

head(mtcars)
dim(mtcars)


#####
# TWO VARIABLES - continuous x , continuous y
#####

# map variables in the data to visual properties of the geom
# factor(gear) is done to convert the continuous value into descete/levels to pick colors
myplot <- ggplot(data = mtcars, mapping = aes(x=vs))

# Represent x & y data with points
myplot <- myplot + geom_bar(position = "stack", aes(fill=factor(gear)))

# Setting colot pallette manually
# myplot <- myplot + scale_color_manual(values = c("#B84C90", "#2E33B3", "#31993F"))

# Changing/updating title related parameters
myplot <- myplot + labs(title = "MTCARS: VS Count by Gears") +  # Setting title
                    theme(plot.title = element_text(lineheight = 0.9, # Setting title height
                          color="red",              # setting text color
                          size=20,                  # setting text font
                          face="bold.italic",       # setting text style
                          hjust = 0.5))             # setting text position

# Changing/updating x & y axis related parameters
myplot <- myplot + labs(x = "VS",       # setting x-axis name
                        y = "Count") +  # Setting y-axis name
                  theme(axis.title.x = element_text(lineheight = 1.5, # Setting title height
                                      color="green",            # setting text color
                                      size=14,                  # setting text font
                                      face="bold.italic",       # setting text style
                                      hjust = 0.5),
                        axis.title.y = element_text(lineheight = 1.5, # Setting title height
                                        color="green",            # setting text color
                                        size=14,                  # setting text font
                                        face="bold.italic",       # setting text style
                                        hjust = 0.5))                          


# Changing/updating legend related parameters
myplot <- myplot +  guides(fill = guide_legend(title = "GEARS",         # legend title
                                              title.position = "top",   # position
                                              title.hjust = 0.5,        # justfy text to midle
                                              title.theme =
                                                element_text(size = 14,    # font size
                                                        face = "bold",     # text style
                                                        colour = "orange"  # text color
                                                        ))) +
                    theme(legend.direction = "horizontal",
                          legend.position = c(.89, .92))   # Setting position of legend on the chart
  
  


# Setting x & y-axis correctly ticks correctly
myplot <- myplot + scale_y_continuous(breaks = seq(from=0, to=20, by=2)) + 
                    scale_x_continuous(breaks = c(0,1)) + 
                    theme(text=element_text(size=21))    # changing font of tick labels




myplot































