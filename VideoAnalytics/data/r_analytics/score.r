# -----------------------------
# predict single values (for streams)

# input values
#   area
#   sum_ch1
#   sum_ch2
#   sum_ch3

# calc discrete numbers
cut_area=c(0,500,5980,50000)
lab_area=c('none','small','large')
cut_ch1=c(0   , 50000 , 100000, 500000, 1000000, 2000000, 3000000, 7000000)
lab_ch1=c('no red','low red', 'low2 red', 'med red', 'med2 red', 'full red', 'full2 red')
cut_ch2=c(0   , 50000 , 100000, 500000, 1000000, 2000000, 3000000, 7000000)
lab_ch2=c('no green','low green', 'low2 green', 'med green', 'med2 green', 'full green', 'full2 green')
cut_ch3=c(0   , 50000 , 100000, 500000, 1000000, 2000000, 3000000, 7000000)
lab_ch3=c('no blue','low blue', 'low2 blue', 'med blue', 'med2 blue', 'full blue', 'full2 blue')

area2=cut(area,cut_area,labels=lab_area,include.lowest = TRUE)
sum_ch1_2=cut(sum_ch1,cut_ch1,labels=lab_ch1,include.lowest = TRUE)
sum_ch2_2=cut(sum_ch2,cut_ch2,labels=lab_ch2,include.lowest = TRUE)
sum_ch3_2=cut(sum_ch3,cut_ch3,labels=lab_ch3,include.lowest = TRUE)
t=data.frame(area2,sum_ch1_2,sum_ch2_2,sum_ch3_2)

# predict
p=predict(m,t)

# results
prop=max(p[1,])
if(prop < 0.7) {pred='unknown'} else {pred=names(which.max(p[1,]))}