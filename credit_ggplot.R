#library(ggplot2)
#library(readxl)
#install.packAges("xlsx")
getwd()
##.......Chapter 2.....GGPLOT........##
## hdataset <-read.csv(data)
## Data 
## hdataset <- read.csv(file="C:/Rprojects/KNN/data.csv", header=TRUE)
rm(credit_ds)
credit_ds <- read_excel("credit.xlsx")
summary(credit_ds)
str(credit_ds)
## GGplot
ggplot(credit_ds, aes(x = Age, y = Credit_Amount)) +geom_point()
ggplot(credit_ds, aes(x = Age, y = Credit_Amount)) +geom_point(color="blue")
ggplot(credit_ds, aes(Age,Credit_Amount))+geom_point(color="purple")
# something wrong in the plot ....
ggplot(credit_ds, aes(Age)) +geom_histogram()
ggplot(credit_ds, aes(Age,Credit_Amount)) + geom_boxplot()
# Heart_Attack_Diagnosis = Age
# Serum_Credit_Amountesterol = Credit_Amount 

## `stat_bin()` using `bins = 30`. Pick better value with `binwidth`.
ggplot(credit_ds,aes(Age))+geom_bar(colour="Green ")

# Additional aesthetical componenets like color,shape can be added. 
# Color added to depict 1: Absence 2: Presence of heart risk 
ggplot(credit_ds, aes(Age,Credit_Amount,colour=Age))+geom_point()

#Facetting used to replicate the display for the two groups:
# 1 Absence of Risk 2 Presence of Risk 
ggplot(credit_ds,aes(Account_Balance,Credit_Amount))+geom_point(color="green")+facet_wrap(~Creditability)

# Adding another layer,a smoother over the Age-Credit_Amountesterol plot 
ggplot(credit_ds,aes(Age, Credit_Amount))+geom_point(colour="brown")+geom_smooth()
#`geom_smooth()` using method = 'loess' and formula 'y ~ x'


# Span parameter helps overlay a fitted curve on the scatterplot using the de fualt loess method and then linear model.
# Possibly overfitted. 
ggplot(credit_ds,aes(Age,Credit_Amount))+geom_point(colour="red")+geom_smooth(span=0.15)
## `geomsmooth()` using method = 'loess' and formula 'y ~ x'

ggplot(credit_ds,aes(Age,Credit_Amount))+geom_point(colour="red")+geom_smooth(span=1.25)
## `geom_smooth()` using method = 'loess' and formula 'y ~ x'

ggplot(credit_ds,aes(Age,Credit_Amount))+geom_point(colour="purple")+geom_smooth(method="lm")

#Facetting used to replicate the display for the two groups:
# 1 Absence of Risk 2 Presence of Risk 
ggplot(credit_ds,aes(Credit_Amount,colour=Age))+geom_freqpoly(binwidth=1)

ggplot(credit_ds,aes(Credit_Amount,colour=Age))+geom_histogram(binwidth=.9)+facet_wrap(~Age,ncol=1)

# Error: StatBin requires a continuous x variable: the x variable is discrete. Perhaps you want stat="count"?
# Sum up the answer from the comments above:
# 1 - Replace geom_histogram(binwidth=0.5) with geom_bar(). However this way will not allow binwidth customization.
# 2 - Using stat_count(width = 0.5) instead of geom_bar() or geom_histogram(binwidth = 0.5) would solve it.
ggplot(credit_ds,aes(Credit_Amount,colour="Yellow"))+geom_bar()

ggplot(credit_ds,aes(Credit_Amount,colour=Age))+stat_count(width = 0.5)+facet_wrap(~Creditability,ncol=2)
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
