library(ggplot2)

baseball2010 <- read.csv('/home/gsturrock/Downloads/2010baseball.csv', header = TRUE)

##Create Scatter Plot comparing Wins and Payroll
#http://www.cookbook-r.com/Graphs/Scatterplots_(ggplot2)/
#ggplot(data = baseball2010, aes(x=Wins, y=Payroll)) +geom_point(shape=1) +geom_smooth(method = lm, se=FALSE)
ggplot(data = baseball2010, aes(x=Wins, y=Payroll)) +geom_point(shape=1) +geom_smooth(method = lm)

# Calculate Correlation Coefficient
#http://www.sthda.com/english/wiki/correlation-test-between-two-variables-in-r
cor(baseball2010$Wins, baseball2010$Payroll, method = 'pearson')
cor.test(baseball2010$Wins, baseball2010$Payroll, method = 'pearson')

# Remove San Diego from data set and recalculate correlation coefficient
noSD <- subset(baseball2010, Team != 'SD')
cor.test(noSD$Wins, noSD$Payroll, method = 'pearson')
ggplot(data = noSD, aes(x=Wins, y=Payroll)) +geom_point(shape=1) +geom_smooth(method = lm)