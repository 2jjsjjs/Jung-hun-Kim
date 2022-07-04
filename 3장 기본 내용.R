## 1. 데이터 파악 
# 데이터 파악 함수(view,str,dim,ls)
install.packages("readxl")
library(readxl)
ex_data1 <- readxl::read_excel("C:/Users/Kim Jung Hun/Desktop/책 예제/Sample1.xlsx")
View(ex_data1)
str(ex_data1)
dim(ex_data1)
ls(ex_data1)

# 변수명 변경하기
install.packages("dplyr")
library(dplyr)
ex_data1 <- rename(ex_data1,Y17_AMT=AMT17,Y16_AMT=AMT16)

# 파생 변수 생성하기
ex_data1$AMT <- ex_data1$Y16_AMT+ex_data1$Y17_AMT
ex_data1$CNT <- ex_data1$Y16_CNT+ex_data1$Y17_CNT
View(ex_data1)

ex_data1$AVG_AMT <- exdata$AMT / exdata$CNT
View(ex_data1)

# 변수 변환
ex_data1$AGE50_YN <- ifelse(ex_data1$AGE >= 50, "Y","N")
View(ex_data1)

# ifelse(조건절,참일때의 값, 거짓일 때의 값)
ex_data1$AGE_GR10 <- ifelse(ex_data1$AGE >= 50, "A1.50++",
                        ifelse(ex_data1$AGE >= 40, "A2.4049",
                            ifelse(ex_data1$AGE >= 30, "A3.3039",
                                ifelse(ex_data1$AGE >= 20, "A4.2029",
                                            "A5.0019"))))
View(ex_data1)

# 변수 추출
ex_data1 %>% select(ID)
ex_data1 %>% select(ID,AREA,Y17_CNT)

# 선택한 변수를 제외하고 추출하기
ex_data1 %>% select(-AREA)
ex_data1 %>% select(-AREA,-Y17_CNT)

# 조건에 맞는 값만 추출하기
ex_data1 %>% filter(AREA == "서울")
ex_data1 %>% filter(AREA == "서울" & Y17_CNT >= 10)

# 오름차순 정렬
ex_data1 %>% arrange(AGE)
# 내림차순 정렬
ex_data1 %>% arrange(desc(Y17_AMT))
# 변수 중첩 정렬하기
ex_data1 %>% arrange(AGE,desc(Y17_AMT))

# 합계를 도출하는 summarise함수
ex_data1 %>% summarise(TOT_Y17_AMT=sum(Y17_AMT))
# 그룹별 합계 도출
ex_data1 %>% group_by(AREA) %>% summarise(SUM_Y17_AMT = sum(Y17_AMT))

# 데이터 결합하기
library(readxl)
m_history <- readxl::read_excel("C:/Users/Kim Jung Hun/Desktop/책 예제/Sample2_m_history.xlsx")
f_history <- readxl::read_excel("C:/Users/Kim Jung Hun/Desktop/책 예제/Sample3_f_history.xlsx")

# 데이터 세트를 세로 결합하기
exdata_bindjoin <- bind_rows(m_history,f_history)
View(exdata_bindjoin)
# 데이터 세트를 가로 결합하기
left_join() # 지정된 변수와 데이터 세트 1을 기준으로 데이터 세트 2에 있는 나머지 변수를 결합
inner_join() # 데이터 세트 1과 데이터 세트 2에서 기준으로 지정한 변수 값이 동일 할 때만 결합
full_join() # 데이터 세트 1과 데이터 세트 2에서 기준으로 지정한 변수값 전체를 결합

jeju_y17_history <- readxl::read_excel("C:/Users/Kim Jung Hun/Desktop/책 예제/Sample4_y17_history.xlsx")
jeju_y16_history <- readxl::read_excel("C:/Users/Kim Jung Hun/Desktop/책 예제/Sample5_y16_history.xlsx")
View(jeju_y17_history)
View(jeju_y16_history)
bind_col <- left_join(jeju_y17_history,jeju_y16_history,by="ID") # a-b
bind_col_inner <- inner_join(jeju_y17_history,jeju_y16_history,by="ID") # a교b
bind_col_full <- full_join(jeju_y17_history,jeju_y16_history,by="ID") # a합b
View(bind_col)
View(bind_col_inner)
View(bind_col_full)

# 결측값이 있는지 없는지 
is.na()

# 빈도 분석 
install.packages("descr")
library(descr)
freq_test <- freq(ex_data1$AREA,plot=F)
freq_test

# 줄기 잎 그림
stem(ex_data1$AGE)

# 히스토그램
hist(ex_data1$AGE)
# X축과 Y축을 직접 바꿔봄
hist(ex_data1$AGE,xlim=c(0,60),ylim=c(0,5),main="AGE분포")
# 막대그래프
dist_sex <- table(ex_data1$SEX)
barplot(dist_sex)
barplot(dist_sex,ylim=c(0,8),main="BARPLOT",xlab="SEX",ylab="FREQUENCY",names=c("FEMALE","MALE"),col=c("pink","navy"))
# 상자 그림
boxplot(ex_data1$Y17_CNT,ex_data1$Y16_CNT)

# 상자그림 변형
boxplot(ex_data1$Y17_CNT,ex_data1$Y16_CNT,ylim=c(0,60),main="boxplot",names=c("17년건수","16년건수"))
boxplot(ex_data1$Y17_CNT,ex_data1$Y16_CNT,ylim=c(0,60),main="boxplot",names=c("17년건수","16년건수"),col=c("green","yellow"))


