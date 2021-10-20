#import

library(ggplot2)

# #beginning

head(cars)
# Layers of my Plot(DATA, Aesthetic, Geometry, Trend)
ggplot(cars) + aes(x=speed, y=dist)+geom_point() + geom_smooth(method="lm") +
labs(title="Stopping Distance of Old Cars", x="Speed(MPH)", y="Feet(ft)")
# # #GENES
url <- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes <- read.delim(url)
head(genes)
nrow(genes)
colnames(genes)
ncol(genes)
table(genes$State)
round( table(genes$State)/nrow(genes) * 100, 2 )

p <- ggplot(genes) + 
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()

p<-p+ scale_colour_manual( values=c("blue","gray","red") )

p<-p+labs(title="Gene Expressions Changes Upon Drug Treatment ", x="Control(no drug)", y="Drug Treatement")
p
#Gapminder with plotly
library(gapminder)
library(plotly)
head(gapminder)
ggplot(gapminder) + aes(x=year,y=lifeExp, col=continent) + geom_jitter(width=0.3,alpha=0.2) + 
  geom_violin(aes(group=year),alpha=0.2,draw_quantiles = 0.5)
#ggplotly()

#Combining Plots
library(patchwork)
p1 <- ggplot(mtcars) + geom_point(aes(mpg, disp))
p2 <- ggplot(mtcars) + geom_boxplot(aes(gear, disp, group = gear))
p3 <- ggplot(mtcars) + geom_smooth(aes(disp, qsec))
p4 <- ggplot(mtcars) + geom_bar(aes(carb))
r=(p1 | p2 | p3) /p4
r

