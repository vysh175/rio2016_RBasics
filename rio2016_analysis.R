# 🏅 Project: Rio 2016 Olympics Medal Analysis
# Author: Vyshnavi C
# Date: November 2025
# Description: 
# This R script analyzes the Rio 2016 Olympics medal data.
# It demonstrates basic R concepts such as variables, data types,
# data structures (vectors, matrices, lists, and data frames),
# importing CSV files, filtering, and creating visualizations.

rio2016Medals<-read.csv("/Users/vyshnavic/Downloads/Rio2016_2.csv", header=TRUE)
# Load the Rio 2016 Olympics medal data from the CSV file into R
# 'rio2016Medals' is now a data frame containing all the data
# 'header = TRUE' tells R that the first row of the CSV contains column names
#Rio 2016 Medals Analysis 
#Author: VYSHNAVI CHANDRU
#Purpose: A beginner project to explore the Rio 2016 Olympics medal data using R basic 

#______________________________________________________________________________________
#Basic Variables and Data Types
#______________________________________________________________________________________
country <- "USA" #CHARACTER TYPE
gold_medals <- 46 #NUMERIC TYPE
silver_medals <- 37 
bronze_medals <- 38
total_medals <- gold_medals + silver_medals + bronze_medals #ARITHMETIC OPERATOR

#PRINT THE TOTAL MEDALS
print(paste("Total Medals Won by", country, "=", total_medals))

#_______________________________________________________________________________________
#DATA STRUCTURE IN R
#_______________________________________________________________________________________

#VECTOR (ONE-DIMENSIONAL)
gold <- c(46,27,26,19,17)
silver <- c(37,23,18,18,10)
bronze <- c(38,17,26,19,15)
countries <- c("USA","UK","China","Russia","Germany")

#MATRIX (TWO-DIMENSIONAL)
medal_matrix <- cbind(gold, silver, bronze)  #COMBINE THE MEDAL COUNTS INTO A SINGLE MATRIX 
colnames(medal_matrix) <- c("Gold","Silver","Bronze")  #ASSIGN MEDAL NAMES TO EACH COLUMN 
rownames(medal_matrix) <- countries     #ASSIGN COUNTRY NAMES TO EACH ROW
print(medal_matrix) 

#LIST (COLLECTION OF DIFFERENT STRUCTURES)
olympic_list <- list(Countries = countries, Gold = gold, Silver = silver, Bronze = bronze)
print(olympic_list)

#________________________________________________________________________________________
#WORKING WITH DATA FRAMES 
#________________________________________________________________________________________

#VIEW FIRST FEW ROWS
head(rio2016Medals)

#CHECK THE STRUCTURE OF THE DATASET 
str(rio2016Medals)

#_________________________________________________________________________________________
#BASIC ANALYSIS 
#_________________________________________________________________________________________

#DISPLAY SUMMARY STATISTICS 
summary(rio2016Medals)

#FILTER: COUNTRIES WITH MORE THAN 20 GOLD MEDALS 
top_gold <- rio2016Medals[rio2016Medals$Gold > 20,]
print(top_gold)

#COMPUTE TOTAL MEDALS MANUALLY 
rio2016Medals$Total <- rio2016Medals$Gold + rio2016Medals$Silver + rio2016Medals$Bronze

#SORT DATA BY TOTAL MEDALS 
rio_sorted <- rio2016Medals[order(-rio2016Medals$Total), ]
head(rio_sorted)

#___________________________________________________________________________________________
#TOTAL  AND SUMS 
#___________________________________________________________________________________________

#TOTAL MEDALS BY COPUNTRY ALREADY COMPUTED ABOVE 

#COMPUTE TOTAL MEDALS ACROSS ALL COUNTRIES 
total_gold <- sum(rio2016Medals$Gold)
total_silver <- sum(rio2016Medals$Silver)
total_bronze <- sum(rio2016Medals$Bronze)

cat("Total medals across all countries: \nGold:", total_gold, "\nSilver:", total_silver, "\nBronze:", total_bronze)

#_____________________________________________________________________________________________
#BASIC VISUALISATION 
#_____________________________________________________________________________________________

#BARPLOT FOR TOP 10 COUNTRIES 
# Save the bar plot as an image in the "plots" folder
png("plots/top10_barplot.png", width = 800, height = 600)
par(mar = c(8, 5, 5, 2))  # Increase bottom margin to 8 lines
top10 <- rio_sorted[1:10, ]

bp <- barplot(top10$Total, names.arg = FALSE, col = "lightsteelblue", 
              border = "white", main = " Top 10 Countries by Total Medals  - Rio 2016", 
              xlab = "Country", ylab = "Medals", las = 2, font.main = 2, font.lab = 2)

#ADD MEDAL COUNT LABELS
text(x = bp,
     y = par("usr")[3]-3,   #PLACES TEXT BELOW X AXIS
     labels = top10$Country, 
     xpd = TRUE,            #ALLOWS TEXT OUTSIDE PLOT AREA 
     cex = 0.8,             #TEXT SIZE
     srt = 45,              #ROTATE 45 DEGREES 
     adj = 1,               #RIGHT ALIGN TEXT
     col = "black")         #TEXT COLOUR

#ADD A LIGHT GRID FOR CLARITY
abline(h = seq(0, max(top10$Total), by = 20), col = "gray90", lty = 2)
dev.off()
