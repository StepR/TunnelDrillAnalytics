# load decision tree
library(rpart)

# -----------------------------
# load data set
Trainingdata_marked <- read.delim("/home/streamsadmin/workspace/VideoAnalytics/data/r_analytics/Trainingdata_marked.txt", dec=",")

# use only these values for prediction
a=Trainingdata_marked[,3:7]

# -----------------------------
# convert values to discrete with cut
cut_objc=c(-1,0,1,2,3,4,5,6)
lab_objc=c('none','red','green','blue','dark blue', 'yellow','white')
a$objectClass2=cut(a$objectClass,cut_objc,labels=lab_objc,include.lowest = TRUE)

cut_area=c(0,500,5980,50000)
lab_area=c('none','small','large')
a$area2=cut(a$area,cut_area,labels=lab_area,include.lowest = TRUE)

cut_ch1=c(0   , 50000 , 100000, 500000, 1000000, 2000000, 3000000, 7000000)
lab_ch1=c('no red','low red', 'low2 red', 'med red', 'med2 red', 'full red', 'full2 red')
a$sum_ch1_2=cut(a$sum_ch1,cut_ch1,labels=lab_ch1,include.lowest = TRUE)

cut_ch2=c(0   , 50000 , 100000, 500000, 1000000, 2000000, 3000000, 7000000)
lab_ch2=c('no green','low green', 'low2 green', 'med green', 'med2 green', 'full green', 'full2 green')
a$sum_ch2_2=cut(a$sum_ch2,cut_ch2,labels=lab_ch2,include.lowest = TRUE)

cut_ch3=c(0   , 50000 , 100000, 500000, 1000000, 2000000, 3000000, 7000000)
lab_ch3=c('no blue','low blue', 'low2 blue', 'med blue', 'med2 blue', 'full blue', 'full2 blue')
a$sum_ch3_2=cut(a$sum_ch3,cut_ch3,labels=lab_ch3,include.lowest = TRUE)

# only use the discrete values
b=data.frame(a$objectClass, a[,6:10])

# -----------------------------
# decision tree - build model
m=rpart(objectClass2 ~ ., b[,2:6])
