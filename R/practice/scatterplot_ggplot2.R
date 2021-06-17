########################################################################################
# Use the mtcars data set for exploring and learning ggplot2 for graphing.
#
# Scatterplot
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
myplot <- ggplot(data = mtcars, mapping = aes(x=gear, y=mpg, fill = factor(vs)))
                                              

# Setting scatter plot point properties
myplot <- myplot + geom_point(shape = 21, alpha = 0.5, size = 2)

# setting values for colour and fill
cols <- c("0" = "red", "1" = "blue") # creating colours
myplot <- myplot + scale_colour_manual(values = cols, aesthetics = c("fill"))



# Changing/updating title related parameters
myplot <- myplot + labs(title = "MTCARS: Gears vs Mpg by VS") +  # Setting title
                    theme(plot.title = element_text(lineheight = 0.9, # Setting title height
                          color="red",              # setting text color
                          size=20,                  # setting text font
                          face="bold.italic",       # setting text style
                          hjust = 0.5))             # setting text position

# Changing/updating x & y axis related parameters
myplot <- myplot + labs(x = "Gears",       # setting x-axis name
                        y = "Mpg") +  # Setting y-axis name
                  theme(axis.title.x = element_text(lineheight = 1.5, # Setting title height
                                      color="green",            # setting text color
                                      size=22,                  # setting text font
                                      face="bold.italic",       # setting text style
                                      hjust = 0.5),
                        axis.title.y = element_text(lineheight = 1.5, # Setting title height
                                        color="green",            # setting text color
                                        size=22,                  # setting text font
                                        face="bold.italic",       # setting text style
                                        hjust = 0.5))


# Changing/updating legend related parameters
myplot <- myplot +  guides(fill = guide_legend(title = "VS",         # legend title
                                              title.position = "top",   # position
                                              title.hjust = 0.5,        # justfy text to midle
                                              title.theme =
                                                element_text(size = 14,    # font size
                                                        face = "bold",     # text style
                                                        colour = "orange"  # text color
                                                        ))) +
                    theme(legend.direction = "horizontal",
                          legend.position = c(.92, .93))   # Setting position of legend on the chart


 
 
# Setting x & y-axis correctly ticks correctly
myplot <- myplot + scale_y_continuous(breaks = seq(from=10, to=40, by=5)) +
                    scale_x_continuous(breaks = c(3,4,5)) +
                    theme(text=element_text(size=21))    # changing font of tick labels


 

myplot































