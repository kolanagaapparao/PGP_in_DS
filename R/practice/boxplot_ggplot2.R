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
myplot <- ggplot(data = mtcars, mapping = aes(x=mpg, y=disp))

# Represent x & y data with points
myplot <- myplot + geom_boxplot(aes(fill=factor(gear)))

# Setting colot pallette manually
# myplot <- myplot + scale_color_manual(values = c("#B84C90", "#2E33B3", "#31993F"))


# Changing/updating title related parameters
myplot <- myplot + labs(title = "MTCARS: mpg vs disp") +  # Setting title
                    theme(plot.title = element_text(lineheight = 0.9, # Setting title height
                          color="red",              # setting text color
                          size=20,                  # setting text font
                          face="bold.italic",       # setting text style
                          hjust = 0.5))             # setting text position

# Changing/updating x & y axis related parameters
myplot <- myplot + labs(x = "Miles Per Gallon",       # setting x-axis name
                        y = "MTCARS: mpg vs disp") +  # Setting y-axis name
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
                          legend.position = c(.89, .92))
  
  


myplot































