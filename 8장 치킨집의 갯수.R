setwd("C:/Users/Kim Jung Hun/Desktop/책 예제")

# 데이터 가공
library("readxl")
ck <- read_excel("치킨집_가공.xlsx")
head(ck)
addr <- substr(ck$소재지전체주소,11,16)
head(addr)
addr_num <- gsub("[0-9]","",addr) # 숫자 제거
addr_trim <- gsub(" ", "",addr_num) # 공백 제거 
head(addr_trim)

# 동별 업소 갯수 확인하기
library(dplyr)
addr_count <- addr_trim %>% table() %>% data.frame() # 도수분포표 작성후 데이터프레임으로 변환 
head(addr_count)

# 트리맵으로 표현하기
# treemap(데이터 세트,index = 구분 열,vsize = 분포 열, vcolor = 색상, title = 제목)
install.packages("treemap")
library(treemap)
treemap(addr_count,index=".",vSize="Freq",title="서대문구 동별 치킨집 분포포")
arrange(addr_count,desc(Freq)) %>% head()
