library(readxl)
dustdata <- read_excel("dustdata.xlsx")
View(dustdata)
str(dustdata)

library(dplyr)
dustdata_anal <- dustdata %>% filter(area %in% c("성북구","중구")) # %in% 는 2개이상의 데이터를 추출하고 싶을때 쓰인다.
View(dustdata_anal)

# 데이터 현황 파악하기
count(dustdata_anal,yyyymmdd) %>% arrange(desc(n))
count(dustdata_anal,area) %>% arrange(desc(n))

# 데이터 분리 
dust_anal_area_sb <- subset(dustdata_anal,area=="성북구")
dust_anal_area_jg <- subset(dustdata_anal,area=="중구")

# 기초 통계량 
install.packages("psych")
library(psych)

# boxplot을 통한 분포 차이 확인 
boxplot(dust_anal_area_sb$finedust , dust_anal_area_jg$finedust, main="finedust_compare" ,xlab= "area" , names=c("성북구","중구"),ylab="finedust_pm",col=c("blue","green"))
t.test(data=dustdata_anal, finedust~area,var.equal=T)
## 미세먼지 평균 차이 결과 성북구가 중구보다 더 큰것으로 확인된다.

