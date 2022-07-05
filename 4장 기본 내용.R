## 가로로 긴 데이터 모양을 세로로 전환하는 함수
# melt(데이터 세트, id.var="기준 열",measure.vars="변환 열")
head(airquality)
names(airquality) <- tolower(names(airquality)) # 변수의 이름을 소문자로 바꾸기
head(airquality)

# 패키지 설치 및 로드
install.packages("reshape2")
library(reshape2)

melt_test <- melt(airquality)
head(melt_test)
tail(melt_test)

melt_test2 <- melt(airquality,id.vars=c("month","wind"),measure.vars = "ozone") # 월과 바람을 기준 
head(melt_test2)

# 결과 비교
View(airquality)
View(melt_test)
View(melt_test2)


## 가로로 긴 데이터 모양을 세로로 전환하는 함수
# dcast(데이터세트, 기준열~변환열)
aq_melt <- melt(airquality,id=c("month","day"),na.rm=TRUE)
head(aq_melt)
aq_dcast <- dcast(aq_melt,month+day~variable)
head(aq_dcast)

# 결과 비교
View(airquality)
View(aq_melt)
View(aq_dcast)

# acast(데이터세트,기준열~변환열~분리 기준열)
acast(aq_melt,day~month~variable)

## 데이터를 평균으로 요약
acast(aq_melt,month~variable,mean)

